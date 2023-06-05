from django.contrib import admin
from django.urls import include, path

# from rest_framework_simplejwt.views import (
#     TokenObtainPairView,
#     TokenRefreshView,
# )
from rest_framework.routers import DefaultRouter
from bankarg_ispc.views import (
    PrestamoView,
    PersonaView,
    CuentaView,
    Plazo_fijoView,
    TransferenciasView,
)
from bankarg_ispc.views import LoginView, LogoutView, SignupView, RegisterView
from bankarg_ispc import views

# from rest_framework.authtoken.views import ObtainAuthToken
from rest_framework_jwt.views import obtain_jwt_token, refresh_jwt_token


# from knox import views as knox_views


urlpatterns = [
    path("auth/login/", LoginView.as_view(), name="auth_login"),
    # path("auth/login/", obtain_jwt_token),
    path("auth/logout/", LogoutView.as_view(), name="auth_logout"),
    # path("auth/logout/", knox_views.LogoutView.as_view(), name="auth_logout"),
    # path("auth/logoutall/", knox_views.LogoutAllView.as_view(), name="auth_logoutall"),
    path("auth/signup/", SignupView.as_view(), name="auth_signup"),
    path("auth/register/", RegisterView.as_view(), name="auth_register"),
    # path("api-auth/", include("rest_framework.urls")),
    # path("api/token/", TokenObtainPairView.as_view(), name="token_obtain_pair"),
    # path("api/token/refresh/", TokenRefreshView.as_view(), name="token_refresh"),
    # ---------
    # Servicios
    path("prestamo/", PrestamoView.as_view(), name="prestamo_list"),
    path("prestamo/<int:id>/", PrestamoView.as_view(), name="prestamo_proceso"),
    path("persona/", PersonaView.as_view(), name="persona_list"),
    path("persona/<int:id>/", PersonaView.as_view(), name="persona_proceso"),
    path("cuenta/", CuentaView.as_view(), name="cuenta_list"),
    path("cuenta/<int:id>/", CuentaView.as_view(), name="cuenta_proceso"),
    path("plazo_fijo/", Plazo_fijoView.as_view(), name="plazo_fijo_list"),
    path("plazo_fijo/<int:id>/", Plazo_fijoView.as_view(), name="plazo_fijo_proceso"),
    path("transferencias/", TransferenciasView.as_view(), name="transferencias_list"),
    path(
        "transferencias/<int:id>/",
        TransferenciasView.as_view(),
        name="transferencias_proceso",
    ),
]