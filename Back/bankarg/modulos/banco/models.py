from django.db import models


# Create your models here.
class Documentos(models.Model):
    id_tipo_doc = models.IntegerField(primary_key=True)
    tipo_doc = models.CharField(max_length=150)


class Localidades(models.Model):
    cod_localidad = models.IntegerField(primary_key=True)
    localidad = models.CharField()
    cod_provincia = models.ForeignKey("Provincias", on_delete=models.CASCADE)


class Sexos(models.Model):
    id_tipo_sexo = models.IntegerField(primary_key=True)
    tipo = models.TextField(max_length=150)


class Persona(models.Model):
    id_cliente = models.AutoField(primary_key=True)
    nombre = models.TextField(max_length=120)
    apellido = models.TextField(max_length=120)
    id_tipo_doc = models.ForeignKey(
        Documentos, to_field="id_tipo_doc", on_delete=models.CASCADE
    )
    nro_doc = models.CharField(max_length=20)
    cod_loc = models.ForeignKey(
        Localidades, to_field="cod_localidad", on_delete=models.CASCADE
    )
    nro_calle = models.IntegerField()
    calle = models.TextField(max_length=150)
    fecha_nac = models.DateTimeField()
    id_tipo_sexo = models.ForeignKey(
        Sexos, to_field="id_tipo_sexo", on_delete=models.CASCADE
    )

    class Meta:
        db_table = "Persona"
        verbose_name = "Persona"
        verbose_name_plural = "Personas"

    def __unicode__(self):
        return self.nombre

    def __str__(self):
        return self.nombre


class Provicias(models.Model):
    cod_provincia = models.IntegerField(primary_key=True)
    provincia = models.TextField(max_length=150)
    cod_pais = models.ForeignKey("Paises", on_delete=models.CASCADE)


class Paises(models.Model):
    cod_pais = models.IntegerField(primary_key=True)
    pais = models.CharField(max_length=250)


class Clientes(Persona):
    id_cliente = models.IntegerField(primary_key=True)
    nro_afiliado = models.IntegerField()


class Empleado(Persona):
    id_empleado = models.IntegerField(primary_key=True)
    id_tipo_empleado = models.ForeignKey("Tipo_empleado", on_delete=models.CASCADE)
    id_tipo_estado_empleado = models.ForeignKey(
        "Tipo_estado_empleado", on_delete=models.CASCADE
    )
    fecha_ingreso = models.DateTimeField()
    sueldo = models.DecimalField()


class Tipo_empleado(models.Model):
    id_tipo_empleado = models.IntegerField(primary_key=True)
    tipo_empleado = models.TextField(max_length=150)


class Tipo_estado_empleado(models.Model):
    id_tipo_estado_empleado = models.IntegerField(primary_key=True)
    tipo_estado_empleado = models.TextField(max_length=150)


class Cuenta(models.Model):
    id_cuenta = models.IntegerField()
    id_tipo_estado = models.ForeignKey("Tipo_estado_cuenta", on_delete=models.CASCADE)


class Tipo_estado_cuenta(models.Model):
    id_tipo_estado_cuenta = models.IntegerField(primary_key=True)
    tipo_estado_cuenta = models.TextField(max_length=150)
