# Generated by Django 4.2.1 on 2023-05-17 21:49

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('sports', '0002_alter_blogpost_body'),
    ]

    operations = [
        migrations.CreateModel(
            name='SiteSetting',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('name', models.CharField(max_length=255)),
                ('value', models.CharField(max_length=255)),
            ],
        ),
    ]
