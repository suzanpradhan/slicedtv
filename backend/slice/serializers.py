from rest_framework import serializers

from .models import Cast, Language, Genre, Gallery


class CastSerializer(serializers.ModelSerializer):
    """ Serializer for Cast Model """

    class Meta:
        model = Cast
        fields = ('id', 'cast_name', 'cast_image_url')
        extra_kwargs = {
            'id': {'read_only': True}
        }


class GenreSerializer(serializers.ModelSerializer):
    """ Serializer for Genre Model """

    class Meta:
        model = Genre
        fields = ('id', 'genre')
        extra_kwargs = {
            'id': {'read_only': True}
        }


class LanguageSerializer(serializers.ModelSerializer):
    """ Serializer for Language Model """

    class Meta:
        model = Language
        fields = ('id', 'language')
        extra_kwargs = {
            'id': {'read_only': True}
        }
