# Ejercicio de consultas simples

## Lenguaje SQL - LMD (INSERT, UPDATE, DELETE, SELECT - CRUD)

## Base de Datos
```sql
USE Northwind;
```

## Mostrar todas las tablas de la empresa
```sql
SELECT * FROM Customers;
SELECT * FROM Employees;
SELECT * FROM Orders;
SELECT * FROM Suppliers;
SELECT * FROM Products;
SELECT * FROM Shippers;
SELECT * FROM Categories;
SELECT * FROM [Order Details];
```

## Proyección de Datos
```sql
SELECT ProductID, ProductName, UnitPrice, UnitsInStock FROM Products;
SELECT EmployeeID, FirstName, Title, City, Country FROM Employees;
SELECT * FROM Employees;
```

## Alias de Columnas
```sql
SELECT EmployeeID AS [Numero Empleado], FirstName AS PrimerNombre, Title AS Cargo, City AS Ciudad, Country AS Pais
FROM Employees;
```

## Campos Calculados
```sql
SELECT *, (UnitPrice * Quantity) AS Importe FROM [Order Details];
```

## Fechas y Tiempos
```sql
SELECT OrderDate AS 'Fecha de orden', YEAR(OrderDate) AS Año, MONTH(OrderDate) AS Mes, DAY(OrderDate) AS Dia, CustomerID, EmployeeID
FROM Orders;
```

## Filas Duplicadas
```sql
SELECT DISTINCT Country FROM Customers ORDER BY Country;
```

## Cláusula WHERE
### Operadores Relacionales
```sql
SELECT CustomerID, CompanyName AS 'Nombre de compania', City AS Ciudad, Country AS Pais
FROM Customers
WHERE CustomerID = 'BOLID';
```

```sql
SELECT CustomerID AS NumeroCliente, CompanyName AS Compañia, ContactName AS 'Nombre De Contacto', City AS Ciudad, Country AS País
FROM Customers
WHERE Country = 'Germany';
```

```sql
SELECT CustomerID AS NumeroCliente, CompanyName AS Compañia, ContactName AS 'Nombre De Contacto', City AS Ciudad, Country AS País
FROM Customers
WHERE Country != 'Germany';
```

## Productos con Precio Mayor a 100
```sql
SELECT ProductName AS 'Nombre del Producto', CategoryID AS Categoria, UnitsInStock AS 'Unidades Disponibles', UnitPrice AS Precio
FROM Products
WHERE UnitPrice > 100;
```

## Órdenes de Compra del Año 1996
```sql
SELECT OrderDate, RequiredDate, ShippedDate, CustomerID
FROM Orders
WHERE YEAR(OrderDate) = '1996';
```

## Órdenes con Cantidad Mayor a 5
```sql
SELECT Quantity AS cantidad FROM [Order Details] WHERE Quantity > 5;
```

## Empleados Contratados Después de 1993
```sql
SELECT CONCAT(FirstName, ' ', LastName) AS 'Nombre Completo', EmployeeID AS 'Numero de empleado', BirthDate AS 'Fecha De Nacimiento', City AS Ciudad, HireDate AS 'Fecha de Contratacion'
FROM Employees
WHERE YEAR(HireDate) > 1993;
```

## Empleados sin Jefe
```sql
SELECT * FROM Employees WHERE ReportsTo IS NULL;
```

## Operadores Lógicos (AND, OR, NOT)
### Productos con Precio Entre 10 y 50
```sql
SELECT ProductName AS Producto, UnitPrice AS Precio, UnitsInStock AS Existencia
FROM Products
WHERE UnitPrice BETWEEN 10 AND 50;
```

### Pedidos de Clientes que No Son de Alemania
```sql
SELECT CustomerID AS Cliente, OrderID AS 'Numero del pedido', ShipCountry AS 'Pais de envio'
FROM Orders
WHERE ShipCountry <> 'Germany';
```

### Clientes de México o USA
```sql
SELECT * FROM Customers WHERE Country IN ('Mexico', 'USA');
```

### Empleados Contratados Entre 1955 y 1958 en Londres
```sql
SELECT * FROM Employees WHERE YEAR(BirthDate) BETWEEN 1955 AND 1958 AND City = 'London';
```

## Órdenes con Flete Mayor a 100 y Envío a Francia o España
```sql
SELECT * FROM Orders WHERE Freight >= 100 AND (ShipCountry = 'France' OR ShipCountry = 'Spain');
```

## Seleccionar Órdenes de Compra Top 5
```sql
SELECT TOP 5 * FROM Orders;
```

## Seleccionar Productos con Ciertas Condiciones
```sql
SELECT * FROM Products WHERE (UnitPrice BETWEEN 10 AND 50) AND Discontinued = 0 AND UnitsInStock > 20;
```

## Pedidos Enviados a Francia o Alemania con Flete Menor a 50
```sql
SELECT * FROM Orders WHERE (ShipCountry = 'France' OR ShipCountry = 'Germany') AND Freight <= 50;
```

## Clientes con Fax Registrado y No de México o USA
```sql
SELECT * FROM Customers WHERE NOT (Country = 'Mexico' OR Country = 'USA') AND Fax IS NOT NULL;
```

## Empleados Contratados Después de 1992 y No en Londres o Seattle
```sql
SELECT CONCAT(FirstName, ' ', LastName) AS 'Nombre Completo', HireDate, City, Country
FROM Employees
WHERE NOT (City = 'London' OR City = 'Seattle')
AND YEAR(HireDate) >= 1992;
```

## Cláusula IN
```sql
SELECT ProductName, CategoryID, UnitPrice FROM Products WHERE CategoryID IN (1,3,5);
```

## Órdenes con Cierta Región o Sin Región
```sql
SELECT OrderID, ShipRegion FROM Orders WHERE ShipRegion IN ('RJ', 'Táchira') OR ShipRegion IS NULL;
```

## Órdenes con Cantidades de 12, 9 o 40 y Descuento de 0.15 o 0.05
```sql
SELECT * FROM [Order Details] WHERE Quantity IN (12,9,40) AND Discount IN (0.15, 0.05);
```

## Cláusula BETWEEN
### Productos con Precio Entre 10 y 50
```sql
SELECT * FROM Products WHERE UnitPrice BETWEEN 10 AND 50;
```

### Pedidos Realizados Entre Enero y Junio de 1997
```sql
SELECT OrderID AS 'Id Del Pedido', OrderDate AS 'Pedido Realizado'
FROM Orders
WHERE OrderDate BETWEEN '1997-01-01' AND '1997-06-30';
```

### Empleados Contratados Entre 1992 y 1994 en Londres
```sql
SELECT HireDate AS 'Fecha de Contratacion', City AS Ciudad FROM Employees WHERE YEAR(HireDate) BETWEEN 1992 AND 1994 AND City = 'London';
```

## Cláusula LIKE
### Productos que Comienzan con "Cha"
```sql
SELECT * FROM Products WHERE ProductName LIKE 'Cha%';
```

### Productos que Terminan con "e"
```sql
SELECT * FROM Products WHERE ProductName LIKE '%e';
```

---


