
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

select * from Customers;

-- filas duplicadas

-- Mostrar los paises en donde se tienen clientes,
-- mostrando los paises solamente

select distinct Country
from Customers order by Country


-- Clausula where
-- Operadores relacionales o test de comparacion(<,>,=,<=,>=,!= o <>)

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

-- Mostrar todas las ordenes de compra donde la cantidad de productos comprados sea mayor a 5

select * from [Order Details]
select * from Orders;

select Quantity as cantidad
from [Order Details]
where Quantity > 5

-- Mostrar el nombre completo del empleado, su numero de empleado, fecha de nacimiento
-- la ciudad y fecha de contratacion debe ser de aquellos que fueron contratados despues de 1993
-- los resultados en sus encabezados deben ser mostrados en español

select (FirstName + '   ' + LastName) as 'Nombre Completo', EmployeeID as 'Numero de empleado', 
BirthDate as 'Fecha De Nacimiento', City as Ciudad, HireDate as 'Fecha de Contratacion'
from Employees
where year(HireDate) > 1993

--Mostrar los empleados que no son dirigidos por el jefe 2

select (FirstName + '   ' + LastName) as 'Nombre Completo', EmployeeID as 'Numero de empleado', 
BirthDate as 'Fecha De Nacimiento', City as Ciudad, HireDate as 'Fecha de Contratacion', ReportsTo as 'Jefe'
from Employees
where ReportsTo <> 2

-- seleccionar los empleados que no tengan jefe

select * from Employees
where ReportsTo is null