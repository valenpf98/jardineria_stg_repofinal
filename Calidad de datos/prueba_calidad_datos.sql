/* ============================================
   PRUEBAS DE CALIDAD DE DATOS - Jardinería Staging
   ============================================ */

/* 1. Valores nulos en campos críticos */
SELECT * 
FROM Staging_Cliente 
WHERE nombre_cliente IS NULL

SELECT * 
FROM Staging_Producto 
WHERE nombre_producto IS NULL

/* 2. Duplicados en claves o atributos importantes */
SELECT id_cliente, COUNT(*) 
FROM Staging_Cliente 
GROUP BY id_cliente 
HAVING COUNT(*) > 1

SELECT nombre_producto, COUNT(*) 
FROM Staging_Producto 
GROUP BY nombre_producto 
HAVING COUNT(*) > 1

/* 3. Rangos inválidos (ejemplo: montos negativos) */
SELECT * 
FROM Staging_Pago 
WHERE total < 0

SELECT * 
FROM Staging_Producto 
WHERE precio_venta < 0

/* 4. Referencias huérfanas (integridad referencial) */
-- Pedidos con clientes inexistentes
SELECT * 
FROM Staging_Pedido 
WHERE id_cliente NOT IN (
    SELECT id_cliente FROM Staging_Cliente
)

-- Detalles de pedido con pedidos inexistentes
SELECT * 
FROM Staging_DetallePedido 
WHERE id_pedido NOT IN (
    SELECT id_pedido FROM Staging_Pedido
)

-- Pagos con pedidos inexistentes
SELECT * 
FROM Staging_Pago 
WHERE id_pago NOT IN (
    SELECT id_pago FROM Staging_Pedido
)

/* 5. Validación de límites de crédito (ejemplo de regla de negocio) */
SELECT * 
FROM Staging_Cliente 
WHERE limite_credito < 0