-- BETWEEN
SELECT * FROM pedidos
WHERE fecha BETWEEN '2026-01-01' AND '2026-12-31';

-- PIZZAS MAS VENDIDAS
SELECT id_pizza, COUNT(*) AS total
FROM pedido_pizza
GROUP BY id_pizza;

-- PEDIDOS POR REPARTIDOR
SELECT r.nombre, p.id_pedido
FROM pedidos p
JOIN repartidores r ON p.id_repartidor = r.id_repartidor;

-- PROMEDIO ENTREGA
SELECT r.zona, AVG(d.distancia)
FROM domicilios d
JOIN pedidos p ON d.id_pedido = p.id_pedido
JOIN repartidores r ON p.id_repartidor = r.id_repartidor
GROUP BY r.zona;

-- CLIENTES QUE GASTARON MAS
SELECT c.nombre, SUM(p.total) total
FROM clientes c
JOIN pedidos p ON c.id_cliente = p.id_cliente
GROUP BY c.nombre
HAVING total > 100000;

-- LIKE
SELECT * FROM pizzas
WHERE nombre LIKE '%pepperoni%';

-- CLIENTES FRECUENTES
SELECT nombre FROM clientes
WHERE id_cliente IN (
    SELECT id_cliente
    FROM pedidos
    WHERE MONTH(fecha) = MONTH(CURRENT_DATE)
    GROUP BY id_cliente
    HAVING COUNT(*) > 5
);