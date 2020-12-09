# External Import
from djongo import models


class Subscription(models.Model):

    subscription_type = models.CharField(max_length=200)
    subscription_amount = models.FloatField()
    subscription_detail = models.TextField()

    objects = models.DjongoManager()

    def __str__(self):
        """Return string representation of the subscription type"""
        return self.subscription_type
