IF EXISTS (SELECT name FROM sys.databases WHERE name = 'jardineria_staging')
BEGIN
    DROP DATABASE jardineria_staging
END
GO

CREATE DATABASE jardineria_staging
GO

USE jardineria_staging

CREATE TABLE Staging_Cliente (
  id_cliente INT PRIMARY KEY,
  nombre_cliente VARCHAR(50) NOT NULL,
  pais VARCHAR(50),
  ciudad VARCHAR(50),
  limite_credito NUMERIC(15,2)
)

-- Tabla Producto
CREATE TABLE Staging_Producto (
  id_producto INT PRIMARY KEY,
  nombre_producto VARCHAR(70) NOT NULL,
  precio_venta NUMERIC(15,2) NOT NULL,
  cantidad_en_stock INT NOT NULL,
  id_categoria INT
)

-- Tabla Categoría
CREATE TABLE Staging_Categoria (
  id_categoria INT PRIMARY KEY,
  desc_categoria VARCHAR(50) NOT NULL
)

-- Tabla Pedido
CREATE TABLE Staging_Pedido (
  id_pedido INT PRIMARY KEY,
  fecha_pedido DATE NOT NULL,
  estado VARCHAR(15) NOT NULL,
  id_cliente INT
)

-- Tabla Detalle Pedido
CREATE TABLE Staging_DetallePedido (
  id_detalle_pedido INT PRIMARY KEY,
  id_pedido INT,
  id_producto INT,
  cantidad INT NOT NULL,
  precio_unidad NUMERIC(15,2) NOT NULL
)

-- Tabla Pago
CREATE TABLE Staging_Pago (
  id_pago INT PRIMARY KEY,
  id_cliente INT,
  fecha_pago DATE NOT NULL,
  total NUMERIC(15,2) NOT NULL
)