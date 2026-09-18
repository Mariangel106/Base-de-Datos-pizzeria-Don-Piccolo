CREATE FUNCTION calcular_total(p_id_pedido INT);
RETURN DECIMAL (10,2);
DETERMINISTIC
BEGIN
    DECLARE total DECIMAL(10,2);

    SELECT SUM(pp.cantidad * p.precio_base)
    INTO total
    FROM pedido_pizza pp
    JOIN pizzas p ON pp.id_pizza = p.id_pizza
    WHERE pp.id_pedido = p_id_pedido;

    RETURN total * 1.19;
END //

-- GANANCIA DIARIA
CREATE FUNCTION ganancia_diaria(fecha_consulta DATE)
RETURNS DECIMAL(10,2)
DETERMINISTIC
BEGIN
    DECLARE ingresos DECIMAL(10,2);
    DECLARE costos DECIMAL(10,2);

    SELECT SUM(total) INTO ingresos
    FROM pedidos
    WHERE DATE(fecha) = fecha_consulta;

    SELECT SUM(i.costo * pi.cantidad) INTO costos
    FROM ingredientes i
    JOIN pizza_ingrediente pi ON i.id_ingrediente = pi.id_ingrediente;

    RETURN ingresos - costos;
END //

DELIMITER ;