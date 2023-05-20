from django.contrib import admin
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
    list_display = (
        "id_tipo_doc",
        "tipo_doc",
    )


class LocalidadesAdmin(admin.ModelAdmin):
    list_display = (
        "cod_localidad",
        "localidad",
        "cod_provincia",
    )


class SexosAdmin(admin.ModelAdmin):
    list_display = (
        "id_tipo_sexo",
        "tipo",
    )


admin.site.register(Documentos, DocumentosAdmin)
admin.site.register(Localidades, LocalidadesAdmin)
admin.site.register(Sexos, SexosAdmin)
admin.site.register(Persona, PersonaAdmin)
admin.site.register(Provicias)
admin.site.register(Paises)
admin.site.register(Clientes)
admin.site.register(Empleado)
admin.site.register(Tipo_empleado)
admin.site.register(Tipo_estado_empleado)
admin.site.register(Cuenta)
admin.site.register(Tipo_estado_cuenta)
