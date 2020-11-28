# External Import
from django.urls import path

# Internal Import
from . import views

urlpatterns = [
    path('register/', views.UserRegistrationView.as_view(), name='register'),
    path('verify-email/', views.VerifyEmail.as_view(), name='verify-email'),
    path('login/', views.UserLoginAPIView.as_view(), name='login'),
    path('request-password-reset', views.RequestUserPasswordResetByEmail.as_view(),
         name='request-password-reset'),
    path('confirm-password-reset/<uidb64>/<token>/',
         views.ResetPasswordTokenCheckAPI.as_view(), name='confirm-password-reset'),
    path('complete-password-reset/', views.ChangeUserPasswordAPI.as_view(),
         name='complete-password-reset'),
    path('change-password/', views.ChangePasswordView.as_view(),
         name='change-password'),
]
