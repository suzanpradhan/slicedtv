# External Import
from rest_framework import serializers
from django.contrib import auth
from rest_framework.exceptions import AuthenticationFailed
from django.contrib.auth.tokens import PasswordResetTokenGenerator
from django.utils.encoding import smart_str, force_str, smart_bytes, DjangoUnicodeDecodeError
from django.utils.http import urlsafe_base64_decode, urlsafe_base64_encode


# Internal Import
from . import models
from .utils import Util


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
        fields = ['username', 'password', 'email', 'tokens']
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


class RequestUserPasswordResetByEmailSerializer(serializers.Serializer):
    """Serializer For User Request Password Reset"""

    email = serializers.EmailField()

    class Meta:
        fields = ['email']


class ChangeUserPasswordAPISerializer(serializers.Serializer):
    """ Patch Password """
    password = serializers.CharField()
    token = serializers.CharField(min_length=1)
    uidb64 = serializers.CharField(min_length=1)

    class Meta:
        model = models.User
        fields = ('password', 'token', 'uidb64')
        extra_kwargs = {
            'password': {
                'write_only': True,
                'style': {'input_type': 'password'}
            },
            'token': {
                'write_only': True,
            },
            'uidb64': {
                'write_only': True,
            },
        }

    def validate(self, attrs):
        """Validating the request"""
        try:
            password = attrs.get('password')
            token = attrs.get('token')
            uidb64 = attrs.get('uidb64')

            id = force_str(urlsafe_base64_decode(uidb64))
            current_user = models.User.objects.get(id=id)

            if not PasswordResetTokenGenerator().check_token(user=current_user, token=token):
                raise AuthenticationFailed("Link Invalid", 401)
            current_user.set_password(password)
            current_user.save()
            return current_user

        except Exception as error:
            raise AuthenticationFailed("Linkk Invalid", 401)
        return super().validate(attrs)


class ChangePasswordSerializer(serializers.Serializer):
    """ Change password when user is logged In  """

    old_password = serializers.CharField(write_only=True, required=True)
    new_password = serializers.CharField(write_only=True, required=False)

    def validate(self, attrs):
        user = self.context['request'].user
        if not user.check_password(attrs.get('old_password')):
            raise serializers.ValidationError({'error': 'Wrong password.'})
        
        return attrs
    
    def save(self, **kwargs):
        password = self.validated_data['new_password']
        user = self.context['request'].user
        user.set_password(password)
        user.save()
        return user