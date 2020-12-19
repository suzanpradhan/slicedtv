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

    def create(self, validated_data):
        genres_data = validated_data.pop('genres')
        languages_data = validated_data.pop('languages')
        gallerys_data = validated_data.pop('gallerys')
        casts_data = validated_data.pop('casts')

        # Creating Movie Object
        movie = Movie.objects.create(**validated_data)
        movie.save()
        # Creating Genre Object
        for genre_data in genres_data:
            tuple_list = list(genre_data.items())
            actual_genre = tuple_list[0][1]
            exist = Genre.objects.filter(genre=actual_genre)
            if not exist:
                Genre.objects.create(genre=actual_genre)
            genre = Genre.objects.get(genre=actual_genre)
            movie.genres.add(genre)

        # Creating languages_data
        for language_data in languages_data:
            tuple_list = list(language_data.items())
            actual_language = tuple_list[0][1]
            exist = Language.objects.filter(language=actual_language)
            if not exist:
                Language.objects.create(language=actual_language)
            language = Language.objects.get(language=actual_language)
            movie.languages.add(language)

        # Creating gallerys_data
        for gallery_data in gallerys_data:
            tuple_list = list(gallery_data.items())
            image_name = tuple_list[0][1]
            image_url = tuple_list[1][1]
            image = Gallery.objects.create(
                image_name=image_name, image_url=image_url)
            movie.gallerys.add(image)

        # For Cast
        for cast_data in casts_data:
            tuple_list = list(cast_data.items())
            cast_name = tuple_list[0][1]
            cast_url = tuple_list[1][1]
            exist = Cast.objects.filter(cast_name=cast_name)
            if not exist:
                Cast.objects.create(cast_name=cast_name,
                                    cast_image_url=cast_url)
            cast = Cast.objects.get(cast_name=cast_name)
            movie.casts.add(cast)

        return movie
