from django.contrib.sitemaps import Sitemap
from django.urls import reverse
from .models import BlogPost

class StaticViewSitemap(Sitemap):
    def items(self):
        # Return a list of url names that you want to include
        return ['index', 'blog']

    def location(self, item):
        # Return the URL for the items returned by items()
        return reverse(item)    


class BlogPostSitemap(Sitemap):
    def items(self):
        # Return all published blog posts
        return BlogPost.objects.filter(status='published')

    def location(self, obj):
        # Return the URL for each blog post
        return reverse('post_detail', args=[obj.slug])
