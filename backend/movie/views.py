# External Import
from django.shortcuts import render
from rest_framework import generics, response, status, viewsets
from rest_framework import permissions

# Internal Import
from . import serializers
from .models import Movie


class MovieAPIView(viewsets.ModelViewSet):

    serializer_class = serializers.MovieSerializer
    queryset = Movie.objects.all()

    def get_permissions(self):
        if self.action == 'list' or self.action == 'retrieve':
            permission_classes = (permissions.IsAuthenticated,)
            # permission_classes = (permissions.AllowAny,)# Only for test purpose
        else:
            permission_classes = (permissions.IsAdminUser,)
            # permission_classes = (permissions.AllowAny,) # Only For Test Purpose
        return [permission() for permission in permission_classes]

    def list(self, request):
        queryset = self.get_queryset()
        serializer = self.serializer_class(queryset, many=True)
        return response.Response({
            'status': status.HTTP_200_OK,
            'message': 'Success',
            'response': serializer.data,
        }, status=status.HTTP_200_OK)

    def retrieve(self, request, *args, **kwargs):
        instance = self.get_object()
        serializer = self.get_serializer(instance)
        return response.Response({
            'status': status.HTTP_200_OK,
            'message': 'Success',
            'response': serializer.data,
        }, status=status.HTTP_200_OK)

    def create(self, request):
        serializer = self.serializer_class(data=request.data)
        if serializer.is_valid():
            serializer.save()
            return response.Response({
                'status': status.HTTP_200_OK,
                'message': 'Success',
                'response': serializer.data,
            }, status=status.HTTP_200_OK)
        else:
            message = 'Invalid'
            if "errors" in serializer._errors:
                message = serializer._errors['errors'][0]
            return response.Response({
                'status': status.HTTP_400_BAD_REQUEST,
                'message': message,
                'response': serializer.errors,
            }, status=status.HTTP_400_BAD_REQUEST)
