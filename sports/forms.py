from django import forms
from ckeditor.widgets import CKEditorWidget
from .models import BlogPost

class BlogPostForm(forms.ModelForm):
    body = forms.CharField(widget=CKEditorWidget())

    class Meta:
        model = BlogPost
        fields = ['title', 'body', 'category', 'feature_image']
