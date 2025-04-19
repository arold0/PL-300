-- Script para crear la base de datos Inventario para el Laboratorio 1 PL-300
-- Este script crea la base de datos, tablas y datos de ejemplo necesarios

-- Crear la base de datos
CREATE DATABASE Inventario;
GO

USE Inventario;
GO

-- Crear tabla de productos maestros
CREATE TABLE ProductoMaestro (
    ProductoID VARCHAR(10) PRIMARY KEY,
    NombreProducto VARCHAR(100),
    Categoria VARCHAR(50),
    Subcategoria VARCHAR(50),
    FechaCreacion DATE,
    Activo BIT DEFAULT 1
);
GO

-- Crear tabla de inventario
CREATE TABLE Inventario (
    InventarioID INT IDENTITY(1,1) PRIMARY KEY,
    ProductoID VARCHAR(10) FOREIGN KEY REFERENCES ProductoMaestro(ProductoID),
    Ubicacion VARCHAR(50),
    CantidadDisponible INT,
    UltimaActualizacion DATETIME,
    Activo BIT DEFAULT 1
);
GO

-- Insertar datos en la tabla ProductoMaestro
INSERT INTO ProductoMaestro (ProductoID, NombreProducto, Categoria, Subcategoria, FechaCreacion, Activo)
VALUES 
('P001', 'Laptop Premium', 'Electrónicos', 'Computadoras', '2021-01-10', 1),
('P002', 'Monitor 4K', 'Electrónicos', 'Periféricos', '2021-01-15', 1),
('P003', 'Teclado Mecánico', 'Electrónicos', 'Periféricos', '2021-01-20', 1),
('P004', 'Smartphone Avanzado', 'Electrónicos', 'Teléfonos', '2021-02-05', 1),
('P005', 'Tablet Básica', 'Electrónicos', 'Tablets', '2021-02-10', 1),
('P006', 'Impresora Láser', 'Electrónicos', 'Impresoras', '2021-02-15', 1),
('P007', 'Mouse Inalámbrico', 'Electrónicos', 'Periféricos', '2021-03-01', 1),
('P008', 'Escritorio Ajustable', 'Muebles', 'Escritorios', '2021-03-10', 1),
('P009', 'Silla Ergonómica', 'Muebles', 'Sillas', '2021-03-15', 1),
('P010', 'Archivador Metálico', 'Muebles', 'Almacenamiento', '2021-04-01', 1),
('P011', 'Papel A4 (Resma)', 'Papelería', 'Papel', '2021-04-10', 1),
('P012', 'Bolígrafos (Caja)', 'Papelería', 'Escritura', '2021-04-15', 1),
('P013', 'Grapadora Industrial', 'Papelería', 'Accesorios', '2021-05-01', 1),
('P014', 'Pizarra Blanca', 'Papelería', 'Presentación', '2021-05-10', 1),
('P015', 'Software Office', 'Software', 'Productividad', '2021-05-15', 1),
('P016', 'Auriculares Bluetooth', 'Electrónicos', 'Audio', '2021-06-01', 1),
('P017', 'Cámara Web HD', 'Electrónicos', 'Periféricos', '2021-06-10', 1),
('P018', 'Disco Duro Externo', 'Electrónicos', 'Almacenamiento', '2021-06-15', 1),
('P019', 'Router WiFi', 'Electrónicos', 'Redes', '2021-07-01', 1),
('P020', 'Estantería Modular', 'Muebles', 'Almacenamiento', '2021-07-10', 0);

-- Insertar datos en la tabla Inventario
INSERT INTO Inventario (ProductoID, Ubicacion, CantidadDisponible, UltimaActualizacion, Activo)
VALUES
('P001', 'Almacén Central', 25, '2023-12-15 10:30:00', 1),
('P001', 'Tienda Norte', 5, '2023-12-16 09:45:00', 1),
('P001', 'Tienda Sur', 0, '2023-12-17 14:20:00', 1),
('P002', 'Almacén Central', 40, '2023-12-15 11:15:00', 1),
('P002', 'Tienda Este', 8, '2023-12-16 10:30:00', 1),
('P003', 'Almacén Central', 100, '2023-12-15 12:00:00', 1),
('P003', 'Tienda Norte', 15, '2023-12-16 11:00:00', 1),
('P003', 'Tienda Sur', 12, '2023-12-17 15:30:00', 1),
('P003', 'Tienda Este', 10, '2023-12-18 09:00:00', 1),
('P004', 'Almacén Central', 30, '2023-12-15 13:45:00', 1),
('P004', 'Tienda Oeste', 6, '2023-12-16 12:15:00', 1),
('P005', 'Almacén Central', 20, '2023-12-15 14:30:00', 1),
('P005', 'Tienda Centro', 4, '2023-12-16 13:20:00', 1),
('P006', 'Almacén Central', 15, '2023-12-15 15:10:00', 1),
('P007', 'Almacén Central', 200, '2023-12-15 16:00:00', 1),
('P007', 'Tienda Norte', 25, '2023-12-16 14:40:00', 1),
('P007', 'Tienda Sur', 20, '2023-12-17 16:15:00', 1),
('P007', 'Tienda Este', 18, '2023-12-18 10:30:00', 1),
('P007', 'Tienda Oeste', 15, '2023-12-19 11:45:00', 1),
('P008', 'Almacén Central', 10, '2023-12-15 16:45:00', 1),
('P008', 'Tienda Centro', 2, '2023-12-16 15:30:00', 1),
('P009', 'Almacén Central', 18, '2023-12-15 17:20:00', 1),
('P009', 'Tienda Norte', 4, '2023-12-16 16:10:00', 1),
('P010', 'Almacén Central', 12, '2023-12-15 17:50:00', 1),
('P011', 'Almacén Central', 500, '2023-12-15 09:00:00', 1),
('P011', 'Tienda Norte', 50, '2023-12-16 08:30:00', 1),
('P011', 'Tienda Sur', 45, '2023-12-17 13:20:00', 1),
('P011', 'Tienda Este', 40, '2023-12-18 08:40:00', 1),
('P011', 'Tienda Oeste', 35, '2023-12-19 10:15:00', 1),
('P012', 'Almacén Central', 300, '2023-12-15 09:30:00', 1),
('P012', 'Tienda Centro', 60, '2023-12-16 10:00:00', 1),
('P012', 'Tienda Norte', 55, '2023-12-17 11:45:00', 1),
('P012', 'Tienda Sur', 50, '2023-12-18 09:15:00', 1),
('P013', 'Almacén Central', 80, '2023-12-15 10:20:00', 1),
('P013', 'Tienda Este', 20, '2023-12-16 11:05:00', 1),
('P014', 'Almacén Central', 25, '2023-12-15 11:10:00', 1),
('P014', 'Tienda Oeste', 5, '2023-12-16 12:00:00', 1),
('P015', 'Almacén Central', 50, '2023-12-15 12:50:00', 1),
('P015', 'Tienda Centro', 10, '2023-12-16 13:40:00', 1),
('P016', 'Almacén Central', 70, '2023-12-15 13:30:00', 1),
('P016', 'Tienda Norte', 15, '2023-12-16 14:20:00', 1),
('P017', 'Almacén Central', 40, '2023-12-15 14:10:00', 1),
('P017', 'Tienda Sur', 8, '2023-12-16 15:00:00', 1),
('P018', 'Almacén Central', 60, '2023-12-15 14:50:00', 1),
('P018', 'Tienda Este', 12, '2023-12-16 16:40:00', 1),
('P019', 'Almacén Central', 90, '2023-12-15 15:30:00',
    1),
('P019', 'Tienda Oeste', 18, '2023-12-16 17:20:00', 1),
('P020', 'Almacén Central', 5, '2023-12-15 16:10:00', 0),
('P020', 'Tienda Centro', 1, '2023-12-16 18:00:00', 0);
GO