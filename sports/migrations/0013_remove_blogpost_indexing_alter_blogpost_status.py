# Generated by Django 4.2.1 on 2023-05-25 07:11

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('sports', '0012_blogpost_indexing'),
    ]

    operations = [
        migrations.RemoveField(
            model_name='blogpost',
            name='indexing',
        ),
        migrations.AlterField(
            model_name='blogpost',
            name='status',
            field=models.CharField(choices=[('index', 'Index'), ('noindex', 'noindex')], default='index', max_length=10),
        ),
    ]
