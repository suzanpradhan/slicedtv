# External Import
from rest_framework import serializers

# Internal Import
from .models import Movie
from slice.models import Genre, Language, Gallery, Cast


class GenreSerializer(serializers.ModelSerializer):
    class Meta:
        model = Genre
        fields = ('id', 'genre')
        extra_kwargs = {
            'genre': {
                'read_only': True,
            },
            'id': {
                'read_only': False,
            }
        }


class LanguageSerializer(serializers.ModelSerializer):
    class Meta:
        model = Language
        fields = ('id', 'language',)
        extra_kwargs = {
            'language': {
                'read_only': True,
            },
            'id': {
                'read_only': False,
            }
        }


class GallerySerializer(serializers.ModelSerializer):
    class Meta:
        model = Gallery
        fields = ('id', 'image_name', 'image_url')
        extra_kwargs = {
            'image_name': {
                'read_only': True,
            },
            'image_url': {
                'read_only': True,
            },
            'id': {
                'read_only': False,
            }
        }


class CastSerializer(serializers.ModelSerializer):
    class Meta:
        model = Cast
        fields = ('id', 'cast_name', 'cast_image_url')
        extra_kwargs = {
            'cast_name': {
                'read_only': True,
            },
            'cast_image_url': {
                'read_only': True,
            },
            'id': {
                'read_only': False,
            }
        }


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
            genre_id = tuple_list[0][1]
            exist = Genre.objects.filter(id=genre_id)
            if exist:
                genre = Genre.objects.get(id=genre_id)
                movie.genres.add(genre)

        # Creating languages_data
        for language_data in languages_data:
            tuple_list = list(language_data.items())
            language_id = tuple_list[0][1]
            exist = Language.objects.filter(id=language_id)
            if exist:
                language = Language.objects.get(id=language_id)
                movie.languages.add(language)

        # Creating gallerys_data
        for gallery_data in gallerys_data:
            tuple_list = list(gallery_data.items())
            gallery_id = tuple_list[0][1]
            exist = Gallery.objects.filter(id=gallery_id)
            if exist:
                image = Gallery.objects.get(id=gallery_id)
                movie.gallerys.add(image)

        # For Cast
        for cast_data in casts_data:
            tuple_list = list(cast_data.items())
            cast_id = tuple_list[0][1]
            exist = Cast.objects.filter(id=cast_id)
            if exist:
                cast = Cast.objects.get(id=cast_id)
                movie.casts.add(cast)

        return movie

    def update(self, instance, validated_data):
        """ Updating the Movie Data """
        # Checking what field user have sent during patch request.
        genres_exist = False
        languages_exist = False
        gallerys_exist = False
        casts_exist = False
        if 'genres' in validated_data:
            genres_exist = True
            genres_data = validated_data.pop('genres')
        if 'languages' in validated_data:
            languages_exist = True
            languages_data = validated_data.pop('languages')
        if 'gallerys' in validated_data:
            gallerys_exist = True
            gallerys_data = validated_data.pop('gallerys')
        if 'casts' in validated_data:
            casts_exist = True
            casts_data = validated_data.pop('casts')

        instance = super(MovieSerializer, self).update(
            instance, validated_data)

        # Updating Genre
        if genres_exist:
            instance.genres.clear()
            for genre_data in genres_data:
                genre_qs = Genre.objects.filter(
                    id=genre_data['id'])
                if genre_qs.exists():
                    genre = genre_qs.first()
                    instance.genres.add(genre)

        # Updating Language
        if languages_exist:
            instance.languages.clear()
            for language_data in languages_data:
                language_qs = Language.objects.filter(
                    id=language_data['id'])
                if language_qs.exists():
                    language = language_qs.first()
                    instance.languages.add(language)

        # Updating Gallery
        if gallerys_exist:
            instance.gallerys.clear()
            for gallery_data in gallerys_data:
                gallery_qs = Gallery.objects.filter(
                    id=gallery_data['id'])
                if gallery_qs.exists():
                    gallery = gallery_qs.first()
                    instance.gallerys.add(gallery)

        # Updating Cast
        if casts_exist:
            instance.casts.clear()
            for cast_data in casts_data:
                cast_qs = Cast.objects.filter(
                    id=cast_data['id'])
                if cast_qs.exists():
                    cast = cast_qs.first()
                    instance.casts.add(cast)

        return instance
