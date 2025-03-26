
## Ejemplo de LEFT JOIN aplicado

```sql
USE Northwind;

SELECT * FROM Products_new;

DROP TABLE products_new;
```

---

## Crear una tabla a partir de una consulta

```sql
SELECT 
    p.ProductID, 
    p.ProductName, 
    cs.CompanyName, 
    c.CategoryName, 
    od.UnitPrice, 
    p.Discontinued, 
    GETDATE() AS 'Inserted_date'
INTO products_new
FROM products AS p 
INNER JOIN Categories AS c ON p.CategoryID = c.CategoryID
INNER JOIN [Order Details] AS od ON od.ProductID = p.ProductID
INNER JOIN Orders AS o ON o.OrderID = od.OrderID
INNER JOIN Customers AS cs ON cs.CustomerID = o.CustomerID;
```

---

## Crear la tabla con solo la estructura

```sql
SELECT TOP 0 
    p.ProductID, 
    p.ProductName, 
    cs.CompanyName, 
    c.CategoryName, 
    od.UnitPrice, 
    p.Discontinued, 
    GETDATE() AS 'Inserted_date'
INTO products_new
FROM products AS p 
INNER JOIN Categories AS c ON p.CategoryID = c.CategoryID
INNER JOIN [Order Details] AS od ON od.ProductID = p.ProductID
INNER JOIN Orders AS o ON o.OrderID = od.OrderID
INNER JOIN Customers AS cs ON cs.CustomerID = o.CustomerID;
```

---

## Crear la tabla con alias

```sql
SELECT TOP 0 
    0 AS productbk, 
    p.ProductID, 
    p.ProductName AS Producto, 
    cs.CompanyName AS Customer, 
    c.CategoryName AS Categoria, 
    od.UnitPrice, 
    p.Discontinued, 
    GETDATE() AS 'Inserted_date'
INTO products_new
FROM products AS p 
INNER JOIN Categories AS c ON p.CategoryID = c.CategoryID
INNER JOIN [Order Details] AS od ON od.ProductID = p.ProductID
INNER JOIN Orders AS o ON o.OrderID = od.OrderID
INNER JOIN Customers AS cs ON cs.CustomerID = o.CustomerID;
```

---

## Carga completa de datos

```sql
INSERT INTO products_new
SELECT 
    p.ProductID, 
    p.ProductName, 
    cs.CompanyName, 
    c.CategoryName, 
    od.UnitPrice, 
    p.Discontinued, 
    GETDATE()
FROM products AS p 
INNER JOIN Categories AS c ON p.CategoryID = c.CategoryID
INNER JOIN [Order Details] AS od ON od.ProductID = p.ProductID
INNER JOIN Orders AS o ON o.OrderID = od.OrderID
INNER JOIN Customers AS cs ON cs.CustomerID = o.CustomerID;
```

---

## Agregar nuevo campo

```sql
ALTER TABLE products_new
ADD productbk INT NOT NULL IDENTITY (1,1);
```

## Crear clave primaria

```sql
ALTER TABLE products_new
ADD CONSTRAINT pk_products_new
PRIMARY KEY (productbk);
```

---

## Consultas con LEFT JOIN

```sql
SELECT 
    pn.ProductID, 
    pn.Producto, 
    pn.Custumer, 
    pn.Category, 
    pn.UnitPrice, 
    pn.Discontinued, 
    pn.insert_date, 
    p.ProductID, 
    p.ProductName
FROM Products AS p
LEFT JOIN products_new AS pn ON p.ProductID = pn.ProductID
WHERE ProductName = 'Elote Feliz';
```

```sql
SELECT 
    pn.ProductID, 
    pn.Producto, 
    pn.Custumer, 
    pn.Category, 
    pn.UnitPrice, 
    pn.Discontinued, 
    pn.insert_date, 
    p.ProductID, 
    p.ProductName
FROM Products AS p
LEFT JOIN products_new AS pn ON p.ProductID = pn.ProductID
WHERE pn.ProductID IS NULL;
```

```sql
SELECT 
    p.productID, 
    p.ProductName, 
    cu.CompanyName, 
    c.CategoryName, 
    od.UnitPrice, 
    p.Discontinued, 
    GETDATE() AS 'insert_date', 
    pn.ProductID AS 'PN_ID'
FROM Products AS p
LEFT JOIN Categories AS c ON p.CategoryID = c.CategoryID
LEFT JOIN [Order Details] AS od ON od.ProductID = p.ProductID
LEFT JOIN Orders AS o ON o.OrderID = od.OrderID
LEFT JOIN Customers AS cu ON cu.CustomerID = o.CustomerID
LEFT JOIN products_new AS pn ON pn.ProductID = p.ProductID
WHERE pn.ProductID IS NULL;
```

---

## Creación y comparación de tablas auxiliares

```sql
SELECT TOP 10 *
INTO products2
FROM products;

SELECT * FROM Products;
SELECT * FROM products2;

SELECT * FROM Products AS p1
INNER JOIN Products2 AS p2 ON p1.ProductID = p2.ProductID;
```

---

## Variaciones de JOIN

```sql
-- LEFT JOIN
SELECT * FROM Products AS p1
LEFT JOIN Products2 AS p2 ON p1.ProductID = p2.ProductID;

-- RIGHT JOIN
SELECT * FROM Products AS p1
RIGHT JOIN Products2 AS p2 ON p1.ProductID = p2.ProductID;