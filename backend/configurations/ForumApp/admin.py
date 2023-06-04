from typing import Any
from django.contrib import admin
from .models import Section, Topic, Reply

class postAdmin(admin.ModelAdmin):
    list_display = ['id', 'owner', 'title']
    ordering = ['id']
 

admin.site.register(Section, postAdmin)
admin.site.register(Topic, postAdmin)
admin.site.register(Reply, postAdmin)