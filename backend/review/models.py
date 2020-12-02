from djongo import models
from user.models import User
from slicedtv.models import Gallery

class Review(models.Model):
    review_id=                  models.IntegerField()
    review_title=               models.CharField(max_length=255)
    description=                models.CharField(max_length=255)
    user=                       models.ForeignKey(User, on_delete=models.CASCADE)
    date=                       models.DateTimeField()
    rating=                     models.FloatField()
    def __str__(self):
        return self.review_title
