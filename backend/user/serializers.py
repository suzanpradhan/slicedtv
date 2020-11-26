# External Import
from rest_framework import serializers
from django.contrib import auth
from rest_framework.exceptions import AuthenticationFailed

# Internal Import
from . import models


class UserRegistrationSerializer(serializers.ModelSerializer):
    """ Serializer for User Registration """

    class Meta:
        model = models.User
        fields = ('id', 'username', 'email', 'password')
        extra_kwargs = {
            'password': {
                'write_only': True,
                'style': {'input_type': 'password'}
            }
        }

    def create(self, validated_data):
        """Create and return a new user"""
        user = models.User.objects.create_user(
            username=validated_data['username'],
            email=validated_data['email'],
            password=validated_data['password'],
        )

        return user


class UserLoginSerializer(serializers.ModelSerializer):
    """Serializer for Login"""
    username = serializers.CharField()
    class Meta:
        model = models.User
        fields = ['username', 'password','email', 'tokens']
        extra_kwargs = {
            'tokens': {
                'read_only': True,
            },
            'password': {
                'write_only': True,
                'style': {'input_type': 'password'}
            },
            'email': {
                'read_only': True,
            }
        }

    def validate(self, attrs):
        username = attrs.get('username', '')
        password = attrs.get('password', '')
        print("Hello WOrld ------------------------------")
        current_user = auth.authenticate(username=username, password=password)

        if not current_user:
            raise AuthenticationFailed('Invalid Credentials')

        if not current_user.is_active:
            raise AuthenticationFailed('Account disabled')

        if not current_user.is_verified:
            raise AuthenticationFailed('Account not verified')

        return {
            'username': current_user.username,
            'email': current_user.email,
            'tokens': current_user.tokens,
        }
