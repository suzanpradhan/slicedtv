from djongo import models
from slicedtv.models import Cast, Language, Genre

class Movie(models.Model):
    movie_name=                models.CharField()
    movie_poster=              models.URLField()
    genre=                     models.ManyToManyField(Genre)    
    description=               models.CharField()
    trailer_link=              models.URLField()
    movie_link=                models.URLField()
    movie_length=              models.TimeField()
    cast=                      models.ArrayField(model_container=Cast,)
    language=                  models.ManyToManyField(Language)
    aired=                     models.DateField()
    review_ID=                 models.IntegerField()
    rating_info=               models.IntegerField()
    production_Company=        models.CharField()

    objects = models.DjongoManager()
    
    def __str__(self):
        return self.movie_name