# External Import
from rest_framework import serializers
from django.contrib import auth
from rest_framework.exceptions import AuthenticationFailed
from django.contrib.auth.tokens import PasswordResetTokenGenerator
from django.utils.encoding import smart_str, force_str, smart_bytes, DjangoUnicodeDecodeError
from django.utils.http import urlsafe_base64_decode, urlsafe_base64_encode
from rest_framework_simplejwt.tokens import RefreshToken, TokenError


# Internal Import
from . import models
from .utils import Util


class UserRegistrationSerializer(serializers.ModelSerializer):
    """ Serializer for User Registration """

    password = serializers.CharField(
        max_length=70, min_length=6, write_only=True)
    username = serializers.CharField(max_length=20, min_length=4)

    class Meta:
        model = models.User
        fields = ('id', 'username', 'email', 'password')

    def validate(self, attrs):
        """Validating the data provided by the user"""

        username = attrs.get('username', '')

        if not username.isalnum():
            raise serializers.ValidationError({
                'username': 'The username should only contain alphanumeric characters'
            })
        elif username[0].isdigit():
            raise serializers.ValidationError({
                'username': 'The username should start with alphabetical Characters'
            })
        return attrs

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
    username = serializers.CharField(required=False, allow_blank=True)
    tokens = serializers.SerializerMethodField()
    email = serializers.EmailField(required=False, allow_blank=True)

    def get_tokens(self, obj):
        current_user = models.User.objects.get(username=obj['username'])
        return {
            'access': current_user.tokens()['access'],
            'refresh': current_user.tokens()['refresh']
        }

    class Meta:
        model = models.User
        fields = ['email', 'tokens', 'username', 'password']
        extra_kwargs = {
            'tokens': {
                'read_only': True,
            },
            'password': {
                'write_only': True,
                'style': {'input_type': 'password'}
            },
        }

    def validate(self, attrs):
        username = attrs.get('username', '')
        password = attrs.get('password', '')
        email = attrs.get('email', '')
        if username == "" and email == "":
            raise serializers.ValidationError(
                {"errors": "Both username and email cannot be null"})
        if username != "" and email != "":
            current_user = auth.authenticate(
                username=username, password=password)
        elif username != "":
            current_user = auth.authenticate(
                username=username, password=password)
        elif email != "":
            try:
                username = models.User.objects.get(email=email).username
            except:
                raise serializers.ValidationError('Invalid Credentials')
            current_user = auth.authenticate(
                username=username, password=password)

        if not current_user:
            raise serializers.ValidationError('Invalid Credentials')

        if not current_user.is_active:
            raise serializers.ValidationError('Account Disabled')

        if not current_user.is_verified:
            raise serializers.ValidationError('Account Not Verified')

        return {
            'username': current_user.username,
            'email': current_user.email,
            'tokens': current_user.tokens,
        }


class RequestUserPasswordResetByEmailSerializer(serializers.Serializer):
    """Serializer For User Request Password Reset"""

    email = serializers.EmailField()

    redirect_url = serializers.CharField(max_length=500, required=False)

    class Meta:
        fields = ['email']


class ChangeUserPasswordAPISerializer(serializers.Serializer):
    """ Change Password when user forgot the password """
    password = serializers.CharField(
        max_length=70, min_length=6, write_only=True)
    token = serializers.CharField(min_length=1, write_only=True)
    uidb64 = serializers.CharField(min_length=1, write_only=True)

    class Meta:
        model = models.User
        fields = ('password', 'token', 'uidb64')

    def validate(self, attrs):
        """Validating the request"""
        try:
            password = attrs.get('password')
            token = attrs.get('token')
            uidb64 = attrs.get('uidb64')

            id = force_str(urlsafe_base64_decode(uidb64))
            current_user = models.User.objects.get(id=id)

            if not PasswordResetTokenGenerator().check_token(user=current_user, token=token):
                raise serializers.ValidationError('Link Invalid')
            current_user.set_password(password)
            current_user.save()
            return current_user

        except Exception as error:
            raise serializers.ValidationError('Link Invalid')
        return super().validate(attrs)


class ChangePasswordSerializer(serializers.Serializer):
    """ Change password when user is logged In  """

    old_password = serializers.CharField(write_only=True, required=True)
    new_password = serializers.CharField(
        max_length=70, min_length=6, write_only=True)

    def validate(self, attrs):
        user = self.context['request'].user
        if not user.check_password(attrs.get('old_password')):
            raise serializers.ValidationError('Wrong password')
        elif attrs.get('old_password') == attrs.get('new_password'):
            raise serializers.ValidationError('New password is same as Old')

        return attrs

    def save(self, **kwargs):
        password = self.validated_data['new_password']
        user = self.context['request'].user
        user.set_password(password)
        user.save()
        return user


# class GetUserSubscriptionTypeSerializer(serializers.ModelSerializer):
#     """ Provide User Subscription Type """

#     subscription_type = serializers.CharField(
#         source='subscription.subscription_type', read_only=True)

#     class Meta:
#         model = models.User
#         fields = ('subscription_type',)


class CheckUsernameExistSerializer(serializers.Serializer):
    """ Check whether the username is valid or not before registration """

    username = serializers.CharField()


class UserLogoutSerializer(serializers.Serializer):
    refresh = serializers.CharField()

    def validate(self, attrs):
        self.token = attrs['refresh']
        return attrs

    def save(self, **kwargs):
        try:
            RefreshToken(self.token).blacklist()
        except TokenError:
            serializers.ValidationError('bad_token')
