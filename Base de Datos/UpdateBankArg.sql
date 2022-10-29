-- Update de clientes con parametros
DELIMITER $$
CREATE OR REPLACE PROCEDURE update_cliente(
    IN p_id_cliente INT,
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
    UPDATE Clientes
    SET nombre = p_nombre,
        apellido = p_apellido,
        id_tipo_doc = p_id_tipo_doc,
        nro_doc = p_nro_doc,
        cod_localidad = p_cod_localidad,
        nro_calle = p_nro_calle,
        calle = p_calle,
        nro_afiliado = p_nro_afiliado,
        fecha_nac = p_fecha_nac,
        id_tipo_sexo = p_id_tipo_sexo
    WHERE id_cliente = p_id_cliente;
END$$
DELIMITER ;

call update_cliente(1, 'Juan', 'Perez', 1, '12345678', 1, 123, 'Av. Siempre Viva', 1, '1990-01-01', 1);

-- Update Transferencias con parametros y validacion
DELIMITER $$
CREATE OR REPLACE PROCEDURE update_transferencia(
    IN p_id_transferencia INT,
    IN `p_id_tipo_transferencia` INT,
    in `p_id_cliente` INT,
    in `p_fecha` DATE,
    in `p_monto` int,
    in `p_cuenta_envio` varchar(150),
    in `p_cuenta_recibo` varchar(150)
)
BEGIN
    UPDATE Transferencias
    SET id_tipo_transferencia = p_id_tipo_transferencia,
        id_cliente = p_id_cliente,
        fecha = p_fecha,
        monto = p_monto,
        cuenta_envio = p_cuenta_envio,
        cuenta_recibo = p_cuenta_recibo
    WHERE id_transferencia = p_id_transferencia;
END$$
DELIMITER ;

call update_transferencia(1, 1, 1, '2021-01-01', 1000, '12345678', '87654321');

-- Update de cuentas con parametros y validacion
DELIMITER $$
CREATE OR REPLACE PROCEDURE update_cuenta(
    IN p_id_cuenta INT,
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
    UPDATE Cuenta
    SET id_cliente = p_id_cliente,
        id_tipo_cuenta = p_id_tipo_cuenta,
        id_tipo_moneda = id_tipo_moneda,
        id_tipo_estado_cuenta = p_id_tipo_estado_cuenta,
        monto = p_monto,
        fecha_creacion = p_fecha_creacion,
        CBU = p_CBU,
        alias = p_alias,
        password = p_password,
        credito = p_credito,
        debito = p_debito
    WHERE id_cuenta = p_id_cuenta;
END$$
DELIMITER ;

call update_cuenta(1, 1, 1, 1, 1, 1000, '2021-01-01', '12345678', 'Cuenta de Juan', '12345678', true, true);

-- Update Empleados con parametros y validacion
DELIMITER $$
CREATE OR REPLACE PROCEDURE update_empleado(
    IN p_id_empleado INT,
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
    UPDATE Empleados
    SET nombre = p_nombre,
        apellido = p_apellido,
        id_tipo_doc = p_id_tipo_doc,
        nro_doc = p_nro_doc,
        cod_localidad = p_cod_localidad,
        nro_calle = p_nro_calle,
        calle = p_calle,
        fecha_nac = p_fecha_nac,
        id_tipo_sexo = p_id_tipo_sexo,
        id_tipo_empleado = p_id_tipo_empleado,
        id_tipo_estado_empleado = p_id_tipo_estado_empleado,
        fecha_ingreso = p_fecha_ingreso,
        sueldo = p_sueldo
    WHERE id_empleado = p_id_empleado;
END$$
DELIMITER ;

call update_empleado(1, 'Juan', 'Perez', 1, '12345678', 1, 123, 'Av. Siempre Viva', '1990-01-01', 1, 1, 1, '2021-01-01', 1000);

-- Update Contactos con parametros y validacion
DELIMITER $$
CREATE OR REPLACE PROCEDURE update_contacto(
    IN p_id_contacto INT,
    IN `p_id_cliente` INT,
    in `p_id_empleado` INT,
    IN `p_id_tipo_contacto` INT,
    IN `p_contactos` VARCHAR(150)
)
BEGIN
    UPDATE Contactos
    SET id_cliente = p_id_cliente,
        id_empleado = p_id_empleado,
        id_tipo_contacto = p_id_tipo_contacto,
        contactos = p_contactos
    WHERE id_contactos = p_id_contacto;
END$$
DELIMITER ;

call update_contacto(1, null, 1, 1, '12345678');
call update_contacto(1, 1, null, 1, '12345678');

-- Update Prestamos con parametros y validacion
DELIMITER $$
CREATE OR REPLACE PROCEDURE update_prestamo(
    IN p_id_prestamo INT,
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
    UPDATE Prestamos
    SET id_cliente = p_id_cliente,
        id_tipo_prestamo = p_id_tipo_prestamo,
        id_tipo_estado_prestamo = p_id_tipo_estado_prestamo,
        id_tipo_moneda = p_id_tipo_moneda,
        id_tipo_cuota = p_id_tipo_cuota,
        id_tipo_interes = p_id_tipo_interes,
        id_cantidad_cuotas = p_id_cantidad_cuotas,
        monto = p_monto,
        fecha_creacion = p_fecha_creacion,
        fecha_vencimiento = p_fecha_vencimiento,
        fecha_pago = p_fecha_pago,
        fecha_cancelacion = p_fecha_cancelacion,
        fecha_ultimo_pago = p_fecha_ultimo_pago,
        monto_cuota = p_monto_cuota,
        monto_interes = p_monto_interes,
        monto_total = p_monto_total,
        monto_ultimo_pago = p_monto_ultimo_pago,
        monto_cancelado = p_monto_cancelado,
        monto_pendiente = p_monto_pendiente
    WHERE id_prestamo = p_id_prestamo;
END$$
DELIMITER ;

call update_prestamo(1, 1, 1, 1, 1, 1, 1, 1, 1000, '2021-01-01', '2021-01-01', '2021-01-01', '2021-01-01', '2021-01-01', 1000, 1000, 1000, 1000, 1000, 1000);

-- Update Cuotas con parametros y validacion
DELIMITER $$
CREATE OR REPLACE PROCEDURE update_cuota(
    IN p_id_cuota INT,
    IN `p_id_prestamo` INT,
    IN `p_nro_cuota` INT,
    in `p_id_tipo_cuota` INT,
    in `p_id_tipo_estado_cuota` INT,
    IN `p_fecha_vencimiento` DATE,
    IN `p_fecha_pago` DATE,
    IN `p_monto` int
)
BEGIN
    UPDATE Cuotas
    SET id_prestamo = p_id_prestamo,
        nro_cuota = p_nro_cuota,
        id_tipo_cuota = p_id_tipo_cuota,
        id_tipo_estado_cuota = p_id_tipo_estado_cuota,
        fecha_vencimiento = p_fecha_vencimiento,
        fecha_pago = p_fecha_pago,
        monto = p_monto
    WHERE id_cuota = p_id_cuota;
END$$
DELIMITER ;

call update_cuota(1, 1, 1, 1, 1, '2021-01-01', '2021-01-01', 1000);

