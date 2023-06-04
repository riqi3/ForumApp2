from django.urls import path, include
from rest_framework.urlpatterns import format_suffix_patterns
from . import views
# UserDetails, UserListView, SectionListView, TopicListView, ReplyListView

urlpatterns= [
    path('sections/', views.SectionListView.as_view(), name='section-list'),
    path('sections/<int:pk>/', views.SectionDetails.as_view(),name='user-detail'),
    
    path('topics/', views.TopicListView.as_view(),name='topic-list'),
    path('topics/<int:pk>/', views.TopicDetails.as_view(),name='user-detail'),

    path('replies/', views.ReplyListView.as_view(),name='reply-list'),
    path('replies/<int:pk>/', views.ReplyDetails.as_view(),name='user-detail'),

    path('users/', views.UserListView.as_view(),name='user-list'),
    path('users/<int:pk>/', views.UserDetails.as_view(),name='user-detail'),


    # path('sections/', SectionListView.as_view(),),
    # path('sections/<int:pk>', UserDetails.as_view(),),
    
    # path('topics/', TopicListView.as_view(),),
    # path('topics/<int:pk>', UserDetails.as_view(),),

    # path('replies/', ReplyListView.as_view(),),
    # path('replies/<int:pk>', UserDetails.as_view(),),

    # path('users/', UserListView.as_view(),),
    # path('users/<int:pk>', UserDetails.as_view(),),
]

urlpatterns = format_suffix_patterns(urlpatterns)

urlpatterns += [
    path('api-auth/', include('rest_framework.urls')),
]
