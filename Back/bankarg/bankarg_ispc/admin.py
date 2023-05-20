from django.contrib import admin

# Register your models here.
from .models import *


# Register your models here.
class PersonaAdmin(admin.ModelAdmin):
    list_display = (
        "nombre",
        "apellido",
        "id_tipo_doc",
        "nro_doc",
        "cod_loc",
        "nro_calle",
        "calle",
        "fecha_nac",
        "id_tipo_sexo",
    )


class DocumentosAdmin(admin.ModelAdmin):
    list_display = ("tipo_doc",)


class LocalidadesAdmin(admin.ModelAdmin):
    list_display = (
        "localidad",
        "cod_provincia",
    )


class SexosAdmin(admin.ModelAdmin):
    list_display = ("tipo",)


class PaisesAdmin(admin.ModelAdmin):
    list_display = ("pais",)


class ProvinciasAdmin(admin.ModelAdmin):
    list_display = (
        "provincia",
        "cod_pais",
    )


class ClientesAdmin(admin.ModelAdmin):
    list_display = ("nro_afiliado",)


class EmpleadoAdmin(admin.ModelAdmin):
    list_display = (
        "id_tipo_empleado",
        "id_tipo_estado_empleado",
        "fecha_ingreso",
        "sueldo",
    )


class Tipo_EmpleadoAdmin(admin.ModelAdmin):
    list_display = ("tipo_empleado",)


class Tipo_Estado_EmpleadoAdmin(admin.ModelAdmin):
    list_display = ("tipo_estado_empleado",)


class CuentaAdmin(admin.ModelAdmin):
    list_display = (
        "id_tipo_estado_cuenta",
        "monto",
        "fecha_creacion",
        "cbu",
        "alias",
        "password",
        "credito",
        "debito",
    )


class Tipo_Estado_CuentaAdmin(admin.ModelAdmin):
    list_display = ("tipo_estado_cuenta",)


admin.site.register(Documentos, DocumentosAdmin)
admin.site.register(Paises, PaisesAdmin)
admin.site.register(Provincias, ProvinciasAdmin)
admin.site.register(Localidades, LocalidadesAdmin)
admin.site.register(Sexos, SexosAdmin)
admin.site.register(Persona, PersonaAdmin)
admin.site.register(Clientes, ClientesAdmin)
admin.site.register(Empleado, EmpleadoAdmin)
admin.site.register(Tipo_empleado, Tipo_EmpleadoAdmin)
admin.site.register(Tipo_estado_empleado, Tipo_Estado_EmpleadoAdmin)
admin.site.register(Cuenta, CuentaAdmin)
admin.site.register(Tipo_estado_cuenta, Tipo_Estado_CuentaAdmin)

# admin.site.register(Empleado)
# admin.site.register(Tipo_empleado)
# admin.site.register(Tipo_estado_empleado)
# admin.site.register(Cuenta)
# admin.site.register(Tipo_estado_cuenta)
