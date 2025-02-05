
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

-- seleccionar empleqdos que no viven en londres o seattle y que fueron contratados despues de 1992

select concat(FirstName , ' ', LastName) as [Nombre Completo], HireDate, city, Country
from Employees
where NOT(City = 'London' or City = 'Seattle')
and year(HireDate) >= 1992

-- Clausula In (or)
-- seleccionar los productos con categoria 1,3 o 5

select ProductName, CategoryID, UnitPrice from Products
where CategoryID = 1 or CategoryID = 3 or CategoryID = 5

select * from Orders

-- seleccionar todas las ordenes de la region RJ, Tachira y que no tegan region asignada.

select OrderID, ShipRegion
from Orders
where ShipRegion IN ('RJ','Táchira') or ShipRegion is null

-- seleccionar las ordenes que tengan cantidades de 12, 9, o 40 
-- y descuento de 0.15 o 0.05

select *
from [Order Details]
where Quantity IN (12,9,40)
and Discount IN (0.15, 0.05)

-- Clausula Between

-- between valorInicial And ValorFinal ---
-- Mostrar los productos con precio entre 10 y 50

select *\\
from Products
where UnitPrice >= 10 and UnitPrice <=50

select * from Products
where UnitPrice between 10 and 50

-- seleccionar todos los pedidos realizados entre el primero de enero y el 30 de junio de 1997

select OrderID as 'Id Del Pedido', OrderDate as 'Pedido Realizado'
from Orders
where OrderDate between '1997-01-01' and '1997-06-30'

-- seleccionar todos los empleados contratados entre 1992 y 1994 que trabajan en londres

select HireDate as 'Fecha de Contratacion', City as Ciudad
from Employees
where year(HireDate) between '1992' and '1994'
and City IN ('London')

-- Pedidos con flete (freight) entre 50 y 200 enviados a alemania y a francia

select OrderID as 'Numero de Orden', Freight as Flete, ShipCountry as 'Pais de envio'
from Orders
where (Freight between 50 and 200)
and ShipCountry IN ('Germany', 'France')

-- seleccionar todos los productos que tengan un precio entre 5 y 20 dolares o que sean de la categoria de 1, 2 o 3

select ProductID as 'ID del producto', ProductName as 'Nombre del producto', UnitPrice as Precio, CategoryID as Categoria
from Products
where (UnitPrice between 5 and 20)
and CategoryID IN (1,2,3)

-- Empleados con numero de trabajador entre 3 y 7 que no trabajan en Londres ni seattle

select EmployeeID as 'Numero de trabajador', concat(FirstName, ' ', LastName) as 'Nombre Completo', City as Ciudad
from Employees
where (EmployeeID between 3 and 7)
and not City IN ('London', 'Seattle')

select EmployeeID as 'Numero de trabajador', concat(FirstName, ' ', LastName) as 'Nombre Completo', City as Ciudad
from Employees
where EmployeeID >=3 and EmployeeID <=7
and not City IN ('London', 'Seattle')

-- Clausula Like
-- Patrones:
	-- 1) % (Porcentaje) -> Representa cero o mas caracteres en el patron de busqueda
	-- 2) _ (Guion bajo) Representa exactamete un caracter en el patron de busqueda
	-- 3) [] (Corchetes) Se utiliza para definir un conjunto de caracteres buscando cualquiera de ellos
	--		 en la posicion especifica.
	-- 4) [^] Se utiliza para buscar caracteres que no estan dentro del conjutno especifico.

	--Buscar los productos que comienzan con Cha

	Select * from 
	Products
	where ProductName like 'Cha%'
	and UnitPrice=18

	-- Buscar todos los productos que terminen con 'e'

	select *
	from Products
	where ProductName like '%e'

	-- Seleccionar todos los clientes cuyo nombre de empresa contiene 'co' en cualquier parte

	select *
	from Customers
	where CompanyName like '%co%'

	-- Seleccionar los empleados cuyo nombre comience con "A" y que tenga exactamente 5 caracteres.

	select *
	from Employees
	where FirstName like 'A_____'

	-- Seleccionar los productos que comiencen con a o b

	select *
	from Products
	where ProductName like '[ABC]%'

	select *
	from Products
	where ProductName like '[A-M]%'

	-- seleccionar todos los productos que no comiencen con a o b

	select *
	from Products
	where ProductName not like '[AB]%'

	select *
	from Products
	where ProductName like '[^AB]%'

	-- seleccionar todos los productos donde el nombre que comience con a pero no contenga la e

	select *
	from Products
	where ProductName like 'a[^e]%'

	-- Clausula Order By

	select ProductID, ProductName, UnitPrice, UnitsInStock
	from Products
	order by UnitPrice desc

	select ProductID, ProductName, UnitPrice as 'Precio', UnitsInStock
	from Products
	order by 3 desc

	select ProductID, ProductName, UnitPrice as 'Precio', UnitsInStock
	from Products
	order by 'Precio' desc

	-- seleccionar los clientes ordenados por el pais y dentro por ciudad

	select CustomerID, Country, City
	from Customers
	order by Country asc, city asc

	select CustomerID, Country, City
	from Customers
	where Country in ('Brazil','Germany')
	order by Country asc, city desc

	select CustomerID, Country, City, Region
	from Customers
	where (Country = 'Brazil' or Country = 'Germany')
	and Region is not null
	order by Country, city desc
