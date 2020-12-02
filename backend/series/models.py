from djongo import models
from slicedtv.models import Cast, Language, Genre, Gallery

class Series(models.Model):
    series_name=                models.CharField(max_length=255)
    series_poster=              models.URLField()
    genre=                      models.ManyToManyField(Genre)       
    description=                models.CharField(max_length=255)
    trailer_link=               models.URLField()
    cast=                       models.ArrayField(model_container=Cast,) 
    language=                   models.ManyToManyField(Language)
    aired=                      models.DateField()
    rating_info=                models.IntegerField()
    production_Company=         models.CharField(max_length=255)
    gallery=                    models.ArrayField(model_container=Gallery,)
    

    objects = models.DjongoManager()

    def __str__(self):
        return self.series_name
