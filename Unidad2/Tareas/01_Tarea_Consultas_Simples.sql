use Northwind;


-- 1.    Productos con categor�a 1, 3 o 5

select *
from Products
where CategoryID IN (1,3,5)

-- 2.    Clientes de M�xico, Brasil o Argentina

select *
from Customers
where Country IN ('Mexico', 'Brazil', 'Argentina')

-- 3.    Pedidos enviados por los transportistas 1, 2 o 3 y con flete mayor a 50

select *
from Orders
where ShipVia IN (1,2,3)
and Freight >=50

-- 4.    Empleados que trabajan en Londres, Seattle o Buenos Aires

select *
from Employees
where City IN ('London', 'Seattle', 'Buenos Aires')

-- 5.    Pedidos de clientes en Francia o Alemania, pero con un flete menor a 100

select *
from Employees
where
-- 6.    Productos con categor�a 2, 4 o 6 y que NO est�n descontinuados
-- 7.    Clientes que NO son de Alemania, Reino Unido ni Canad�
-- 8.    Pedidos enviados por transportistas 2 o 3, pero que NO sean a USA ni Canad�
-- 9.    Empleados que trabajan en 'London' o 'Seattle' y fueron contratados despu�s de 1995
-- 10.    Productos de categor�as 1, 3 o 5 con stock mayor a 50 y que NO est�n descontinuados