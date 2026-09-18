CREATE TRIGGER actualizar_stok;
AFTER INSERT ON pedido_pizza
FOR EACH ROW 
BEGIN
  UPDATE ingrediente i
  JOIN pizza_ingredientes pi ON i.pizza_ingredientes = i.pizza_ingredientes
  SET i.stock = i.stock - (pi.cantidad * NEW.cantidad)
  WHERE pi.id_pizza = NEW.id_pizza;
END//

CREATE TRIGGER auditoria_precios
BEFORE UPDATE ON pizzas
FOR EACH ROW
BEGIN
    IF OLD.precio_base <> NEW.precio_base THEN
        INSERT INTO historial_precios(id_pizza, precio_anterior, precio_nuevo)
        VALUES (OLD.id_pizza, OLD.precio_base, NEW.precio_base);
    END IF;
END //

-- REPARTIDOR DISPONIBLE
CREATE TRIGGER repartidor_disponible
AFTER UPDATE ON domicilios
FOR EACH ROW
BEGIN
    IF NEW.hora_entrega IS NOT NULL THEN
        UPDATE repartidores r
        JOIN pedidos p ON r.id_repartidor = p.id_repartidor
        SET r.estado = 'disponible'
        WHERE p.id_pedido = NEW.id_pedido;
    END IF;
END //

DELIMITER ;