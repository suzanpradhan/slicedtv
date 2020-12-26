# External Import
from django.db import models

# Internal Import
from slice.models import Cast, Language, Genre, Gallery

class Series(models.Model):
    series_name=                models.CharField(max_length=255)
    series_poster=              models.URLField() 
    genres=                      models.ManyToManyField(Genre)       
    description=                models.TextField()
    trailer_link=               models.URLField() 
    casts=                       models.ManyToManyField(Cast) 
    languages=                   models.ManyToManyField(Language,)
    aired=                      models.DateField()
    avg_rating=                 models.FloatField(blank=True, null=True)
    production_company=         models.CharField(max_length=255)
    gallerys=                    models.ManyToManyField(Gallery,)
    


    def __str__(self):
        return self.series_name
