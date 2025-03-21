

 -- Realizar un pedido
 -- Vakidar que el pedido no exista
 -- Validar que el cliente, el empleado y producto exista
 -- validar que la cantidad a vender tenga suficiente stock
 -- insertar el pedido y calcular el importe(Multiplicando el precio del producto por cantidad vendida)
 -- Actualizar el stock del producto(Restando el stock menos la cantidad vendida)

 -- Procedimiento almacenado para realizar un pedido
CREATE OR ALTER PROC spu_realizar_pedido
@numPedido INT, -- Número del pedido
@cliente INT, -- ID del cliente
@representante INT, -- ID del representante de ventas
@fab CHAR(3), -- Código del fabricante
@producto CHAR(5), -- Código del producto
@cantidad INT -- Cantidad del producto a vender
AS
BEGIN
    -- Validar si el pedido ya existe
    IF EXISTS (SELECT 1 FROM Pedidos WHERE Num_Pedido = @numPedido) 
    BEGIN
        PRINT 'El pedido existe!'
        RETURN
    END

    -- Validar que el cliente, representante y producto existan
    IF NOT EXISTS (SELECT 1 FROM Clientes WHERE Num_Cli = @cliente) OR
       NOT EXISTS (SELECT 1 FROM Representantes WHERE Num_Empl = @representante) OR
       NOT EXISTS (SELECT 1 FROM Productos WHERE Id_fab = @fab AND Id_producto = @producto)
    BEGIN
        PRINT 'El Cliente/Empleado o Producto no existe'
        RETURN 
    END

    -- Validar que la cantidad sea mayor a 0
    IF @cantidad <= 0
    BEGIN
        PRINT 'La cantidad no puede ser 0 o negativa'
        RETURN;
    END

    -- Obtener el stock disponible del producto
    DECLARE @stockValido INT
    SELECT @stockValido = Stock FROM Productos WHERE Id_fab = @fab AND Id_producto = @producto

    -- Verificar si hay suficiente stock
    IF @cantidad > @stockValido
    BEGIN
        PRINT 'No hay suficiente stock'
        RETURN;
    END

    -- Declarar variables para precio e importe total
    DECLARE @precio MONEY
    DECLARE @importe MONEY

    -- Obtener el precio del producto
    SELECT @precio = Precio FROM Productos WHERE Id_fab = @fab AND Id_producto = @producto
    SET @importe = @cantidad * @precio -- Calcular el importe total

    BEGIN TRY 
        -- Insertar el pedido en la tabla Pedidos
        INSERT INTO Pedidos
        VALUES(@numPedido, GETDATE(), @cliente, @representante, @fab, @producto, @cantidad, @importe);
    
        -- Actualizar el stock del producto restando la cantidad vendida
        UPDATE Productos
        SET Stock = Stock - @cantidad
        WHERE Id_fab = @fab AND Id_producto = @producto;
    END TRY
    BEGIN CATCH
        PRINT 'Error al actualizar datos'
        RETURN;
    END CATCH

END;

GO

-- Ejecución del procedimiento almacenado con diferentes parámetros
EXEC spu_realizar_pedido @numPedido = 113070, @cliente = 2000, @representante=106, @fab = 'REI', @producto='2A44L', @cantidad = 20
EXEC spu_realizar_pedido @numPedido = 113070, @cliente = 2117, @representante=111, @fab = 'REI', @producto='2A44L', @cantidad = 20
EXEC spu_realizar_pedido @numPedido = 113070, @cliente = 2117, @representante=101, @fab = 'ACI', @producto='4100X', @cantidad = 20

-- Consultar los productos para verificar stock actualizado
SELECT * FROM Productos WHERE Id_fab = 'ACI' AND Id_producto = '4100X'