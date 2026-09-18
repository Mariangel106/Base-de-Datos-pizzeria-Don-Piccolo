# Pizzería Don Piccolo 🍕

## Descripción
Sistema de base de datos para gestionar pedidos, clientes, pizzas, domicilios y repartidores.

## Tablas principales
- clientes
- pizzas
- ingredientes
- pedidos
- repartidores
- domicilios

## Relaciones
- Cliente → Pedido (1:N)
- Pedido → Pizza (N:M)
- Pizza → Ingrediente (N:M)

## Funciones
- calcular_total()
- ganancia_diaria()

## Triggers
- Actualización de stock
- Auditoría de precios
- Control de repartidores

## Vistas
- Resumen de clientes
- Desempeño de repartidores
- Stock bajo

## Ejecución
1. Ejecutar database.sql
2. Ejecutar funciones.sql
3. Ejecutar triggers.sql
4. Ejecutar vistas.sql
5. Ejecutar consultas.sql