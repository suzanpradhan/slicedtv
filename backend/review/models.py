from djongo import models
from user.models import User

class Review(models.Model):
    review_id=                  models.IntegerField(max_length=255)
    review_title=               models.CharField(max_length=255)
    description=                models.CharField(max_length=255)
    user_id=                    models.ForeignKey(User)
    date=                       models.DateTimeField()
    
    def __str__(self):
        return self.review_title
