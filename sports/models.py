from django.db import models
from ckeditor_uploader.fields import RichTextUploadingField
from django.contrib.auth.models import User
from django.utils.text import slugify
from django.utils import timezone
from django.db import IntegrityError


class Category(models.Model):
    name = models.CharField(max_length=255)
    slug = models.SlugField(max_length=255, unique=True, blank=True)

    def save(self, *args, **kwargs):
        if not self.slug:
            self.slug = slugify(self.name)
        super().save(*args, **kwargs)

    def __str__(self):
        return self.name

class BlogPost(models.Model):
    STATUS_CHOICES = [
        ('draft', 'Draft'),
        ('published', 'Published'),
    ]
    INDEX_CHOICES = [
        ('index', 'Index'),
        ('noindex', 'noindex'),
    ]
    
    
    title = models.CharField(max_length=255)
    body = RichTextUploadingField()  # Use the CKEditor rich text field
    category = models.ForeignKey(Category, on_delete=models.CASCADE, null=True)
    author = models.ForeignKey(User, on_delete=models.CASCADE, default=1)
    post_date = models.DateTimeField(auto_now_add=True)
    update_date = models.DateTimeField(auto_now=True)
    slug = models.SlugField(max_length=255, unique_for_date='post_date', blank=True, unique=True)
    feature_image = models.ImageField(upload_to='blog_images/', blank=True, null=True)
    status = models.CharField(max_length=10, choices=STATUS_CHOICES, default='draft')
    indexing = models.CharField(max_length=10, choices=INDEX_CHOICES, default='index')

    def save(self, *args, **kwargs):
        if not self.author:
            self.author = User.objects.first()

        if not self.id:  # This checks if it's a new post being created
            self.slug = slugify(self.title)

            # Check if a post with the same slug already exists
            counter = 1
            original_slug = self.slug
            while BlogPost.objects.filter(slug=self.slug).exists():
                counter += 1
                self.slug = f'{original_slug}-{counter}'

        super().save(*args, **kwargs)
    def __str__(self):
        return self.title
        
class SiteSetting(models.Model):
    name = models.CharField(max_length=255)
    value = models.CharField(max_length=255)

    def __str__(self):
        return self.name    
    
class FileModel(models.Model):
    file = models.ImageField(upload_to='blog_images/')

from django.db import models

class Contact(models.Model):
    name = models.CharField(max_length=100)
    email = models.EmailField()
    subject = models.CharField(max_length=100)
    phone = models.CharField(max_length=100)
    message = models.TextField()