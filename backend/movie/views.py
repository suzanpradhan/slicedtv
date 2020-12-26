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

    def update(self, request, *args, **kwargs):
        partial = kwargs.pop('partial', False)
        instance = self.get_object()
        serializer = self.get_serializer(
            instance, data=request.data, partial=partial)
        if serializer.is_valid():
            self.perform_update(serializer)
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

    def perform_update(self, serializer):
        serializer.save()

    def destroy(self, request, *args, **kwargs):
        instance = self.get_object()
        if instance:
            self.perform_destroy(instance)
            return response.Response({
                'status': status.HTTP_200_OK,
                'message': 'Delete Successful',
                'response': {},
            }, status=status.HTTP_200_OK)
        else:
            return response.Response({
                'status': status.HTTP_404_NOT_FOUND,
                'message': 'Error Occurred',
                'response': {},
            }, status=status.HTTP_404_NOT_FOUND)
