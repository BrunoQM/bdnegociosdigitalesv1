
-- Funciones de cadena

-- Las funciones de cadena permiten manipular tipos de datos como varchar, nvarchar, char, nchar

-- funcion Len -> Devuelve la longitud de una cadena

-- Declaracion de una variable

DECLARE @numero int;
set @numero = 10;
print @numero


-- obtener el tamaño de la cadena almacenada en la variable Texto

DECLARE @Texto varchar(50) = 'Hola, mundo!'

select LEN(@Texto) as Longitud

-- funcion left -> Extrae un determinado numero de caracteres desde el inicio de la cadena.

select LEFT(@Texto, 4) as Inicio

-- funcion right -> Extrae un determinado numero de caracteres del final de la cadena

select RIGHT(@Texto, 6) as Final

-- substring -> Extrae una parte de la cadena

select SUBSTRING(@Texto,7,5) as Extraccion

-- Replace -> Reemplaza una subcadena por otra
-- REPLACE (String_expression, string_pattern, string_replacement)

select REPLACE(@Texto,'Mundo', 'Pepino') as Remplazo

-- CharIndex

select CHARINDEX('Mundo',@Texto) 


DECLARE @Texto2 varchar(50) = 'Hola, mundo!'

-- Upper -> Convierte una cadena en mayusculas
select Upper(@Texto2) as Mayusculas
select Upper(SUBSTRING(@Texto2,7,5)) as NuevoTexto

select concat(left(@Texto2,5), 
Upper(SUBSTRING(@Texto2,7,5)),
right(@Texto2,1)) as NuevoTexto

update Customers
set CompanyName = UPPER(CompanyName)
where country in ('Mexico', 'Germany')

-- Trim -> Quita espacios en blanco de una cadena
select Trim(  ' test ') as Result;

DECLARE @Texto3 varchar(50) = 'Hola, mundo!'
Select LTRIM(@Texto3 = '     Hola,Mundo      '

select CompanyName, len(CompanyName) as 'Numero de caracteres',
left(CompanyName, 4) as Inicio,
right(CompanyName, 6) as Final,
substring(CompanyName,7,4) as Extraccion
from Customers
