# Generated by Django 4.2.1 on 2023-06-01 03:40

from django.db import migrations


class Migration(migrations.Migration):

    dependencies = [
        ('ForumApp', '0008_alter_user_options_alter_user_managers_and_more'),
    ]

    operations = [
        migrations.RemoveField(
            model_name='user',
            name='date_joined',
        ),
        migrations.RemoveField(
            model_name='user',
            name='email',
        ),
        migrations.RemoveField(
            model_name='user',
            name='first_name',
        ),
        migrations.RemoveField(
            model_name='user',
            name='groups',
        ),
        migrations.RemoveField(
            model_name='user',
            name='last_name',
        ),
        migrations.RemoveField(
            model_name='user',
            name='user_permissions',
        ),
    ]