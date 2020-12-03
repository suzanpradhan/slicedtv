from django.contrib import admin
from aws_test.models import uplod as aws_models
from user.models import User

admin.site.register(User)

admin.site.register(aws_models)