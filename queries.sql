CREATE DATABASE pizzeria_don_piccolo;
USE pizzeria_don_piccolo;

-- CLIENTES
CREATE TABLE clientes (
    id_cliente INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100),
    telefono VARCHAR(20),
    direccion VARCHAR(150),
    correo VARCHAR(100)
);

-- PIZZAS
CREATE TABLE pizzas (
    id_pizza INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100),
    tamano VARCHAR(50),
    precio_base DECIMAL(10,2),
    tipo VARCHAR(50)
);

-- INGREDIENTES
CREATE TABLE ingredientes (
    id_ingrediente INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100),
    stock INT,
    stock_minimo INT,
    costo DECIMAL(10,2)
);

-- RELACION PIZZA - INGREDIENTE
CREATE TABLE pizza_ingrediente (
    id_pizza INT,
    id_ingrediente INT,
    cantidad INT,
    PRIMARY KEY (id_pizza, id_ingrediente),
    FOREIGN KEY (id_pizza) REFERENCES pizzas(id_pizza),
    FOREIGN KEY (id_ingrediente) REFERENCES ingredientes(id_ingrediente)
);

-- REPARTIDORES
CREATE TABLE repartidores (
    id_repartidor INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100),
    zona VARCHAR(50),
    estado ENUM('disponible','no disponible')
);

-- PEDIDOS
CREATE TABLE pedidos (
    id_pedido INT AUTO_INCREMENT PRIMARY KEY,
    id_cliente INT,
    id_repartidor INT,
    fecha DATETIME,
    metodo_pago VARCHAR(50),
    estado ENUM('pendiente','preparacion','entregado','cancelado'),
    total DECIMAL(10,2),

    FOREIGN KEY (id_cliente) REFERENCES clientes(id_cliente),
    FOREIGN KEY (id_repartidor) REFERENCES repartidores(id_repartidor)
);

-- RELACION PEDIDO - PIZZA
CREATE TABLE pedido_pizza (
    id_pedido INT,
    id_pizza INT,
    cantidad INT,
    PRIMARY KEY (id_pedido, id_pizza),
    FOREIGN KEY (id_pedido) REFERENCES pedidos(id_pedido),
    FOREIGN KEY (id_pizza) REFERENCES pizzas(id_pizza)
);

-- DOMICILIOS
CREATE TABLE domicilios (
    id_domicilio INT AUTO_INCREMENT PRIMARY KEY,
    id_pedido INT,
    hora_salida DATETIME,
    hora_entrega DATETIME,
    distancia DECIMAL(5,2),
    costo_envio DECIMAL(10,2),

    FOREIGN KEY (id_pedido) REFERENCES pedidos(id_pedido)
);

-- HISTORIAL DE PRECIOS
CREATE TABLE historial_precios (
    id_historial INT AUTO_INCREMENT PRIMARY KEY,
    id_pizza INT,
    precio_anterior DECIMAL(10,2),
    precio_nuevo DECIMAL(10,2),
    fecha TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);