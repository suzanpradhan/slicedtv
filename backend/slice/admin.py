from django.contrib import admin

from .models import Language, Cast, Gallery, Genre
# Register your models here.
admin.site.register(Language)
admin.site.register(Cast)
admin.site.register(Gallery)
admin.site.register(Genre)
