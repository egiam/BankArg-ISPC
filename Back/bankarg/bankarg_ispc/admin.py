from django.contrib import admin

# Register your models here.
from .models import *


# Register your models here.

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

class PrestamoAdmin(admin.ModelAdmin):
    list_display = ("monto", "fec_start")


admin.site.register(Documentos, DocumentosAdmin)
admin.site.register(Paises, PaisesAdmin)
admin.site.register(Provincias, ProvinciasAdmin)
admin.site.register(Localidades, LocalidadesAdmin)
admin.site.register(Sexos, SexosAdmin)