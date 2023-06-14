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
    DocumentosView,
    PaisesView,
    ProvinciasView,
    LocalidadesView,
    SexosView,
)
from bankarg_ispc.views import (
    LoginView,
    LogoutView,
    SignupView,
    RegisterView,
    # LoginView2,
)
from bankarg_ispc import views

# from rest_framework.authtoken.views import ObtainAuthToken
# from rest_framework_jwt.views import obtain_jwt_token, refresh_jwt_token


# from knox import views as knox_views


urlpatterns = [
    path("auth/login/", LoginView.as_view(), name="auth_login"),
    # path("auth/login/", obtain_jwt_token),
    path("auth/logout/", LogoutView.as_view(), name="auth_logout"),
    #
    # path("auth/login2/", LoginView2.as_view(), name="auth_login2"),
    # path("auth/logout2/", knox_views.LogoutView.as_view(), name="auth_logout"),
    # path("auth/logoutall/", knox_views.LogoutAllView.as_view(), name="auth_logoutall"),
    #
    path("auth/signup/", SignupView.as_view(), name="auth_signup"),
    path("auth/register/", RegisterView.as_view(), name="auth_register"),
    # path("api-auth/", include("rest_framework.urls")),
    # path("api/token/", TokenObtainPairView.as_view(), name="token_obtain_pair"),
    # path("api/token/refresh/", TokenRefreshView.as_view(), name="token_refresh"),
    # ---------
    # Servicios
    path("prestamo/", PrestamoView.as_view(), name="prestamo_list"),
    path(
        "prestamo/<int:id_prestamo>/", PrestamoView.as_view(), name="prestamo_proceso"
    ),
    path("persona/", PersonaView.as_view(), name="persona_list"),
    path("persona/<int:id_persona>/", PersonaView.as_view(), name="persona_proceso"),
    path("cuenta/", CuentaView.as_view(), name="cuenta_list"),
    path("cuenta/<int:id_cuenta>/", CuentaView.as_view(), name="cuenta_proceso"),
    path("plazo_fijo/", Plazo_fijoView.as_view(), name="plazo_fijo_list"),
    path(
        "plazo_fijo/<int:id_plazo_fijo>/",
        Plazo_fijoView.as_view(),
        name="plazo_fijo_proceso",
    ),
    path("transferencias/", TransferenciasView.as_view(), name="transferencias_list"),
    path(
        "transferencias/<int:id_transferencia>/",
        TransferenciasView.as_view(),
        name="transferencias_proceso",
    ),
    path("documentos/", DocumentosView.as_view(), name="documentos_list"),
    path(
        "documentos/<int:id_tipo_doc>/",
        DocumentosView.as_view(),
        name="documentos_proceso",
    ),
    path("paises/", PaisesView.as_view(), name="paises_list"),
    path("paises/<int:cod_pais>/", PaisesView.as_view(), name="paises_proceso"),
    path("provincias/", ProvinciasView.as_view(), name="provincias_list"),
    path(
        "provincias/<int:cod_provincia>/",
        ProvinciasView.as_view(),
        name="provincias_proceso",
    ),
    path("localidades/", LocalidadesView.as_view(), name="localidades_list"),
    path(
        "localidades/<int:cod_localidad>/",
        LocalidadesView.as_view(),
        name="localidades_proceso",
    ),
    path("sexos/", SexosView.as_view(), name="sexos_list"),
    path("sexos/<int:id_tipo_sexo>/", SexosView.as_view(), name="sexos_proceso"),
]
