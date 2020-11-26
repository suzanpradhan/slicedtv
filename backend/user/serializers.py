# External Import
from rest_framework import serializers

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
        user = models.objects.create_user(
            username=validated_data['username'],
            email=validated_data['email'],
            password=validated_data['password'],
        )

        return user