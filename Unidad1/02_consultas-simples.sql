
-- Lenguaje SQL-LMD (insert, update, delete, select - CRUD)

use Northwind;

-- Mostrar todos los clientes, proveedores, categorias, productos, ordenes, detalles de la orden, empleados
-- con todas las columnas de datos de la empresa

select * from Customers;
select * from Employees;
select * from Orders;
select * from Suppliers;
select * from Products;
select * from Shippers;
select * from Categories;
select * from [Order Details]

-- Proyeccion
select ProductID, ProductName, UnitPrice, UnitsInStock from Products;


select EmployeeID, FirstName, Title, City, Country from Employees;

select * from Employees;

-- alias de columna

-- en base a la consulta anterior, visualizar es employeeid como el numero empleado, el firstnombre como primer nombre
-- title como cargo, city como ciudad, conutry como pais.

select EmployeeID as [Numero Empleado], FirstName as PrimerNombre, Title 'Cargo', City as ciudad, Country as pais from Employees;

-- Campos calculos
-- Seleccionar el importe de cada uno de los productos vendidos en una orden.

select *, (UnitPrice * Quantity) as Importe from [Order Details]

SELECt * from Orders;
select * from Employees;

-- selecionar las fechas de orden, año, mes, dia, cliente que las ordenó y el empleado que la realizó.

select OrderDate as 'Fecha de orden', year(OrderDate) as Año, month(OrderDate) as Mes, day(OrderDate) as Dia, CustomerID, EmployeeID from Orders;

-- Clausula where
-- Operadores relacionales(<,>,=,<=,>=,!= o <>)

select * from Customers;

-- seleccionar el cliente BOLID

select CustomerID, CompanyName as 'Nombre de compania', City as Ciudad, Country as Pais
from Customers
where CustomerID = 'BOLID'

-- selecionar los clientes, mostrando su identificador
-- nombre de la empresa, contacto, ciudad y pais de alemania

select CustomerID as NumeroCliente, CompanyName as Compañia, ContactName as 'Nombre De Contacto', City as Ciudad, Country as País
from Customers
where Country = 'Germany'

-- selecionar todos los clientes que no sean de Alemania

select CustomerID as NumeroCliente, CompanyName as Compañia, ContactName as 'Nombre De Contacto', City as Ciudad, Country as País
from Customers
where Country != 'Germany'

-- seleccionar todos los productos mostrando su nombre de producto, categoria a la que pertenece, unidad de excistencia, precio, pero solamente
-- donde su precio sea mayor a 100

select ProductName as 'Nombre del Producto', CategoryID as Categoria, UnitsInStock as 'Unidades Disponibles', UnitPrice as Precio 
from Products
where UnitPrice > 100

-- Seleccionar las ordenes de compra
-- Mostrando la fecha de orden, la fecha de entrega, la fecha de envio, el cliente a quien se vendio de 1996

select OrderDate, RequiredDate, ShippedDate, CustomerID
from Orders
where year(OrderDate) = '1996' 