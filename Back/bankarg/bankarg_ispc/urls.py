from django.contrib import admin
from django.urls import include, path

# from rest_framework_simplejwt.views import (
#     TokenObtainPairView,
#     TokenRefreshView,
# )
from rest_framework.routers import DefaultRouter
from bankarg_ispc.views import LoginView, LogoutView, SignupView, RegisterView
from bankarg_ispc import views

# from knox import views as knox_views


urlpatterns = [
    path("auth/login/", LoginView.as_view(), name="auth_login"),
    path("auth/logout/", LogoutView.as_view(), name="auth_logout"),
    # path("auth/logout/", knox_views.LogoutView.as_view(), name="auth_logout"),
    # path("auth/logoutall/", knox_views.LogoutAllView.as_view(), name="auth_logoutall"),
    path("auth/signup/", SignupView.as_view(), name="auth_signup"),
    path("auth/register/", RegisterView.as_view(), name="auth_register"),
    # path("api-auth/", include("rest_framework.urls")),
    # path("api/token/", TokenObtainPairView.as_view(), name="token_obtain_pair"),
    # path("api/token/refresh/", TokenRefreshView.as_view(), name="token_refresh"),
]
