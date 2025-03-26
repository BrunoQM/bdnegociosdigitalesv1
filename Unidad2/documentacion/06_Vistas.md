
# Vistas en SQL Server


## Sintaxis básica para crear una vista
```sql
/*
CREATE VIEW nombreVista
AS
SELECT columnas
FROM tabla
WHERE condicion;
*/

```

```
USE Northwind;
GO
```
``` sql 
-- Crear una vista de todas las categorías
CREATE VIEW VistaCategoriasTodas
AS
SELECT CategoryID, CategoryName, [Description], Picture
FROM Categories;
GO

-- Consultar la vista filtrando por una categoría específica
SELECT * FROM VistaCategoriasTodas
WHERE CategoryName = 'Beverages';

-- Eliminar la vista
DROP VIEW VistaCategoriasTodas;

-- Consultar todos los clientes
SELECT * FROM Customers;

-- Crear una vista para visualizar solo los clientes de México y Brasil
GO
CREATE VIEW VistaClientesLatam
AS
SELECT CompanyName AS Clientes, Country AS Pais
FROM Customers
WHERE Country IN ('Mexico', 'Brazil');
GO

-- Consultar la vista
SELECT * FROM VistaClientesLatam;

-- Eliminar la vista
DROP VIEW VistaClientesLatam;

-- Crear una nueva versión de la vista incluyendo todas las columnas
GO
CREATE VIEW VistaClientesLatam
AS
SELECT *
FROM Customers
WHERE Country IN ('Mexico', 'Brazil');
GO

-- Consultar países distintos desde la vista
SELECT DISTINCT vcl.Country
FROM Orders AS O
INNER JOIN VistaClientesLatam AS vcl
ON vcl.CustomerID = O.CustomerID;

-- Crear una vista que contenga datos de órdenes, productos, categorías, empleados y clientes
-- Calcular el importe total de cada orden

CREATE OR ALTER VIEW [dbo].[VistaOrdenesCompra]
AS
SELECT 
    o.OrderID AS 'Numero de orden', 
    o.OrderDate AS 'Fecha de orden', 
    o.RequiredDate AS 'Fecha de Requesicion', 
    CONCAT(e.FirstName, ' ', e.LastName) AS 'Nombre Empleado', 
    cu.CompanyName AS Cliente, 
    p.ProductName AS 'Nombre Producto', 
    c.CategoryName AS 'Nombre de Categoria', 
    od.UnitPrice AS 'Precio de Venta', 
    od.Quantity AS 'Cantidad Vendida', 
    (od.Quantity * od.UnitPrice) AS Importe 
FROM Categories AS c
INNER JOIN Products AS p ON c.CategoryID = p.CategoryID
INNER JOIN [Order Details] AS od ON od.ProductID = p.ProductID
INNER JOIN Orders AS o ON od.OrderID = o.OrderID
INNER JOIN Customers AS cu ON cu.CustomerID = o.CustomerID
INNER JOIN Employees AS e ON e.EmployeeID = o.EmployeeID;
GO

-- Contar el número de órdenes en la vista
SELECT COUNT(DISTINCT [Numero de orden]) AS [Numero de Ordenes]
FROM VistaOrdenesCompra;

-- Calcular el importe total de todas las órdenes
SELECT SUM([Importe] * [Precio de Venta]) AS [Importe Total]
FROM VistaOrdenesCompra;
GO

-- Calcular el importe total entre 1995 y 1996
SELECT SUM([Importe]) AS [Importe Total]
FROM VistaOrdenesCompra
WHERE YEAR([Fecha de orden]) BETWEEN '1995' AND '1996';
GO

-- Calcular el importe total por cliente entre 1995 y 1996, mostrando solo clientes con más de 2 pedidos
SELECT 
    [Cliente] AS 'Nombre Cliente',
    SUM(Importe) AS 'Importe Total'
FROM VistaOrdenesCompra
WHERE YEAR([Fecha de orden]) BETWEEN '1995' AND '1996'
GROUP BY [Cliente]
HAVING COUNT(*) > 2;
GO

-- Crear el esquema RH (Recursos Humanos)
CREATE SCHEMA rh;
GO

-- Crear una tabla en el esquema RH
CREATE TABLE rh.TablaRH (
    id INT PRIMARY KEY,
    nombre NVARCHAR(50)
);
GO

-- Crear o modificar una vista de categorías y productos en el esquema RH
CREATE OR ALTER VIEW rh.ViewCategoriasProductos
AS
SELECT c.CategoryID, c.CategoryName, p.ProductID, p.ProductName 
FROM Categories AS c
INNER JOIN Products AS p ON c.CategoryID = p.CategoryID;
GO

-- Consultar la vista de categorías y productos
SELECT * FROM rh.ViewCategoriasProductos;
```
