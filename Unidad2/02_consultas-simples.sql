
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

-- Operadores logicos (or, and y not)
-- Seleccionar los productos que tengan un precio de entre 10 y 50.

select ProductName as Producto, UnitPrice as Precio, UnitsInStock as Existencia
from Products
where UnitPrice >=10
and UnitPrice <=50

--	Mostrar todos los pedidos realizados por clientes que no son de alemania

select * from Orders

select CustomerID as cliente, OrderID as 'Numero del pedido', ShipCountry as 'Pais de envio'
from Orders
where ShipCountry <> 'Germany'

select CustomerID as cliente, OrderID as 'Numero del pedido', ShipCountry as 'Pais de envio'
from Orders
where Not ShipCountry = 'Germany'

-- seleccionar clientes de mexico o estados unidos

select *
from Customers
where Country = 'Mexico'
or Country = 'USA'

-- seleccionar empleados que nacieron entre 1955 y 1958 y que vivan en londres

select * 
from Employees
where (year(BirthDate) >=1955 and year(BirthDate) <=1958) 
and City = 'London'

-- seleccionar los pedidos con flete(Freight) mayor a 100 y enviados a Francia o España

select * 
from Orders
where Freight >=100
and (ShipCountry = 'France' or ShipCountry = 'Spain')


-- seleccionar ordenes de compra top cinco

select top 5 * from Orders

-- seleccionar los productos con precio entre 10 y 50 que no esten descontinuados y tengan mas de 20 unidades en stock

select * from Products
where (UnitPrice >=10 and UnitPrice <=50)
and Discontinued = 0 and UnitsInStock >20

-- Pedidos enviados a francia o alemania pero con un flete menor a 50

select * from Orders
where (ShipCountry = 'France' or ShipCountry = 'Germany')
and Freight <= 50

-- Clientes que NO sean de Mexico o USA y que tengan fax registrado

select *
from Customers
where not(Country='Mexico' or Country='USA')
and Fax is not null

-- Seleccionar pedidos con un flete mayor a 100, enviados a brasil o argentina pero NO enviados por el transportista 1

select * from Orders
where Freight >=100
and (ShipCountry = 'Brazil' or ShipCountry = 'Argentina')
and not ShipVia = 1