
select c.CategoryName, c.CategoryID, p.CategoryID, p.ProductName from Categories as c
inner join Products as p
on c.CategoryID = p.CategoryID
where c.CategoryName = 'Fast Food'

select distinct c.categoryName, c.CategoryID, p.CategoryID, p.ProductName
from Categories as c
left join Products as p
on c.CategoryID = p.CategoryID
where p.CategoryID is null

select c.CategoryName, c.CategoryID, p.CategoryID, p.ProductName 
from Products as p
left join Categories as c
on c.CategoryID = p.CategoryID

select * from Products

insert into Products (ProductName, SupplierID, CategoryID, QuantityPerUnit, UnitPrice, UnitsInStock, UnitsOnOrder, ReorderLevel, Discontinued)
values('Burger Sabrosa', 1, 9, 'xyz', 68.7, 45, 12, 2,0)

insert into Products (ProductName, SupplierID, CategoryID, QuantityPerUnit, UnitPrice, UnitsInStock, UnitsOnOrder, ReorderLevel, Discontinued)
values('Paste K', 1, Null, 'xyz', 68.7, 45, 12, 2,0)

delete Products
where CategoryID = 9

-- Listar los empleados y los pedidos que han gestionado, incluyendo los empleados que no han hecho pedidos.


-- mostrar todos los productos que no tienen categoria

select c.CategoryName as Categoria, p.ProductName as Productos 
from Products as p
left join Categories as c
on p.CategoryID = c.CategoryID
where c.CategoryID is null

