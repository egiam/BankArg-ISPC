create database BankArg;
use BankArg;

CREATE TABLE `Documentos` (
  `id_tipo_doc` int,
  `tipo_doc` varchar(150),
  KEY `pk` (`id_tipo_doc`)
);

CREATE TABLE `Sexos` (
  `id_tipo_sexo` int,
  `tipo` varchar(150),
  KEY `pk` (`id_tipo_sexo`)
);

CREATE TABLE `paises` (
  `cod_pais` int,
  `pais` varchar(250),
  KEY `pk` (`cod_pais`)
);

CREATE TABLE `provincias` (
  `cod_provincia` int,
  `provincia` varchar(150),
  `cod_pais` int,
  FOREIGN KEY (`cod_pais`) REFERENCES `paises`(`cod_pais`),
  KEY `pk` (`cod_provincia`),
  KEY `fk` (`cod_pais`)
);

CREATE TABLE `localidades` (
  `cod_localidad` int,
  `localidad` varchar(150),
  `cod_provincia` int,
  FOREIGN KEY (`cod_provincia`) REFERENCES `provincias`(`cod_provincia`),
  KEY `pk` (`cod_localidad`),
  KEY `fk` (`cod_provincia`)
);

CREATE TABLE `Clientes` (
  `id_cliente` int,
  `nombre` varchar(120),
  `apellido` varchar(120),
  `id_tipo_doc` int,
  `nro_doc` varchar(20), -- Varchar x si hay gente de algun otro pais donde la identificacion tiene numeros. 20 maximo x si se pone puntos o etc.
  `cod_localidad` int,
  `nro_calle` int,
  `calle` varchar(150),
  `nro_afiliado` int,
  `fecha_nac` datetime,
  `id_tipo_sexo` int,
  FOREIGN KEY (`id_tipo_doc`) REFERENCES `Documentos`(`id_tipo_doc`),
  FOREIGN KEY (`id_tipo_sexo`) REFERENCES `Sexos`(`id_tipo_sexo`),
  FOREIGN KEY (`cod_localidad`) REFERENCES `localidades`(`cod_localidad`),
  KEY `pk` (`id_cliente`),
  KEY `fk` (`id_tipo_doc`, `cod_localidad`, `id_tipo_sexo`)
);

CREATE TABLE `Tipos_transferencias` (
  `id_tipo_transferencia` int,
  `tipo_transferencia` varchar(250),
  KEY `pk` (`id_tipo_transferencia`)
);

CREATE TABLE `Transferencias` (
  `id_transferencia` int,
  `id_tipo_transferencia` int,
  `id_cliente` int,
  `fecha` datetime,
  `monto` int,
  `cuenta_envio` varchar(150), -- varchar x codigo o similar
  `cuenta_recibo` varchar(150), -- varchar x codigo o similar
  FOREIGN KEY (`id_tipo_transferencia`) REFERENCES `Tipos_transferencias`(`id_tipo_transferencia`),
  FOREIGN KEY (`id_cliente`) REFERENCES `Clientes`(`id_cliente`),
  KEY `pk` (`id_transferencia`),
  KEY `fk` (`id_tipo_transferencia`, `id_cliente`)
);

CREATE TABLE `Cuenta` (
  `id_cuenta` int,
  `id_cliente` int,
  `Monto` int,
  `fecha_creacion` datetime,
  `CBU` varchar(75),
  `Alias` varchar(150),
  `Credito` boolean,
  `Debito` boolean,
  KEY `pk` (`id_cuenta`),
  KEY `fk` (`id_cliente`)
);

CREATE TABLE `Cuenta-Transferencia` (
  `id_cuenta` int,
  `id_transferencia` int,
  FOREIGN KEY (`id_transferencia`) REFERENCES `Transferencias`(`id_transferencia`),
  FOREIGN KEY (`id_cuenta`) REFERENCES `Cuenta`(`id_cuenta`),
  KEY `pk` (`id_cuenta`, `id_transferencia`)
);

CREATE TABLE `Tipos_contactos` (
  `id_tipo_contacto` int,
  `tipo_contacto` varchar(150),
  KEY `pk` (`id_tipo_contacto`)
);

CREATE TABLE `Empleados` (
  `id_empleado` int,
  `nombre` varchar(120),
  `apellido` varchar(120),
  `id_tipo_doc` int,
  `nro_doc` varchar(20), -- Varchar x si hay gente de algun otro pais donde la identificacion tiene numeros. 20 maximo x si se pone puntos o etc.
  `cod_localidad` int,
  `nro_calle` int,
  `calle` varchar(150),
  `fecha_nac` datetime,
  `id_tipo_sexo` int,
  FOREIGN KEY (`id_tipo_sexo`) REFERENCES `Sexos`(`id_tipo_sexo`),
  FOREIGN KEY (`id_tipo_doc`) REFERENCES `Documentos`(`id_tipo_doc`),
  FOREIGN KEY (`cod_localidad`) REFERENCES `localidades`(`cod_localidad`),
  KEY `pk` (`id_empleado`),
  KEY `fk` (`id_tipo_doc`, `cod_localidad`, `id_tipo_sexo`)
);

CREATE TABLE `Contactos` (
  `id_contactos` int,
  `id_tipo_contacto` int,
  `id_cliente` int,
  `id_empleado` int,
  FOREIGN KEY (`id_cliente`) REFERENCES `Clientes`(`id_cliente`),
  FOREIGN KEY (`id_empleado`) REFERENCES `Empleados`(`id_empleado`),
  FOREIGN KEY (`id_tipo_contacto`) REFERENCES `Tipos_contactos`(`id_tipo_contacto`),
  KEY `pk` (`id_contactos`),
  KEY `fk` (`id_tipo_contacto`, `id_cliente`, `id_empleado`)
);

CREATE TABLE `Prestamos` (
  `id_prestamo` int,
  `id_cuenta` int,
  `Monto` int,
  `interes_mes_porcentaje` int,
  `fec_start` datetime,
  `fec_venc` datetime,
  FOREIGN KEY (`id_cuenta`) REFERENCES `Cuenta`(`id_cuenta`),
  KEY `pk` (`id_prestamo`),
  KEY `fk` (`id_cuenta`)
);

