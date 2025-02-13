-- consultas de agregado
-- Nota: Solo devuelven un solo registro
-- sum, avg, count, count(*), max y min

-- cuantos clientes tengo
select count(*) as 'Numero de clientes' from Customers

-- cuantas regiones hay

select count(*)
from Customers
where Region is null

select count(distinct Region)
from Customers
where region is not null

select * from Orders
select count(*) from Orders
select count(ShipRegion) from Orders

select * from Products

-- selecciona el precio mas bajo de los productos

select min(UnitPrice), max(UnitPrice),
avg(UnitsInStock) as Media
from Products

-- selecionar cuantos pedidos existen

select count(OrderID)
from Orders


-- Calcula el total de dinero vendido

select sum(UnitPrice * Quantity)
from [Order Details]

select sum(UnitPrice * Quantity - (UnitPrice * Quantity * Discount) ) as Total
from [Order Details]

-- calcula el total de unidades en stock de todos los productos

select sum(UnitsInStock) as 'Total Stock'
from Products


-- seleccionar el numero de productos por categoria

select count(CategoryID), count(*)
from Products
group by CategoryID


-- nhu
select Categories.CategoryName, count(*) from 
Categories
inner join Products as p
on Categories.CategoryID = p.CategoryID
group by Categories.CategoryName

-- calcular el precio promedio de los prodcutos por cada categoria

select CategoryID ,avg(UnitPrice)
from Products
group by CategoryID

-- seleccionar el numero de pedidos realizados por cada empleado

select EmployeeID ,count(OrderID) as 'Pedidos realizados'
from Orders
group by EmployeeID

-- seleccionar el numero de pedidos realizados por cada empleado por el ultimo trimestre
-- de 1996

select EmployeeID, count(*) as 'Pedidos realizados'
from Orders
where OrderDate between '1996-10-01' and '1996-12-31'
group by EmployeeID

-- seleccionar la suma total de unidades vendidas por cada producto 

select sum(Quantity), ProductID
from [Order Details]
group by ProductID
order by 2 desc

select orderid, ProductID, sum(Quantity) as 'Numero de Productos Vendidos'
from [Order Details]
group by OrderID, ProductID
order by 1 desc

-- seleccionar el numero de productos por categoria, pero solo aquellos que tengan mas de 10 productos

-- paso 2
select CategoryID, UnitsInStock
from Products
where CategoryID in (2,4,8)
order by CategoryID asc

-- paso 4

select CategoryID, sum(UnitsInStock)
from Products
where CategoryID in (2,4,8)
group by CategoryID
having count(*)>10
order by CategoryID

-- Listar las ordenes agrupadas por empleado, pero que solo muestre aquellos
-- que hayan gestionado mas de 10 pedidos


-- seleccionar todas las categorias y productos

select * from
Categories
inner join
Products
on categories.CategoryID = products.CategoryID;

select c.CategoryID as [Numero de categoria], CategoryName as 'Nombre categoria', 
ProductName as 'Nombre de Producto', UnitsInStock as 'Existencia', UnitPrice as Precio 
from
Categories as c
inner join
Products as p
on c.CategoryID = p.CategoryID;


-- Selecionar los productos de la categoria beverages y condiments donde la existencia este entre 18 y 30

select c.CategoryID as [Numero de categoria], CategoryName as 'Nombre categoria', 
ProductName as 'Nombre de Producto', UnitsInStock as 'Existencia', UnitPrice as Precio 
from
Categories as c
inner join
Products as p
on c.CategoryID = p.CategoryID
where (c.CategoryName In('Beverages', 'Condiments'))
and p.UnitsInStock between  18 and 30;

select *
from Products as p
join Categories as ca
on p.CategoryID = ca.CategoryID
where (ca.CategoryName = 'beverages' or ca.CategoryName = 'condiments')
and (p.UnitsInStock>=18 and p.UnitsInStock<=30)

-- seleccionar los productos y sus importes realizados de marzo a junio de 1996, mostrando la fecha de la orden
-- el id del producto y el importe

select o.OrderID, o.OrderDate, od.ProductID,
(od.UnitPrice * od.Quantity) as Importe
from Orders as o
join [Order Details] as od
on o.OrderID = od.OrderID
where (o.OrderDate >= '1996-07-01' and o.OrderDate <='1996-10-31')

-- mostrar el importe total de ventas de la consulta anterior

select 
concat('$', ' ', sum(od.Quantity * od.UnitPrice)) as 'Importe'
from orders as o
inner join [Order Details] as od
on od.OrderID = o.OrderID
where o.OrderDate Between '1996-07-01' and '1996-10-31'


