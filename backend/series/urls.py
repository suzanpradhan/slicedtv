# External Import
from django.urls import path, include
from rest_framework.routers import DefaultRouter

# Internal Import
from . import views


router = DefaultRouter()
router.register('', views.SeriesAPIView)

urlpatterns = [
    path('', include(router.urls)),
]
