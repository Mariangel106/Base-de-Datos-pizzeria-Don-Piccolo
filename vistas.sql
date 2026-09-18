-- RESUMEN CLIENTES
CREATE VIEW vista_clientes AS
SELECT c.nombre,
       COUNT(p.id_pedido) AS total_pedidos,
       SUM(p.total) AS total_gastado
FROM clientes c
JOIN pedidos p ON c.id_cliente = p.id_cliente
GROUP BY c.nombre;

-- DESEMPEÑO REPARTIDORES
CREATE VIEW vista_repartidores AS
SELECT r.nombre,
       COUNT(d.id_domicilio) AS entregas,
       AVG(TIMESTAMPDIFF(MINUTE, d.hora_salida, d.hora_entrega)) AS tiempo_promedio
FROM repartidores r
JOIN pedidos p ON r.id_repartidor = p.id_repartidor
JOIN domicilios d ON p.id_pedido = d.id_pedido
GROUP BY r.nombre;

-- STOCK BAJO
CREATE VIEW vista_stock_bajo AS
SELECT nombre, stock
FROM ingredientes
WHERE stock < stock_minimo;