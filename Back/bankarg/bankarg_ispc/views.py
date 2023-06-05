from django.http import JsonResponse
from django.shortcuts import render
from mysqlx import View

# Create your views here.
from rest_framework import viewsets, status, generics
from rest_framework.authentication import (
    SessionAuthentication,
    BasicAuthentication,
    TokenAuthentication,
)
from rest_framework.permissions import IsAuthenticated
from django.contrib.auth import get_user_model, authenticate, login, logout

from knox.models import AuthToken

from Back.bankarg.bankarg_ispc.models import Prestamos
from .serializers import UserSerializer, RegisterSerializer
from rest_framework.response import Response
from rest_framework.views import APIView
from rest_framework import permissions

# from rest_framework.authtoken.serializers import AuthTokenSerializer
# from knox.views import LoginView as KnoxLoginView


# class LoginView(KnoxLoginView):
#     permission_classes = (permissions.AllowAny,)

# def post(self, request, format=None):
#     serializer = AuthTokenSerializer(data=request.data)
#     serializer.is_valid(raise_exception=True)
#     user = serializer.validated_data["user"]
#     login(request, user)
#     return super(LoginView, self).post(request, format=None)


class LoginView(APIView):
    # authentication_classes = [
    #     SessionAuthentication,
    #     BasicAuthentication,
    # ]
    # permission_classes = [
    #     IsAuthenticated,
    # ]

    def post(self, request):
        # Recuperamos credenciales y autenticamos al usuario
        email = request.data.get("email", None)
        password = request.data.get("password", None)
        user = authenticate(email=email, password=password)

        # Si es correcto añadimos a la request la info de sesion
        if user:
            login(request, user)
            return Response(
                UserSerializer(user).data,
                status=status.HTTP_200_OK,
            )

        # Si no es correcto devolvemos un error
        return Response(
            {"detail": "Credenciales incorrectas"}, status=status.HTTP_401_UNAUTHORIZED
        )


class LogoutView(APIView):
    def post(self, request):
        # Hacemos logout
        logout(request)
        return Response({"detail": "Logout correcto"}, status=status.HTTP_200_OK)


class SignupView(generics.CreateAPIView):
    """
    Endpoint de registro de usuarios.
    """

    serializer_class = UserSerializer


# class UserViewSet(viewsets.ModelViewSet):
#     """
#     UserModel View.
#     """

#     permission_classes = (IsAuthenticated,)
#     serializer_class = UserSerializer
#     queryset = get_user_model().objects.all()


# Register
class RegisterView(generics.CreateAPIView):
    serializer_class = RegisterSerializer

    def post(self, request, *args, **kwargs):
        serializer = self.get_serializer(data=request.data)
        serializer.is_valid(raise_exception=True)
        user = serializer.save()
        return Response(
            {
                "user": UserSerializer(
                    user, context=self.get_serializer_context()
                ).data,
                "token": AuthToken.objects.create(user)[1],
            }
        )


class PrestamoView(View):
    def get(self, request, id=0):
        if id > 0:
            prestamos = list(Prestamos.objects.filter(id=id).values())
            if len(prestamos) > 0:
                return JsonResponse(prestamos[0], safe=False)
            else:
                return JsonResponse({"message": "No existe el prestamo"}, safe=False)

        prestamos = list(Prestamos.objects.values())

        if len(prestamos) > 0:
            return JsonResponse(prestamos, safe=False)
        else:
            return JsonResponse({"message": "No existen prestamos"}, safe=False)

    # def post(self, request):
