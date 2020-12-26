from django.db import models
from user.models import User


class Subscription_history(models.Model):

    user = models.ForeignKey(User, on_delete=models.CASCADE)
    subscription_type = models.CharField(max_length=200)
    payment_method = models.CharField(max_length=200)
    payment_amount = models.FloatField()
    created_at = models.DateTimeField()
    expiration_date = models.DateTimeField()

    def __str__(self):
        """Return string representation of the subscription type"""
        return self.subscription_type+self.created_at
