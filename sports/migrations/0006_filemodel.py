# Generated by Django 4.2.1 on 2023-05-18 17:52

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('sports', '0005_alter_blogpost_slug'),
    ]

    operations = [
        migrations.CreateModel(
            name='FileModel',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('file', models.ImageField(upload_to='blog_images/')),
            ],
        ),
    ]