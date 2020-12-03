from djongo import models

class uplod(models.Model):
    uploadDate = models.DateTimeField(auto_now_add=True)
    upload = models.FileField()
