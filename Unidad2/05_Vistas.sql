
 --views

 -- sintaxis
 /*create view nombreVista
 AS
 select columnas
 from tabla
 where condicion
 */

 use Northwind
 go

 create view VistaCategoriasTodas
 AS
 select CategoryID, CategoryName, [Description], Picture
 from Categories;
 go

 select * from VistaCategoriasTodas
 where CategoryName = 'Beverages'

 drop view VistaCategoriasTodas

 select * from Customers

 -- crear una vista que permita visualizar solamente los clientes de mexico y brazil
 go
 create view VistaClientesLatam
 AS
 Select CompanyName as Clientes, Country as Pais
 from Customers
 where Country IN ('Mexico','Brazil')
 go

 select * from VistaClientesLatam
 drop view VistaClientesLatam

 go
 create view VistaClientesLatam
 AS
 Select *
 from Customers
 where Country IN ('Mexico','Brazil')
 go

 select distinct vcl.Country
 from Orders as O
 inner join VistaClientesLatam as vcl
 on vcl.CustomerID = o.CustomerID

 -- crear una vista que contenga los datos de todas las ordenes de los productos
 -- categorias de productos, empleados y clientes en la orden.
 -- calcular el importe


 create or alter view [dbo].[vistaordenescompra]
 as
 select o.OrderID as 'Numero de orden', o.OrderDate as 'Fecha de orden', o.RequiredDate as 'Fecha de Requesicion', 
 CONCAT(e.FirstName, ' ', e.LastName) as 'Nombre Empleado', cu.CompanyName as Cliente, p.ProductName as 'Nombre Producto', 
 c.CategoryName as 'Nombre de Categoria', od.UnitPrice as 'Precio de Venta', od.Quantity as 'Cantidad Vendida', 
 (od.Quantity * od.UnitPrice) as Importe from
 Categories as c
 inner join Products as p
 on c.CategoryID = p.CategoryID
 inner join [Order Details] as od
 on od.ProductID = p.ProductID
 inner join Orders as o
 on od.OrderID = o.OrderID
 inner join Customers as cu
 on cu.CustomerID = o.CustomerID
 inner join Employees as e
 on e.EmployeeID = o.EmployeeID

 select count(distinct [numero orden]) as [Numero de Ordenes]
 from vistaordenescompra

 select sum([Importe] * [Precio de Venta]) as [importe total]
 from vistaordenescompra
 go

  select sum([Importe]) as [importe total]
 from vistaordenescompra
 where year([Fecha de orden]) between '1995' and '1996'
 go

 select [Cliente] as 'Nombre cliente',
 sum(Importe) as 'Importe total'
 from vistaordenescompra
 where year([Fecha de orden]) between '1995' and '1996'
 group by [Cliente]  -- Muestra el número total de pedidos por cliente.
 having count(*)>2  -- Muestra solo los clientes que tienen más de 2 pedidos.
 go

 -- crear codigo rh
 create schema rh

 create table rh.tablarh (
 id int primary key,
 nombre nvarchar(50)
 )


 -- vista horizontal
 create or alter view rh.viewcategoriasproductos
 as
 select c.CategoryID, c.CategoryName, p.ProductID, p.ProductName from
 Categories as c
 inner join Products as p
 on c.CategoryID = p.CategoryID;
 GO

 select * from rh.viewcategoriasproductos