from djongo import models
from slicedtv.models import Cast, Language, Genre

class Series(models.Model):
    series_name=                models.CharField(max_length=255)
    series_poster=              models.URLField(max_length=255)
    genre=                      models.ManyToManyField(Genre)       
    description=                models.CharField(max_length=255)
    trailer_link=               models.URLField()
    episode_ids=                models.ListField()
    cast=                       models.ArrayField(model_container=Cast,) 
    language=                   models.ManyToManyField(Language)
    aired=                      models.DateField()
    rating_info=                models.IntegerField()
    production_Company=         models.CharField()

    objects = models.DjongoManager()

    def __str__(self):
        return self.series_name
