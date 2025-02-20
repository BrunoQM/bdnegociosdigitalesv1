select * from Pedidos
select * from Productos

select pr.Descripcion, pr.Precio, pr.Id_fab, p.Fab, pr.Id_producto, p.Producto from pedidos as p
inner join Productos as pr
on p.Fab = pr.Id_fab
and p.Producto = pr.Id_producto

