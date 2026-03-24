-- Cargar clientes
INSERT INTO Staging_Cliente (id_cliente, nombre_cliente, pais, ciudad, limite_credito)
SELECT ID_cliente, nombre_cliente, pais, ciudad, limite_credito
FROM jardineria.dbo.cliente

-- Cargar productos
INSERT INTO Staging_Producto (id_producto, nombre_producto, precio_venta, cantidad_en_stock, id_categoria)
SELECT ID_producto, nombre, precio_venta, cantidad_en_stock, Categoria
FROM jardineria.dbo.producto

-- Cargar categorías
INSERT INTO Staging_Categoria (id_categoria, desc_categoria)
SELECT Id_Categoria, Desc_Categoria
FROM jardineria.dbo.Categoria_producto

-- Cargar pedidos
INSERT INTO Staging_Pedido (id_pedido, fecha_pedido, estado, id_cliente)
SELECT ID_pedido, fecha_pedido, estado, ID_cliente
FROM jardineria.dbo.pedido

-- Cargar detalle de pedidos
INSERT INTO Staging_DetallePedido (id_detalle_pedido, id_pedido, id_producto, cantidad, precio_unidad)
SELECT ID_detalle_pedido, ID_pedido, ID_producto, cantidad, precio_unidad
FROM jardineria.dbo.detalle_pedido

-- Cargar pagos
INSERT INTO Staging_Pago (id_pago, id_cliente, fecha_pago, total)
SELECT ID_pago, ID_cliente, fecha_pago, total
FROM jardineria.dbo.pago