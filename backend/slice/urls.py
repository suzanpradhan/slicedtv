# External Import
from django.urls import path, include
from rest_framework.routers import DefaultRouter

# Internal Import
from . import views

# Cast Router
cast_router = DefaultRouter()
cast_router.register('', views.CastAPIView)

# Genre Router
genre_router = DefaultRouter()
genre_router.register('', views.GenreAPIView)


urlpatterns = [
    path('casts/', include(cast_router.urls)),
    path('genres/', include(genre_router.urls)),
]
