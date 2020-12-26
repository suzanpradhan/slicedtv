from rest_framework.views import APIView
from rest_framework.response import Response
from rest_framework import generics, status

from .models import Subscription
from subscription.serializers import ListAllSubscriptionSerializer


class ListAllSubscriptionAPIView(generics.ListAPIView):
    queryset = Subscription.objects.all()
    serializer_class = ListAllSubscriptionSerializer

    def list(self, request):
        queryset = self.get_queryset()
        serializer = self.serializer_class(queryset, many=True)
        return Response({
            'status': status.HTTP_200_OK,
            'message': 'All Subscription',
            'response': serializer.data,
        }, status=status.HTTP_200_OK)
