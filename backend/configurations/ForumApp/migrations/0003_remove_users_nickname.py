# Generated by Django 3.2 on 2023-05-29 08:37

from django.db import migrations


class Migration(migrations.Migration):

    dependencies = [
        ('ForumApp', '0002_auto_20230529_1635'),
    ]

    operations = [
        migrations.RemoveField(
            model_name='users',
            name='nickname',
        ),
    ]