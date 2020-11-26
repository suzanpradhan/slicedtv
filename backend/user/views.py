# External Import
from django.conf import settings
from rest_framework import generics, response, status
from rest_framework_simplejwt.tokens import RefreshToken
from django.contrib.sites.shortcuts import get_current_site
from django.urls import reverse
import jwt


# Internal Import
from . import serializers
from . import models
from .utils import Util


class UserRegistrationView(generics.GenericAPIView):
    """ Generic API View for User Registration """

    serializer_class = serializers.UserRegistrationSerializer

    def post(self, request):
        """ Post Request for User Registration and also sending user verification email """
        user = request.data

        # From UserRegistration Serializer
        serializer = self.serializer_class(data=user)
        serializer.is_valid(raise_exception=True)
        serializer.save()
        current_user_data = serializer.data

        user = models.User.objects.get(email=current_user_data['email'])

        # Token
        token = str(RefreshToken().for_user(user).access_token)

        # Sending Verification URL to the current_user
        current_site = get_current_site(request)
        relative_link = reverse('verify-email')
        absolute_url = f"http://{current_site}{relative_link}?token={token}"
        email_body = f"Namaste {user.username}\n Use link below to verify your account.\n{absolute_url}"
        email_message = {
            'email_body': email_body,
            'email_subject': "Verify Your Email For SlicedTv Account",
            'to_email': user.email
        }
        # Sending from utils.py file
        Util.send_email(email_message)

        return response.Response(current_user_data, status=status.HTTP_201_CREATED)


class VerifyEmail(generics.GenericAPIView):
    """ Verifying User Email"""

    def get(self, request):
        """ GET method which takes token which was sent to the user's email after registration """

        token = request.GET.get('token')

        try:
            # Working with received token
            received_token = jwt.decode(token, settings.SECRET_KEY)
            user = models.User.objects.get(id=received_token['user_id'])

            # Changing User status to verified
            if not user.is_verified:
                user.is_verified = True
                user.save()

            return response.Response({'message': 'Email Successfully Activated'})

        except jwt.ExpiredSignatureError as identifier:
            return response.Response({'error': 'Activation Link Expired'}, status=status.HTTP_400_BAD_REQUEST)
            # ! Should send the user another activation link by asking the user.

        except jwt.exception.DecodeError as identifier:
            return response.Response({'error': 'Invalid Activation Link'}, status=status.HTTP_400_BAD_REQUEST)


class UserLoginAPIView(generics.GenericAPIView):
    """Login User in """

    serializer_class = serializers.UserLoginSerializer

    def post(self, request):
        serializer = self.serializer_class(data=request.data)
        serializer.is_valid(raise_exception=True)

        return response.Response(serializer.data, status=status.HTTP_200_OK)

    