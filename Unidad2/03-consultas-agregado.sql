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
