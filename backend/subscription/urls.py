from django.urls import path
from . import views

urlpatterns = [
    path('get-all-subscriptions/', views.ListAllSubscriptionAPIView.as_view(),
         name='get-all-subscriptions'),

]
