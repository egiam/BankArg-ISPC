-- Insertar cliente con parametros
DELIMITER $$
CREATE or REPLACE Procedure `insert_cliente`(
    IN `p_nombre` VARCHAR(120),
    IN `p_apellido` VARCHAR(120),
    IN `p_id_tipo_doc` INT,
    IN `p_nro_doc` VARCHAR(20),
    IN `p_cod_localidad` INT,
    IN `p_nro_calle` INT,
    IN `p_calle` VARCHAR(150),
    IN `p_nro_afiliado` INT,
    IN `p_fecha_nac` DATE,
    IN `p_id_tipo_sexo` INT
)
BEGIN
    INSERT INTO `Clientes` (`nombre`, `apellido`, `id_tipo_doc`, `nro_doc`, `cod_localidad`, `nro_calle`, `calle`, `nro_afiliado`, `fecha_nac`, `id_tipo_sexo`) VALUES (p_nombre, p_apellido, p_id_tipo_doc, p_nro_doc, p_cod_localidad, p_nro_calle, p_calle, p_nro_afiliado, p_fecha_nac, p_id_tipo_sexo);
END$$
DELIMITER ;

call insert_cliente('Juan', 'Perez', 1, '12345678', 1, 123, 'Av. Siempre Viva', 1, '1990-01-01', 1);

-- Insertar Transferencias con parametros
DELIMITER $$
CREATE or REPLACE Procedure `insert_transferencia`(
    IN `p_id_tipo_transferencia` INT,
    in `p_id_cliente` INT,
    in `p_fecha` DATE,
    in `p_monto` int,
    in `p_cuenta_envio` varchar(150),
    in `p_cuenta_recibo` varchar(150)
)
BEGIN
    INSERT INTO `Transferencias` (`id_tipo_transferencia`, `id_cliente`, `fecha`, `monto`, `cuenta_envio`, `cuenta_recibo`) VALUES (p_id_tipo_transferencia, p_id_cliente, p_fecha, p_monto, p_cuenta_envio, p_cuenta_recibo);
END$$
DELIMITER ;

call insert_transferencia(1, 1, '2019-01-01', 1000.0, '12345678', '87654321');

-- Insertar Cuenta con parametros
DELIMITER $$
CREATE or REPLACE Procedure `insert_cuenta`(
    IN `p_id_cliente` INT,
    IN `p_id_tipo_cuenta` INT,
    in `id_tipo_moneda` INT,
    IN `p_id_tipo_estado_cuenta` INT,
    in `p_monto` int,
    in `p_fecha_creacion` DATE,
    in `p_CBU` varchar(75),
    in `p_alias` varchar(150),
    in `p_password` varchar(250),
    in `p_credito` boolean,
    in `p_debito` boolean
)
BEGIN
    INSERT INTO `Cuenta` (`id_cliente`, `id_tipo_cuenta`, `id_tipo_moneda`, `id_tipo_estado_cuenta`, `monto`, `fecha_creacion`, `CBU`, `alias`, `password`, `credito`, `debito`) VALUES (p_id_cliente, p_id_tipo_cuenta, id_tipo_moneda, p_id_tipo_estado_cuenta, p_monto, p_fecha_creacion, p_CBU, p_alias, p_password, p_credito, p_debito);
END$$
DELIMITER ;

call insert_cuenta(1, 1, 1, 1, 1000.0, '2019-01-01', '12345678', 'Cuenta de Juan', '12345678', true, true);

-- Insertar Empleados con parametros
DELIMITER $$
CREATE or REPLACE Procedure `insert_empleado`(
    IN `p_nombre` VARCHAR(120),
    IN `p_apellido` VARCHAR(120),
    IN `p_id_tipo_doc` INT,
    IN `p_nro_doc` VARCHAR(20),
    IN `p_cod_localidad` INT,
    IN `p_nro_calle` INT,
    IN `p_calle` VARCHAR(150),
    IN `p_fecha_nac` DATE,
    IN `p_id_tipo_sexo` INT,
    IN `p_id_tipo_empleado` INT,
    IN `p_id_tipo_estado_empleado` INT,
    IN `p_fecha_ingreso` DATE,
    IN `p_sueldo` DECIMAL(10,2)
)
BEGIN
    INSERT INTO `Empleados` (`nombre`, `apellido`, `id_tipo_doc`, `nro_doc`, `cod_localidad`, `nro_calle`, `calle`, `fecha_nac`, `id_tipo_sexo`, `id_tipo_empleado`, `id_tipo_estado_empleado`, `fecha_ingreso`, `sueldo`) VALUES (p_nombre, p_apellido, p_id_tipo_doc, p_nro_doc, p_cod_localidad, p_nro_calle, p_calle, p_fecha_nac, p_id_tipo_sexo, p_id_tipo_empleado, p_id_tipo_estado_empleado, p_fecha_ingreso, p_sueldo);
END$$
DELIMITER ;

call insert_empleado('Juan', 'Perez', 1, '12345678', 1, 123, 'Av. Siempre Viva', '1990-01-01', 1, 1, 1, '2019-01-01', 1000.0);

-- Insertar Contactos con parametros
DELIMITER $$
CREATE or REPLACE Procedure `insert_contacto`(
    IN `p_id_cliente` INT,
    in `p_id_empleado` INT,
    IN `p_id_tipo_contacto` INT,
    IN `p_contactos` VARCHAR(150)
)
BEGIN
    INSERT INTO `Contactos` (`id_cliente`, `id_empleado`, `id_tipo_contacto`, `contactos`) VALUES (p_id_cliente, p_id_empleado, p_id_tipo_contacto, p_contactos);
END$$
DELIMITER ;

call insert_contacto(1, null, 2, '12345678');
call insert_contacto(null, 1, 2, '12345678');

-- Insertar Prestamos con parametros
DELIMITER $$
CREATE or REPLACE Procedure `insert_prestamo`(
    IN `p_id_cliente` INT,
    IN `p_id_tipo_prestamo` INT,
    IN `p_id_tipo_estado_prestamo` INT,
    IN `p_id_tipo_moneda` INT,
    IN `p_id_tipo_cuota` INT,
    in `p_id_tipo_interes` INT,
    in `p_id_cantidad_cuotas` INT,
    IN `p_monto` int,
    IN `p_fecha_creacion` DATE,
    IN `p_fecha_vencimiento` DATE,
    IN `p_fecha_pago` DATE,
    in `p_fecha_cancelacion` DATE,
    in `p_fecha_ultimo_pago` DATE,
    in `p_monto_cuota` int,
    in `p_monto_interes` int,
    in `p_monto_total` int,
    in `p_monto_ultimo_pago` int,
    in `p_monto_cancelado` int,
    in `p_monto_pendiente` int
)
BEGIN
    INSERT INTO `Prestamos` (`id_cliente`, `id_tipo_prestamo`, `id_tipo_estado_prestamo`, `id_tipo_moneda`, `id_tipo_cuota`, `id_tipo_interes`, `id_cantidad_cuotas`, `monto`, `fecha_creacion`, `fecha_vencimiento`, `fecha_pago`, `fecha_cancelacion`, `fecha_ultimo_pago`, `monto_cuota`, `monto_interes`, `monto_total`, `monto_ultimo_pago`, `monto_cancelado`, `monto_pendiente`) VALUES (p_id_cliente, p_id_tipo_prestamo, p_id_tipo_estado_prestamo, p_id_tipo_moneda, p_id_tipo_cuota, p_id_tipo_interes, p_id_cantidad_cuotas, p_monto, p_fecha_creacion, p_fecha_vencimiento, p_fecha_pago, p_fecha_cancelacion, p_fecha_ultimo_pago, p_monto_cuota, p_monto_interes, p_monto_total, p_monto_ultimo_pago, p_monto_cancelado, p_monto_pendiente);
END$$
DELIMITER ;

call insert_prestamo(1, 1, 1, 1, 1, 1, 1, 1000, '2019-01-01', '2019-01-01', '2019-01-01', '2019-01-01', '2019-01-01', 1000, 1000, 1000, 1000, 1000, 1000);

-- Insertar Cuotas con parametros
DELIMITER $$
CREATE or REPLACE Procedure `insert_cuota`(
    IN `p_id_prestamo` INT,
    IN `p_nro_cuota` INT,
    in `p_id_tipo_cuota` INT,
    in `p_id_tipo_estado_cuota` INT,
    IN `p_fecha_vencimiento` DATE,
    IN `p_fecha_pago` DATE,
    IN `p_monto` int
)
BEGIN
    INSERT INTO `Cuotas` (`id_prestamo`, `nro_cuota`, `id_tipo_cuota`, `id_tipo_estado_cuota`, `fecha_vencimiento`, `fecha_pago`, `monto`) VALUES (p_id_prestamo, p_nro_cuota, p_id_tipo_cuota, p_id_tipo_estado_cuota, p_fecha_vencimiento, p_fecha_pago, p_monto);
END$$
DELIMITER ;

call insert_cuota(3, 1, 1, 1, '2019-01-01', '2019-01-01', 1000);
