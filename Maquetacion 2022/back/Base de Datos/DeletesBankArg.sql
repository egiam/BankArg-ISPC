-- Delete row en cliente con parametros y validacion
DELIMITER $$
CREATE or REPLACE PROCEDURE `delete_cliente`(IN p_id_cliente INT)
BEGIN
    IF EXISTS (SELECT * FROM Clientes WHERE id_cliente = p_id_cliente) THEN
        DELETE FROM Clientes WHERE id_cliente = p_id_cliente;
    ELSE
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'No existe el cliente';
    END IF;
END$$
DELIMITER ;

call delete_cliente(100);

-- Delete row en Transferencias con parametros y validacion
DELIMITER $$
CREATE or REPLACE PROCEDURE `delete_transferencia`(IN p_id_transferencia INT)
BEGIN
    IF EXISTS (SELECT * FROM Transferencias WHERE id_transferencia = p_id_transferencia) THEN
        DELETE FROM Transferencias WHERE id_transferencia = p_id_transferencia;
    ELSE
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'No existe la transferencia';
    END IF;
END$$
DELIMITER ;

call delete_transferencia(100);

-- Delete row en Cuenta con parametros y validacion
DELIMITER $$
CREATE or REPLACE PROCEDURE `delete_cuenta`(IN p_id_cuenta INT)
BEGIN
    IF EXISTS (SELECT * FROM Cuenta WHERE id_cuenta = p_id_cuenta) THEN
        DELETE FROM Cuenta WHERE id_cuenta = p_id_cuenta;
    ELSE
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'No existe la cuenta';
    END IF;
END$$
DELIMITER ;

call delete_cuenta(100);

-- Delete row en Empleados con parametros y validacion
DELIMITER $$
CREATE or REPLACE PROCEDURE `delete_empleado`(IN p_id_empleado INT)
BEGIN
    IF EXISTS (SELECT * FROM Empleados WHERE id_empleado = p_id_empleado) THEN
        DELETE FROM Empleados WHERE id_empleado = p_id_empleado;
    ELSE
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'No existe el empleado';
    END IF;
END$$
DELIMITER ;

call delete_empleado(100);

-- Delete Contactos con parametros y validacion
DELIMITER $$
CREATE or REPLACE PROCEDURE `delete_contacto`(IN p_id_contacto INT)
BEGIN
    IF EXISTS (SELECT * FROM Contactos WHERE id_contactos = p_id_contacto) THEN
        DELETE FROM Contactos WHERE id_contactos = p_id_contacto;
    ELSE
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'No existe el contacto';
    END IF;
END$$
DELIMITER ;

call delete_contacto(100);

-- Delete Prestamos con parametros y validacion
DELIMITER $$
CREATE or REPLACE PROCEDURE `delete_prestamo`(IN p_id_prestamo INT)
BEGIN
    IF EXISTS (SELECT * FROM Prestamos WHERE id_prestamo = p_id_prestamo) THEN
        DELETE FROM Prestamos WHERE id_prestamo = p_id_prestamo;
    ELSE
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'No existe el prestamo';
    END IF;
END$$
DELIMITER ;

call delete_prestamo(100);

-- Delete Cuotas con parametros y validacion
DELIMITER $$
CREATE or REPLACE PROCEDURE `delete_cuota`(IN p_id_cuota INT)
BEGIN
    IF EXISTS (SELECT * FROM Cuotas WHERE id_cuota = p_id_cuota) THEN
        DELETE FROM Cuotas WHERE id_cuota = p_id_cuota;
    ELSE
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'No existe la cuota';
    END IF;
END$$
DELIMITER ;

call delete_cuota(100);