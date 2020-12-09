# External Import
from djongo import models

# Internal Import
from slice.models import Cast, Language, Genre, Gallery

class Series(models.Model):
    series_name=                models.CharField(max_length=255)
    series_poster=              models.URLField() 
    genres=                      models.ManyToManyField(Genre)       
    description=                models.CharField(max_length=255)
    trailer_link=               models.URLField() 
    casts=                       models.ManyToManyField(Cast) 
    languages=                   models.ManyToManyField(Language,)
    aired=                      models.DateField()
    avg_rating=                 models.FloatField()
    production_company=         models.CharField(max_length=255)
    gallerys=                    models.ManyToManyField(Gallery,)
    

    objects = models.DjongoManager()

    def __str__(self):
        return self.series_name
