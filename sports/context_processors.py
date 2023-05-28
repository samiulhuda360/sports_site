from .models import BlogPost, SiteSetting

# Global Context
def recent_posts(request):
    try:
        posts_per_page = SiteSetting.objects.get(name='sidebar_latest_posts').value
    except SiteSetting.DoesNotExist:
        posts_per_page = 5  # default value if the setting is not found
    recent_posts = BlogPost.objects.all()[:int(posts_per_page)]
    return {'recent_posts': recent_posts,
            'site_name': 'Sports Diginity',}