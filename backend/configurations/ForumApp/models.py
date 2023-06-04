from django.db import models
from django.contrib.auth.models import User
from rest_framework import permissions


class IsOwnerOrReadOnly(permissions.BasePermission):


    def has_object_permission(self, request, view, obj):
        if request.method in permissions.SAFE_METHODS:
            return True
        return obj.owner == request.user



class Section(models.Model):
    created = models.DateTimeField(auto_now_add=True)
    title = models.CharField(max_length=500)
    owner = models.ForeignKey('auth.user', related_name='sections', on_delete=models.PROTECT)

    def __str__(self):
        return self.title

    class Meta:
        ordering = ['created']


class Topic(models.Model):
    created = models.DateTimeField(auto_now_add=True)
    title = models.CharField(max_length=500)
    description = models.TextField(null=True)
    owner = models.ForeignKey('auth.user',  related_name='topics', on_delete=models.CASCADE)

    def __str__(self):
        return self.title

    class Meta:
        ordering = ['created']


class Reply(models.Model):
    created = models.DateTimeField(auto_now_add=True)
    title = models.TextField(null=True)
    owner = models.ForeignKey(
        'auth.user', related_name='replys', on_delete=models.CASCADE)

    def __str__(self):
        return self.comment

    class Meta:
        ordering = ['created']
