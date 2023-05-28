from rest_framework import serializers
from .models import Category, BlogPost, FileModel

class CategorySerializer(serializers.ModelSerializer):
    class Meta:
        model = Category
        fields = ['id', 'name']

class BlogPostSerializer(serializers.ModelSerializer):
    class Meta:
        model = BlogPost
        fields = ['id', 'title', 'body', 'category', 'author', 'feature_image', 'status']

class FileSerializer(serializers.Serializer):
    file = serializers.ImageField()

    def create(self, validated_data):
        return FileModel.objects.create(**validated_data)