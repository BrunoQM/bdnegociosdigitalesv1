
-- Store procedures

-- crear un store procedure para seleccionar todos los clientes

create or alter procedure spu_mostrar_clientes
as
begin 
select * from Customers;
end;
go

-- Ejecutar un store en transact

exec spu_mostrar_clientes

-- Crear un store procedure que muestre los clientes por país.
-- Parametros de entrada
go
create or alter proc spu_customersporpais

-- Parametros

@pais nvarchar(15),
@pais2 nvarchar(15)
  -- Paramentro de entrada
as
begin
	select * from Customers
	where Country in (@pais, @pais2);
end;

-- fin del store

-- Ejecuta un store procedure

Declare @p1 nvarchar(15) = 'Spain';
Declare @p2 nvarchar(15) = 'Germany';

exec spu_customersporpais @p1, @p2;
go


-- generar un reporte que permite visualizar los datos de compra de un determinado cliente,
-- en un rango de fechas, mostrando el monto total de compras de producto, mediante un sp.

create or alter procedure spu_comprasclientes
@nombre nvarchar(40) = 'Bergiunds snabbkop', --parametro de entrada con valor por default
@fechaInicial datetime,
@fechaFinal datetime
AS
begin
--Parametros de entrada
select [Nombre Producto], Cliente, sum(Importe) as 'Monto total'
from vistaordenescompra
where Cliente = @nombre
and [Fecha de orden] between @fechaInicial and @fechaFinal
group by [Nombre Producto], Cliente
end;
GO

-- Ejecucion de un store procedure con paramentros de entrada con un campo que tiene un valor por default

exec spu_comprasclientes 'Berglunds snabbköp', 
						'1996-07-04', '1997-01-01'

exec spu_comprasclientes @fechaInicial = '1996-07-04',
						 @fechaFinal = '1997-01-01',
						 @nombre = 'Berglunds snabbköp';


GO
-- store prcedure con parametros de salida

create or alter proc spu_obtener_numero_clientes
@customerid nchar(5), -- Parametro de entrada
@totalCustomers int output -- Parametro de salida
AS
begin
	select @totalCustomers=count(*) from Customers
	where CustomerID = @customerid;
end;
GO

declare @numero int;
exec spu_obtener_numero_clientes    @customerid = 'ANATR',
									@totalCustomers = @numero output;
print @numero;
go

-- Crear un store procedure que permita saber si un alumno aprobo o reprobo 

create or alter proc spu_comparar_calificacion
@calificacion decimal(10,2) -- paramentro de entrada
AS
begin
	if @calificacion>=0 and @calificacion<=10
	begin
	if @calificacion >=8
	print 'La calificacion es aprobatoria'
	else
	print 'La calificacion es reprobatoria'
end
else
	print 'Calificacion no valida'
end;
GO

exec spu_comparar_calificacion @calificacion=-8

-- crear un store procedure que permite verificar si un cliente existe antes de devolver su informacion

create or alter proc spu_obtener_cliente_si_existe
@numerocliente nchar(5)
AS
begin
	if exists (select 1 from Customers where CustomerID=@numerocliente)
		select * from Customers where CustomerID = @numerocliente;
	else
		print 'El cliente no existe'
end;
GO

exec spu_obtener_cliente_si_existe @numerocliente = 'Pedro'


-- Crear un store procedure que permita insertar un cliente pero se debe verificar primero que no exista

go
create or alter proc spu_agregar_cliente_try_catch
@id nchar(5),
@nombre nvarchar(40), 
@city nvarchar(15) = 'San Miguel'
AS
begin
	begin try
	insert into customers(customerid, companyname)
	values(@id, @nombre)
		print('Cliente insertado correctamente');
	end try

	begin catch
		print('El cliente ya existe')
	end catch
end;
GO

exec spu_agregar_cliente 'AIFKD','Muñeca Vieja'

create or alter proc spu_imprimir
@numero int
AS
begin

	if @numero<=0
	begin
	print ('El numero no puede ser 0 o negativo')
	return
	end
		

	declare @i int
	SET @i = 1
	while(@i<=@numero)
	begin 
		print concat('Numero' , @i)
		set @i = @i + 1
	end

end;
GO

exec spu_imprimir 10
