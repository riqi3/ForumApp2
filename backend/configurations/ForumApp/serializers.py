from rest_framework import serializers
from .models import Section, Topic, Reply
from django.contrib.auth.models import User

class UserSerializer(serializers.ModelSerializer):
    sections = serializers.PrimaryKeyRelatedField(many=True, queryset=Section.objects.all())
    topics = serializers.PrimaryKeyRelatedField(many=True, queryset=Topic.objects.all())
    replys = serializers.PrimaryKeyRelatedField(many=True, queryset=Reply.objects.all())
    owner = serializers.ReadOnlyField(source='owner.username')
    class Meta:
        model = User
        fields = ['id', 'username', 'sections', 'topics','replys', 'owner']
    

    # class Meta:
    #     model = User
    #     fields = ['id', 'username', 'topics', 'owner']

    # class Meta:
    #     model = User
    #     fields = ['id', 'username', 'replys', 'owner']
    

class SectionSerializer(serializers.ModelSerializer):
    class Meta:
        model = Section
        fields= ('id','title')

    def create(self, validated_data):
        return Section.objects.create(**validated_data)
    
    def update(self, instance, validated_data):
        instance.title = validated_data.get('title', instance.title)
        return instance


class TopicSerializer(serializers.ModelSerializer):
    class Meta:
        model = Topic
        # fields = ('__all__')
        fields= ('id','title', 'description')

    def create(self, validated_data):
        return Topic.objects.create(**validated_data)
    
    def update(self, instance, validated_data):
        instance.title = validated_data.get('title', instance.title)
        instance.description = validated_data.get('description', instance.description)
        return instance


class ReplySerializer(serializers.ModelSerializer):
    class Meta:
        model = Reply
        fields= ('id','comment')

    def create(self, validated_data):
        return Reply.objects.create(**validated_data)
    
    def update(self, instance, validated_data):
        instance.comment = validated_data.get('comment', instance.comment)
        return instance