-- ejemplo de left join aplicado

use Northwind

select * from Products_new

drop table products_new

-- Crear una tabla a partir de una consulta
select p.ProductID, p.ProductName, cs.CompanyName, c.CategoryName, od.UnitPrice, p.Discontinued, getdate() as 'Inserted_date'
into products_new
from products as p 
inner join Categories as c
on p.CategoryID = c.CategoryID
inner join [Order Details] as od
on od.ProductID = p.ProductID
inner join Orders as o
on o.OrderID = od.OrderID
inner join Customers as cs
on cs.CustomerID = o.CustomerID

-- crea la tabla con solo la estructura 
select top 0 p.ProductID, p.ProductName, cs.CompanyName, c.CategoryName, od.UnitPrice, p.Discontinued, getdate() as 'Inserted_date'
into products_new
from products as p 
inner join Categories as c
on p.CategoryID = c.CategoryID
inner join [Order Details] as od
on od.ProductID = p.ProductID
inner join Orders as o
on o.OrderID = od.OrderID
inner join Customers as cs
on cs.CustomerID = o.CustomerID

-- Con alias
select top 0 0 as productbk, p.ProductID, p.ProductName as Producto, cs.CompanyName as Customer, c.CategoryName as Categoria, od.UnitPrice, p.Discontinued, getdate() as 'Inserted_date'
into products_new
from products as p 
inner join Categories as c
on p.CategoryID = c.CategoryID
inner join [Order Details] as od
on od.ProductID = p.ProductID
inner join Orders as o
on o.OrderID = od.OrderID
inner join Customers as cs
on cs.CustomerID = o.CustomerID

-- carga full

insert into products_new
select p.ProductID, p.ProductName, cs.CompanyName, c.CategoryName, od.UnitPrice, p.Discontinued, getdate()
from products as p 
inner join Categories as c
on p.CategoryID = c.CategoryID
inner join [Order Details] as od
on od.ProductID = p.ProductID
inner join Orders as o
on o.OrderID = od.OrderID
inner join Customers as cs
on cs.CustomerID = o.CustomerID

drop table products_new

SELECT TOP 0 
	p.ProductID, 
    p.ProductName AS 'Producto',
	cu.CompanyName AS 'Custumer',  
    c.CategoryName AS 'Category', 
    od.UnitPrice, 
    p.Discontinued, 
    GETDATE() AS insert_date
INTO products_new
FROM Products AS p
INNER JOIN Categories AS c
ON p.CategoryID = c.CategoryID
INNER JOIN [Order Details] AS od
ON od.ProductID = p.ProductID
INNER JOIN Orders AS o
ON o.OrderID = od.OrderID
INNER JOIN Customers AS cu
ON cu.CustomerID = o.CustomerID;

--Nuevo campo
alter table products_new
add productbk int not null IDENTITY (1,1)

--Crear primaty key
alter table products_new
add constraint pk_products_new
primary key (productbk)


-- CARGA FULLLLLLLLLLL
INSERT INTO products_new
SELECT
	p.ProductID, p.ProductName,
	cu.CompanyName,  c.CategoryName, od.UnitPrice, p.Discontinued, GETDATE() as 'insert_date'
FROM Products AS p
INNER JOIN Categories as c
ON p.CategoryID = c.CategoryID
INNER JOIN [Order Details] AS od
ON od.ProductID = p.ProductID
INNER JOIN Orders AS o
ON o.OrderID = od.OrderID
INNER JOIN Customers as cu
ON cu.CustomerID = o.CustomerID

select pn.ProductID, pn.Producto, pn.Custumer, pn.Category, pn.UnitPrice, pn.Discontinued, pn.insert_date, p.ProductID, p.ProductName
from Products as p
left join products_new as pn
on p.ProductID = pn.ProductID
where ProductName = 'Elote Feliz'

--left join
select pn.ProductID, pn.Producto, pn.Custumer, pn.Category, pn.UnitPrice, pn.Discontinued, pn.insert_date, p.ProductID, p.ProductName
from Products as p
left join products_new as pn
on p.ProductID = pn.ProductID
where pn.ProductID is null


select p.productID, p.ProductName, cu.CompanyName, c.CategoryName, od.UnitPrice, p.Discontinued, GETDATE() as 'insert_date', pn.ProductID as 'PN_ID'
from Products as p
left join Categories as c
on p.CategoryID = c.CategoryID
left join [Order Details] as od
on od.ProductID = p.ProductID
left join Orders as o
on o.OrderID = od.OrderID
left join Customers as cu
on cu.CustomerID = o.CustomerID
left join products_new as pn
on pn.ProductID = p.ProductID
where pn.ProductID is null



select top 10 *
into products2
from products

select * from Products
select * from products2

SELECT * FROM Products AS p1
INNER JOIN Products2 AS p2
ON p1.ProductID = p2.ProductID

--left join
SELECT * FROM Products AS p1
LEFT JOIN Products2 AS p2
ON p1.ProductID = p2.ProductID

--right join
SELECT * FROM Products AS p1
RIGHT JOIN Products2 AS p2
ON p1.ProductID = p2.ProductID
