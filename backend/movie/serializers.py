# External Import
from rest_framework import serializers

# Internal Import
from .models import Movie
from slice.models import Genre, Language, Gallery, Cast


class GenreSerializer(serializers.ModelSerializer):
    class Meta:
        model = Genre
        fields = ('genre',)


class LanguageSerializer(serializers.ModelSerializer):
    class Meta:
        model = Language
        fields = ('language',)


class GallerySerializer(serializers.ModelSerializer):
    class Meta:
        model = Gallery
        fields = ('image_name', 'image_url')


class CastSerializer(serializers.ModelSerializer):
    class Meta:
        model = Cast
        fields = ('cast_name', 'cast_image_url')


class MovieSerializer(serializers.ModelSerializer):
    """ Movie Serializer for to get and post movie """
    genres = GenreSerializer(many=True)
    languages = LanguageSerializer(many=True)
    gallerys = GallerySerializer(many=True)
    casts = CastSerializer(many=True)

    class Meta:
        model = Movie
        fields = (
            'id', 'movie_name', 'movie_poster', 'description', 'trailer_link',
            'movie_link', 'movie_length', 'aired', 'avg_rating',
            'production_company', 'genres', 'languages', 'gallerys', 'casts'
        )
        extra_kwargs = {
            'id': {
                'read_only': True,
            },
        }
