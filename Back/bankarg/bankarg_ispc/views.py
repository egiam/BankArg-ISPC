from django.shortcuts import render

# Create your views here.
from rest_framework import viewsets, status, generics
from rest_framework.permissions import IsAuthenticated
from django.contrib.auth import get_user_model, authenticate, login, logout

from .serializers import UserSerializer
from rest_framework.response import Response
from rest_framework.views import APIView


class LoginView(APIView):
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
