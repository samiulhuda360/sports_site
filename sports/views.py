from django.core.paginator import Paginator
from django.shortcuts import render
from .models import BlogPost, Category, SiteSetting, Contact
from django.shortcuts import render, get_object_or_404, redirect
from django.contrib.auth.decorators import login_required
from .forms import BlogPostForm
from django.db.models import Count
from django.template import Context, Template
from django.db.models import Count
from datetime import datetime
import requests
from django.http import Http404
from .form import ContactForm
from django.core.mail import send_mail
from django.conf import settings



#API

from rest_framework import viewsets
from .serializers import CategorySerializer, BlogPostSerializer, FileSerializer
from rest_framework.parsers import FileUploadParser
from rest_framework.response import Response
from rest_framework.views import APIView
from rest_framework import status
from django.views.decorators.csrf import csrf_exempt
from rest_framework.decorators import api_view, permission_classes
from rest_framework.permissions import IsAuthenticatedOrReadOnly, IsAuthenticated
from rest_framework.authentication import TokenAuthentication, SessionAuthentication
from django.views.decorators.csrf import csrf_exempt
from django.utils.decorators import method_decorator

COUNTRY_IDS = {
    'England': 44,
    'Spain': 6,
    'France': 3,
    'Germany': 4,
    'Italy': 5,
    'Netherlands': 82,
    'Portugal': 92,
    'Austria': 18,
    'Denmark': 40,
    'Norway': 87,
    'Russia': 95,
    'Sweden': 7,
    'Switzerland': 106,
    'Turkey': 111,
    'Belarus': 22,
    'Belgium': 23,
    'Bosnia and Herzegovina': 26,
    'Croatia': 37,
    'Cyprus': 38,
    'Czech Republic': 39,
    'Estonia': 45,
    'Finland': 48,
    'Greece': 51,
    'Ireland': 61,
    'Israel': 62,
    'Latvia': 70,
    'Lithuania': 73,
    'Luxembourg': 74,
    'Moldova': 79,
    'Montenegro': 81,
    'Northern Ireland': 86,
    'Poland': 91,
    'Romania': 94,
    'Scotland': 98,
    'Serbia': 99,
    'Slovakia': 101,
    'Slovenia': 102,
    'Ukraine': 112,
    'Wales': 119,
    'eurocups': 1
}


def index(request):
    blog_posts = BlogPost.objects.filter(status='published')
    categories = Category.objects.all()
    try:
        posts_per_page = SiteSetting.objects.get(name='sidebar_latest_posts').value
    except SiteSetting.DoesNotExist:
        posts_per_page = 5  # default value if the setting is not found
    all_posts = BlogPost.objects.all()[:int(posts_per_page)]
    if request.method == 'POST':
        form = ContactForm(request.POST)
        if form.is_valid():
            contact = Contact(
                name=form.cleaned_data['name'],
                email=form.cleaned_data['email'],
                subject=form.cleaned_data['subject'],
                phone=form.cleaned_data['phone'],
                message=form.cleaned_data['message'],
            )
            contact.save()

            # Here you can also add the send_mail() function if you want to send an email when the form is submitted
            send_mail(
                subject=form.cleaned_data['subject'],
                message=f"From: {form.cleaned_data['name']} <{form.cleaned_data['email']}>\n\nMessage:\n{form.cleaned_data['message']}",
                from_email=settings.EMAIL_HOST_USER,
                recipient_list=[settings.EMAIL_RECEIVE_USER],
            )

                        # Send confirmation email to user
            send_mail(
                'Confirmation of your message submission',  # subject
                f"Hi {form.cleaned_data['name']},\n\nThank you for your message. We have received your message and will get back to you soon.",  # message
                settings.EMAIL_HOST_USER,  # from email
                [form.cleaned_data['email']],  # to email
            )


            # Redirect to the same page after form submission
            return redirect('index')

    else:
        form = ContactForm()

    context = {
        'blog_posts': blog_posts, # Pass the Page object to the template
        'categories': categories,
        'form': form,
    }
    return render(request, 'sports/index.html', context)


def blog(request):
    blog_posts = BlogPost.objects.filter(status='published')
    categories = Category.objects.all()

    # Paginator setup
    paginator = Paginator(blog_posts, 2) # Show 5 blog posts per page
    page_number = request.GET.get('page') # Get the page number from the request
    page_obj = paginator.get_page(page_number) # Get the Page object for that page number

    context = {
        'page_obj': page_obj, # Pass the Page object to the template
        'categories': categories,
    }
    return render(request, 'sports/blog-grid.html', context)

def category_archive(request, category_slug):
    # Get the Category object with the provided slug
    category = get_object_or_404(Category, slug=category_slug)

    # Get all BlogPosts that are related to this category and order them by date (newest first)
    blog_posts = BlogPost.objects.filter(category=category, status='published').order_by('-post_date')

    # Paginator setup
    paginator = Paginator(blog_posts, 2) # Show 2 blog posts per page
    page_number = request.GET.get('page') # Get the page number from the request
    page_obj = paginator.get_page(page_number) # Get the Page object for that page number

    context = {
        'category': category,
        'page_obj': page_obj, # Pass the Page object to the template
    }
    return render(request, 'sports/category-archive.html', context)


# For Frontend Edit

@login_required
def post_update(request, slug):
    post = get_object_or_404(BlogPost, slug=slug)

    # Ensure the user is the author of the post
    if request.user != post.author:
        return redirect('post_detail', slug=post.slug)  # Or redirect to another page

    # If this is a POST request, we need to process the form data
    if request.method == 'POST':
        form = BlogPostForm(request.POST, instance=post)
        if form.is_valid():
            form.save()
            return redirect('post_detail', slug=post.slug)  # Or redirect to another page
    else:
        form = BlogPostForm(instance=post)

    context = {
        'form': form,
    }

    return render(request, 'sports/post-update.html', context)
    
def blog_post_detail(request, slug):
    post = get_object_or_404(BlogPost, slug=slug)
    categories = Category.objects.annotate(num_posts=Count('blogpost'))

    current_year = datetime.now().year  # Get the current year
    content_string = "{% load age_calculator %}" + post.body
    content_template = Template(content_string)

    # Pass current_year to the context
    post.body = content_template.render(Context({'current_year': current_year}))

    context = {
        'canonical_url': request.build_absolute_uri(),
        'post': post,
        'categories': categories,
    }

    return render(request, 'sports/post_detail.html', context)

def search(request):
    query = request.GET.get('q')
    if query:
        results = BlogPost.objects.filter(title__icontains=query)
    else:
        results = BlogPost.objects.all()
    return render(request, 'sports/search_results.html', {'results': results})


#For API
class CategoryViewSet(viewsets.ModelViewSet):
    authentication_classes = [TokenAuthentication]
    permission_classes = [IsAuthenticated]

    queryset = Category.objects.all()
    serializer_class = CategorySerializer

class BlogPostViewSet(viewsets.ModelViewSet):
    authentication_classes = [TokenAuthentication]
    permission_classes = [IsAuthenticatedOrReadOnly]

    queryset = BlogPost.objects.all()
    serializer_class = BlogPostSerializer




class CsrfExemptSessionAuthentication(SessionAuthentication):

    def enforce_csrf(self, request):
        return  # To not perform the csrf check previously happening

class FileUploadView(APIView):
    authentication_classes = [TokenAuthentication]
    permission_classes = [IsAuthenticatedOrReadOnly]
    parser_class = (FileUploadParser,)

    def post(self, request, *args, **kwargs):
        file_serializer = FileSerializer(data=request.data)
        if file_serializer.is_valid():
            file_serializer.save()
            return Response(file_serializer.data, status=status.HTTP_201_CREATED)
        else:
            return Response(file_serializer.errors, status=status.HTTP_400_BAD_REQUEST)
        

#Matches

def uefa_match_list(request):
    uefa_url = 'https://apiv3.apifootball.com/?action=get_events&from=2023-04-12&to=2023-07-12&league_id=3&APIkey=1c139a365d5356c901ed0e90cd28314e8f54a5136a56800d69447677bd4d7df9'
    response = requests.get(uefa_url)
    jsonresponseuefa = response.json()

    # Initialize an empty list to hold matches
    matches = []

    # Loop through the list of matches
    for match in jsonresponseuefa:

        # Initialize two empty lists to hold home and away goal scorer names
        home_goal_scorer_names = []
        away_goal_scorer_names = []

        # Loop through the list of goal scorers for each match
        for scorer in match['goalscorer']:
            # Check if the home_scorer field is not empty
            if scorer['home_scorer']:
                # Add the home_scorer to the list of home goal scorer names
                home_goal_scorer_names.append(scorer['home_scorer'])
            # Check if the away_scorer field is not empty
            if scorer['away_scorer']:
                # Add the away_scorer to the list of away goal scorer names
                away_goal_scorer_names.append(scorer['away_scorer'])

        # Create a dictionary for the match
        match_dict = {
            'match_info': match,
            'home_goal_scorer_names': home_goal_scorer_names,
            'away_goal_scorer_names': away_goal_scorer_names,
        }

        # Add the match dictionary to the list of matches
        matches.append(match_dict)

    return render(request, 'matches/match-list.html', {'matches': matches, 'jsonresponseuefa':jsonresponseuefa})

def live_score(request):
    live_url = 'https://apiv3.apifootball.com/?action=get_events&match_live=1&APIkey=1c139a365d5356c901ed0e90cd28314e8f54a5136a56800d69447677bd4d7df9'
    response = requests.get(live_url)
    jsonresponselive = response.json()
    return render(request, 'matches/live-score.html', {'jsonresponselive':jsonresponselive})

def specific(request):
    return HttpResponse("Hello, world. You're at the Specific page.")


def country_match(request, country_name):
    country_id = COUNTRY_IDS.get(country_name.capitalize())
    if not country_id:
        raise Http404("Country not found.")
    country_url = f'https://apiv3.apifootball.com/?action=get_leagues&country_id={country_id}&APIkey=1c139a365d5356c901ed0e90cd28314e8f54a5136a56800d69447677bd4d7df9'
    response = requests.get(country_url)
    jsonresponse = response.json()
    return render(request, 'matches/country_match.html', {'jsonresponse': jsonresponse, 'country_name': country_name })

def league_match(request, country_name, league_id):
    league_url = f'https://apiv3.apifootball.com/?action=get_events&from=2023-04-12&to=2023-07-12&league_id={league_id}&APIkey=1c139a365d5356c901ed0e90cd28314e8f54a5136a56800d69447677bd4d7df9'
    response = requests.get(league_url)
    jsonresponse = response.json()

    # Initialize an empty list to hold matches
    matches = []

    # Loop through the list of matches
    for match in jsonresponse:

        # Initialize two empty lists to hold home and away goal scorer names
        home_goal_scorer_names = []
        away_goal_scorer_names = []

        # Loop through the list of goal scorers for each match
        for scorer in match['goalscorer']:
            # Check if the home_scorer field is not empty
            if scorer['home_scorer']:
                # Add the home_scorer to the list of home goal scorer names
                home_goal_scorer_names.append(scorer['home_scorer'])
            # Check if the away_scorer field is not empty
            if scorer['away_scorer']:
                # Add the away_scorer to the list of away goal scorer names
                away_goal_scorer_names.append(scorer['away_scorer'])

        # Create a dictionary for the match
        match_dict = {
            'match_info': match,
            'home_goal_scorer_names': home_goal_scorer_names,
            'away_goal_scorer_names': away_goal_scorer_names,
        }

        # Add the match dictionary to the list of matches
        matches.append(match_dict)

    return render(request, 'matches/league_matches.html', {'jsonresponse': jsonresponse})

def match_details(request, country_name, league_id, match_id):
    match_details_url = f'https://apiv3.apifootball.com/?action=get_events&match_id={match_id}&APIkey=1c139a365d5356c901ed0e90cd28314e8f54a5136a56800d69447677bd4d7df9'
    response = requests.get(match_details_url)
    jsonresponse = response.json()
    return render(request, 'sports/match_details.html', {'jsonresponse':jsonresponse})


    
        