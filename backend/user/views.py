# External Import
from rest_framework import generics, response, status

# Internal Import
from . import serializers


class UserRegistrationView(generics.GenericAPIView):
    """ Generic API View for User Registration """

    serializer_class = serializers.UserRegistrationSerializer

    def post(self, request):
        """ Post Request for User Registration """
        user = request.data

        # From UserRegistration Serializer
        serializer = self.serializer_class(data=user)
        serializer.is_valid(raise_exception=True)
        serializer.save()
        user_data = serializer.data

        return response.Response(user_data, status=status.HTTP_201_CREATED)
