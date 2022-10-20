create database BankArg;
use BankArg;

-- Joaco
CREATE TABLE `Documentos` (
  `id_tipo_doc` int NOT NULL AUTO_INCREMENT,
  `tipo_doc` varchar(150),
  KEY `pk` (`id_tipo_doc`)
);

-- Joaco
CREATE TABLE `Sexos` (
  `id_tipo_sexo` int NOT NULL AUTO_INCREMENT,
  `tipo` varchar(150),
  KEY `pk` (`id_tipo_sexo`)
);

-- Eze
CREATE TABLE `paises` (
  `cod_pais` int NOT NULL AUTO_INCREMENT,
  `pais` varchar(250),
  KEY `pk` (`cod_pais`)
);

-- Eze
CREATE TABLE `provincias` (
  `cod_provincia` int NOT NULL AUTO_INCREMENT,
  `provincia` varchar(150),
  `cod_pais` int NOT NULL,
  FOREIGN KEY (`cod_pais`) REFERENCES `paises`(`cod_pais`),
  KEY `pk` (`cod_provincia`),
  KEY `fk` (`cod_pais`)
);

-- Eze
CREATE TABLE `localidades` (
  `cod_localidad` int NOT NULL AUTO_INCREMENT,
  `localidad` varchar(150),
  `cod_provincia` int NOT NULL,
  FOREIGN KEY (`cod_provincia`) REFERENCES `provincias`(`cod_provincia`),
  KEY `pk` (`cod_localidad`),
  KEY `fk` (`cod_provincia`)
);


CREATE TABLE `Clientes` (
  `id_cliente` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(120),
  `apellido` varchar(120),
  `id_tipo_doc` int NOT NULL,
  `nro_doc` varchar(20), -- Varchar x si hay gente de algun otro pais donde la identificacion tiene numeros. 20 maximo x si se pone puntos o etc.
  `cod_localidad` int NOT NULL,
  `nro_calle` int,
  `calle` varchar(150),
  `nro_afiliado` int,
  `fecha_nac` datetime,
  `id_tipo_sexo` int NOT NULL,
  FOREIGN KEY (`id_tipo_doc`) REFERENCES `Documentos`(`id_tipo_doc`),
  FOREIGN KEY (`id_tipo_sexo`) REFERENCES `Sexos`(`id_tipo_sexo`),
  FOREIGN KEY (`cod_localidad`) REFERENCES `localidades`(`cod_localidad`),
  KEY `pk` (`id_cliente`),
  KEY `fk` (`id_tipo_doc`, `cod_localidad`, `id_tipo_sexo`)
);

-- Maxi
CREATE TABLE `Tipos_transferencias` (
  `id_tipo_transferencia` int NOT NULL AUTO_INCREMENT,
  `tipo_transferencia` varchar(250),
  KEY `pk` (`id_tipo_transferencia`)
);

CREATE TABLE `Transferencias` (
  `id_transferencia` int NOT NULL AUTO_INCREMENT,
  `id_tipo_transferencia` int NOT NULL,
  `id_cliente` int NOT NULL,
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
  `id_cuenta` int NOT NULL AUTO_INCREMENT,
  `id_cliente` int NOT NULL,
  `Monto` int,
  `fecha_creacion` datetime,
  `CBU` varchar(75),
  `Alias` varchar(150),
  `password` varchar(250),
  `Credito` boolean,
  `Debito` boolean,
  KEY `pk` (`id_cuenta`),
  KEY `fk` (`id_cliente`)
);

CREATE TABLE `Cuenta-Transferencia` (
  `id_cuenta` int NOT NULL AUTO_INCREMENT,
  `id_transferencia` int NOT NULL,
  FOREIGN KEY (`id_transferencia`) REFERENCES `Transferencias`(`id_transferencia`),
  FOREIGN KEY (`id_cuenta`) REFERENCES `Cuenta`(`id_cuenta`),
  KEY `pk` (`id_cuenta`, `id_transferencia`)
);

-- Maxi
CREATE TABLE `Tipos_contactos` (
  `id_tipo_contacto` int NOT NULL AUTO_INCREMENT,
  `tipo_contacto` varchar(150),
  KEY `pk` (`id_tipo_contacto`)
);

CREATE TABLE `Empleados` (
  `id_empleado` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(120),
  `apellido` varchar(120),
  `id_tipo_doc` int NOT NULL,
  `nro_doc` varchar(20), -- Varchar x si hay gente de algun otro pais donde la identificacion tiene numeros. 20 maximo x si se pone puntos o etc.
  `cod_localidad` int NOT NULL,
  `nro_calle` int NOT NULL,
  `calle` varchar(150),
  `fecha_nac` datetime,
  `id_tipo_sexo` int NOT NULL,
  FOREIGN KEY (`id_tipo_sexo`) REFERENCES `Sexos`(`id_tipo_sexo`),
  FOREIGN KEY (`id_tipo_doc`) REFERENCES `Documentos`(`id_tipo_doc`),
  FOREIGN KEY (`cod_localidad`) REFERENCES `localidades`(`cod_localidad`),
  KEY `pk` (`id_empleado`),
  KEY `fk` (`id_tipo_doc`, `cod_localidad`, `id_tipo_sexo`)
);

CREATE TABLE `Contactos` (
  `id_contactos` int NOT NULL AUTO_INCREMENT,
  `id_tipo_contacto` int NOT NULL,
  `id_cliente` int NOT NULL,
  `id_empleado` int NOT NULL,
  FOREIGN KEY (`id_cliente`) REFERENCES `Clientes`(`id_cliente`),
  FOREIGN KEY (`id_empleado`) REFERENCES `Empleados`(`id_empleado`),
  FOREIGN KEY (`id_tipo_contacto`) REFERENCES `Tipos_contactos`(`id_tipo_contacto`),
  KEY `pk` (`id_contactos`),
  KEY `fk` (`id_tipo_contacto`, `id_cliente`, `id_empleado`)
);

CREATE TABLE `Prestamos` (
  `id_prestamo` int NOT NULL AUTO_INCREMENT,
  `id_cuenta` int NOT NULL,
  `Monto` int,
  `interes_mes_porcentaje` int,
  `fec_start` datetime,
  `fec_venc` datetime,
  FOREIGN KEY (`id_cuenta`) REFERENCES `Cuenta`(`id_cuenta`),
  KEY `pk` (`id_prestamo`),
  KEY `fk` (`id_cuenta`)
);





-- Insertar Paises

insert into paises (nombre_pais) values ('Argentina');
insert into paises (nombre_pais) values ('Brasil');
insert into paises (nombre_pais) values ('Chile');
insert into paises (nombre_pais) values ('Uruguay');
insert into paises (nombre_pais) values ('Paraguay');
insert into paises (nombre_pais) values ('Bolivia');
insert into paises (nombre_pais) values ('Peru');
insert into paises (nombre_pais) values ('Ecuador');
insert into paises (nombre_pais) values ('Colombia');
insert into paises (nombre_pais) values ('Venezuela');
insert into paises (nombre_pais) values ('Panama');
insert into paises (nombre_pais) values ('Costa Rica');
insert into paises (nombre_pais) values ('El Salvador');
insert into paises (nombre_pais) values ('Guatemala');
insert into paises (nombre_pais) values ('Honduras');
insert into paises (nombre_pais) values ('Nicaragua');
insert into paises (nombre_pais) values ('Mexico');
insert into paises (nombre_pais) values ('Estados Unidos');
insert into paises (nombre_pais) values ('Canada');
insert into paises (nombre_pais) values ('España');
insert into paises (nombre_pais) values ('Francia');
insert into paises (nombre_pais) values ('Italia');
insert into paises (nombre_pais) values ('Alemania');
insert into paises (nombre_pais) values ('Inglaterra');
insert into paises (nombre_pais) values ('Portugal');
insert into paises (nombre_pais) values ('Rusia');
insert into paises (nombre_pais) values ('China');
insert into paises (nombre_pais) values ('Japon');
insert into paises (nombre_pais) values ('Corea del Sur');
insert into paises (nombre_pais) values ('Australia');
insert into paises (nombre_pais) values ('Nueva Zelanda');
insert into paises (nombre_pais) values ('Sudafrica');
insert into paises (nombre_pais) values ('Otro');

select * from paises


-- Insertar Provincias

-- Arg
insert into provincias values ('Buenos Aires', 1);
insert into provincias values ('Catamarca', 1);
insert into provincias values ('Chaco', 1);
insert into provincias values ('Chubut', 1);
insert into provincias values ('Cordoba', 1);
insert into provincias values ('Corrientes', 1);
insert into provincias values ('Entre Rios', 1);
insert into provincias values ('Formosa', 1);
insert into provincias values ('Jujuy', 1);
insert into provincias values ('La Pampa', 1);
insert into provincias values ('La Rioja', 1);
insert into provincias values ('Mendoza', 1);
insert into provincias values ('Misiones', 1);
insert into provincias values ('Neuquen', 1);

-- Brasil
insert into provincias values ('Acre', 2);
insert into provincias values ('Alagoas', 2);
insert into provincias values ('Amapa', 2);
insert into provincias values ('Amazonas', 2);
insert into provincias values ('Bahia', 2);
insert into provincias values ('Ceara', 2);
insert into provincias values ('Distrito Federal', 2);
insert into provincias values ('Espirito Santo', 2);
insert into provincias values ('Goias', 2);
insert into provincias values ('Maranhao', 2);
insert into provincias values ('Mato Grosso', 2);
insert into provincias values ('Mato Grosso do Sul', 2);
insert into provincias values ('Minas Gerais', 2);
insert into provincias values ('Para', 2);
insert into provincias values ('Paraiba', 2);
insert into provincias values ('Parana', 2);
insert into provincias values ('Pernambuco', 2);
insert into provincias values ('Piaui', 2);
insert into provincias values ('Rio de Janeiro', 2);
insert into provincias values ('Rio Grande do Norte', 2);
insert into provincias values ('Rio Grande do Sul', 2);
insert into provincias values ('Rondonia', 2);
insert into provincias values ('Roraima', 2);
insert into provincias values ('Santa Catarina', 2);
insert into provincias values ('Sao Paulo', 2);
insert into provincias values ('Sergipe', 2);
insert into provincias values ('Tocantins', 2);

-- Chile
insert into provincias values ('Arica y Parinacota', 3);
insert into provincias values ('Tarapaca', 3);
insert into provincias values ('Antofagasta', 3);
insert into provincias values ('Atacama', 3);
insert into provincias values ('Coquimbo', 3);
insert into provincias values ('Valparaiso', 3);
insert into provincias values ('Metropolitana de Santiago', 3);
insert into provincias values ('Libertador General Bernardo O''Higgins', 3);
insert into provincias values ('Maule', 3);
insert into provincias values ('Biobio', 3);
insert into provincias values ('La Araucania', 3);
insert into provincias values ('Los Rios', 3);
insert into provincias values ('Los Lagos', 3);
insert into provincias values ('Aysen del General Carlos Ibanez del Campo', 3);
insert into provincias values ('Magallanes y de la Antartica Chilena', 3);

-- Uruguay
insert into provincias values ('Artigas', 4);
insert into provincias values ('Canelones', 4);
insert into provincias values ('Cerro Largo', 4);
insert into provincias values ('Colonia', 4);
insert into provincias values ('Durazno', 4);
insert into provincias values ('Flores', 4);
insert into provincias values ('Florida', 4);
insert into provincias values ('Lavalleja', 4);
insert into provincias values ('Maldonado', 4);
insert into provincias values ('Montevideo', 4);
insert into provincias values ('Paysandu', 4);

-- Paraguay
insert into provincias values ('Alto Parana', 5);
insert into provincias values ('Alto Paraguay', 5);
insert into provincias values ('Amambay', 5);
insert into provincias values ('Asuncion', 5);
insert into provincias values ('Boqueron', 5);
insert into provincias values ('Caaguazu', 5);
insert into provincias values ('Caazapa', 5);
insert into provincias values ('Canindeyu', 5);
insert into provincias values ('Central', 5);
insert into provincias values ('Concepcion', 5);
insert into provincias values ('Cordillera', 5);
insert into provincias values ('Guaira', 5);
insert into provincias values ('Itapua', 5);
insert into provincias values ('Misiones', 5);
insert into provincias values ('Neembucu', 5);
insert into provincias values ('Paraguari', 5);
insert into provincias values ('Presidente Hayes', 5);
insert into provincias values ('San Pedro', 5);

-- Bolivia
insert into provincias values ('Chuquisaca', 6);
insert into provincias values ('Cochabamba', 6);
insert into provincias values ('El Beni', 6);
insert into provincias values ('La Paz', 6);
insert into provincias values ('Oruro', 6);
insert into provincias values ('Pando', 6);
insert into provincias values ('Potosi', 6);
insert into provincias values ('Santa Cruz', 6);
insert into provincias values ('Tarija', 6);

-- Peru
insert into provincias values ('Amazonas', 7);
insert into provincias values ('Ancash', 7);
insert into provincias values ('Apurimac', 7);
insert into provincias values ('Arequipa', 7);
insert into provincias values ('Ayacucho', 7);
insert into provincias values ('Cajamarca', 7);
insert into provincias values ('Callao', 7);
insert into provincias values ('Cusco', 7);
insert into provincias values ('Huancavelica', 7);
insert into provincias values ('Huanuco', 7);
insert into provincias values ('Ica', 7);
insert into provincias values ('Junin', 7);
insert into provincias values ('La Libertad', 7);
insert into provincias values ('Lambayeque', 7);
insert into provincias values ('Lima', 7);
insert into provincias values ('Loreto', 7);
insert into provincias values ('Madre de Dios', 7);
insert into provincias values ('Moquegua', 7);
insert into provincias values ('Pasco', 7);
insert into provincias values ('Piura', 7);
insert into provincias values ('Puno', 7);
insert into provincias values ('San Martin', 7);
insert into provincias values ('Tacna', 7);
insert into provincias values ('Tumbes', 7);
insert into provincias values ('Ucayali', 7);

-- Ecuador
insert into provincias values ('Azuay', 8);
insert into provincias values ('Bolivar', 8);
insert into provincias values ('Quito', 8);
insert into provincias values ('Carchi', 8);

-- Colombia
insert into provincias values ('Amazonas', 9);
insert into provincias values ('Antioquia', 9);
insert into provincias values ('Arauca', 9);
insert into provincias values ('Atlantico', 9);
insert into provincias values ('Bogota', 9);
insert into provincias values ('Bolivar', 9);

-- Venezuela
insert into provincias values ('Caracas', 10);
insert into provincias values ('Miranda', 10);
insert into provincias values ('Distrito Capital', 10);

-- Estados Unidos
insert into provincias values ('Alabama', 11);
insert into provincias values ('Alaska', 11);
insert into provincias values ('Arizona', 11);
insert into provincias values ('Arkansas', 11);
insert into provincias values ('California', 11);
insert into provincias values ('Colorado', 11);
insert into provincias values ('Connecticut', 11);
insert into provincias values ('Delaware', 11);
insert into provincias values ('Florida', 11);
insert into provincias values ('Georgia', 11);
insert into provincias values ('Hawaii', 11);
insert into provincias values ('Idaho', 11);
insert into provincias values ('Illinois', 11);
insert into provincias values ('Indiana', 11);
insert into provincias values ('Iowa', 11);
insert into provincias values ('Kansas', 11);
insert into provincias values ('Kentucky', 11);
insert into provincias values ('Louisiana', 11);
insert into provincias values ('Maine', 11);
insert into provincias values ('Maryland', 11);
insert into provincias values ('Massachusetts', 11);
insert into provincias values ('Michigan', 11);
insert into provincias values ('Minnesota', 11);
insert into provincias values ('Mississippi', 11);
insert into provincias values ('Missouri', 11);
insert into provincias values ('Montana', 11);


