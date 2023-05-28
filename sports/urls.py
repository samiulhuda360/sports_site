from django.urls import path, include
from . import views
from django.conf import settings
from django.conf.urls.static import static
from rest_framework.routers import DefaultRouter
from django.contrib.sitemaps.views import sitemap
from .sitemaps import BlogPostSitemap, StaticViewSitemap
from django.views.generic.base import RedirectView

sitemaps = {
    'static': StaticViewSitemap,
    'blogpost': BlogPostSitemap,
}


# Create a router and register our viewsets with it.
router = DefaultRouter()
router.register(r'categories', views.CategoryViewSet,basename="category")
router.register(r'blogpost', views.BlogPostViewSet,basename="blogpost")

urlpatterns = [
    path('', views.index, name='index'),
    
    path('api/', include(router.urls)),
    path('search/', views.search, name='search'),
    path('blog/', views.blog, name='blog'),
    path('sitemap.xml', RedirectView.as_view(url='/sitemap_index.xml', permanent=True)),
    path('sitemap_index.xml', sitemap, {'sitemaps': sitemaps}, name='django.contrib.sitemaps.views.sitemap'),
    path('category/<slug:category_slug>/', views.category_archive, name='category_archive'),
    path('<slug:slug>/', views.blog_post_detail, name='post_detail'),
    path('<slug:slug>/edit/', views.post_update, name='post_update'),
    path('api/upload/', views.FileUploadView.as_view(), name='file_upload'),
    

    #matches
    path('uefa-match-lists', views.uefa_match_list, name='uefa_match_list'),
    path('livescore', views.live_score, name='live_score'),
    path('matches/<str:country_name>', views.country_match, name='country_match'),
    path('matches/<str:country_name>/<int:league_id>', views.league_match, name='league_match'),
    path('matches/<str:country_name>/<int:league_id>/<int:match_id>', views.match_details, name='match_details'),

    
]

if settings.DEBUG:
    urlpatterns += static(settings.MEDIA_URL, document_root=settings.MEDIA_ROOT)

