# External Import
from django.urls import path, include
from rest_framework.routers import DefaultRouter

# Internal Import
from . import views


router = DefaultRouter()
router.register('', views.EpisodeAPIView)

urlpatterns = [
    path('', include(router.urls)),
]
