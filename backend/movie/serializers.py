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
            actual_genre = tuple_list[0][1].lower().strip()
            exist = Genre.objects.filter(genre=actual_genre)
            if not exist:
                Genre.objects.create(genre=actual_genre)
            genre = Genre.objects.get(genre=actual_genre)
            movie.genres.add(genre)

        # Creating languages_data
        for language_data in languages_data:
            tuple_list = list(language_data.items())
            actual_language = tuple_list[0][1].lower().strip()
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

        if not self.partial:
            # If the request method id PUT then all the field will be clear.
            instance.genres.clear()
            instance.languages.clear()
            instance.casts.clear()
            instance.gallerys.clear()

        # Updating Genre
        if genres_exist:
            for genre_data in genres_data:
                genre_qs = Genre.objects.filter(
                    genre__iexact=genre_data['genre'])
                if genre_qs.exists():
                    genre = genre_qs.first()
                else:
                    lower_genre = genre_data['genre'].lower().strip()
                    genre = Genre.objects.create(lower_genre)

                instance.genres.add(genre)

        # Updating Language
        if languages_exist:
            for language_data in languages_data:
                language_qs = Language.objects.filter(
                    language__iexact=language_data['language'])
                if language_qs.exists():
                    language = language_qs.first()
                else:
                    lower_language = language_data['language'].lower().strip()
                    language = Language.objects.create(language=lower_language)

                instance.languages.add(language)

        # Updating Gallery
        if gallerys_exist:
            for gallery_data in gallerys_data:
                gallery_qs = Gallery.objects.filter(
                    image_name__iexact=gallery_data['image_name'], image_url__iexact=gallery_data['image_url'])
                if gallery_qs.exists():
                    gallery = gallery_qs.first()
                else:
                    gallery = Gallery.objects.create(**gallery_data)

                instance.gallerys.add(gallery)

        # Updating Cast
        if casts_exist:
            for cast_data in casts_data:
                cast_qs = Cast.objects.filter(
                    cast_name__iexact=cast_data['cast_name'])
                if cast_qs.exists():
                    cast = cast_qs.first()
                else:
                    cast = Cast.objects.create(**cast_data)

                instance.casts.add(cast)

        return instance
