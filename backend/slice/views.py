# External Import
from rest_framework import generics, response, status, viewsets
from rest_framework import permissions

# Internal Import
from . import serializers
from . import models


class CastAPIView(viewsets.ModelViewSet):
    """ Model View Set API for Cast """
    serializer_class = serializers.CastSerializer
    queryset = models.Cast.objects.all()

    def get_permissions(self):
        if self.action == 'list' or self.action == 'retrieve':
            # permission_classes = (permissions.IsAuthenticated,)
            # Only for test purpose
            permission_classes = (permissions.AllowAny,)
        else:
            # permission_classes = (permissions.IsAdminUser,)
            # Only For Test Purpose
            permission_classes = (permissions.AllowAny,)

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


class GenreAPIView(viewsets.ModelViewSet):
    """ Model View Set API for Genre """
    serializer_class = serializers.GenreSerializer
    queryset = models.Genre.objects.all()

    def get_permissions(self):
        if self.action == 'list' or self.action == 'retrieve':
            # permission_classes = (permissions.IsAuthenticated,)
            # Only for test purpose
            permission_classes = (permissions.AllowAny,)
        else:
            # permission_classes = (permissions.IsAdminUser,)
            # Only For Test Purpose
            permission_classes = (permissions.AllowAny,)

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


class LanguageAPIView(viewsets.ModelViewSet):
    """ Model View Set API for Language """
    serializer_class = serializers.LanguageSerializer
    queryset = models.Language.objects.all()

    def get_permissions(self):
        if self.action == 'list' or self.action == 'retrieve':
            # permission_classes = (permissions.IsAuthenticated,)
            # Only for test purpose
            permission_classes = (permissions.AllowAny,)
        else:
            # permission_classes = (permissions.IsAdminUser,)
            # Only For Test Purpose
            permission_classes = (permissions.AllowAny,)

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
