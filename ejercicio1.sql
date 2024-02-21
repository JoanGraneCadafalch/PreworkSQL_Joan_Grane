/* EJERCICIO 1 */
/*1. Crear una tabla llamada "Clientes" con las columnas: id (entero, clave primaria), nombre (texto) y email (texto).*/
CREATE TABLE IF NOT EXISTS clientes(
  id SERIAL PRIMARY KEY,
  nombre VARCHAR(255),
  email VARCHAR(255)
)

/*2. Insertar un nuevo cliente en la tabla "Clientes" con id=1, nombre="Juan" y email="juan@example.com".*/
INSERT INTO public.clientes(nombre,email)
VALUES
('Juan','juan@exemple.com'),
('Jose','jose@hotmail.com');

/*3. Actualizar el email del cliente con id=1 a "juan@gmail.com".*/
UPDATE public.clientes
SET email = 'juan@gmail.com'
WHERE id = 1;

/*4. Eliminar el cliente con id=1 de la tabla "Clientes".*/
DELETE FROM public.clientes
WHERE id = 1

/*5. Crear una tabla llamada "Pedidos" con las columnas: id (entero, clave primaria), cliente_id (entero, clave externa referenciando a la tabla "Clientes"), producto (texto) y cantidad (entero).*/
CREATE TABLE IF NOT EXISTS pedidos(
  id SERIAL PRIMARY KEY,
  producto VARCHAR(255),
  cantidad INT,
  cliente_id INT NOT NULL,
  CONSTRAINT FK_cliente_id FOREIGN KEY (cliente_id) REFERENCES Clientes(id)
)

/*6. Insertar un nuevo pedido en la tabla "Pedidos" con id=1, cliente_id=1, producto="Camiseta" y cantidad=2.*/
INSERT INTO public.Pedidos(cliente_id, producto, cantidad)
VALUES(2,'Camiseta',2)
/* he usado un cliente 2, ya que el cliente 1 ha sido eliminado en el paso 4.*/

/*7. Actualizar la cantidad del pedido con id=1 a 3.*/
UPDATE public.Pedidos
SET cantidad = 3

/*8. Eliminar el pedido con id=1 de la tabla "Pedidos".*/
DELETE FROM public.Pedidos
WHERE id = 1

/*9. Crear una tabla llamada "Productos" con las columnas: id (entero, clave primaria), nombre (texto) y precio (decimal).*/
CREATE TABLE IF NOT EXISTS Productos(
  id SERIAL PRIMARY KEY,
  nombre VARCHAR(255),
  precio DECIMAL
)

/*10. Insertar varios productos en la tabla "Productos" con diferentes valores.*/
INSERT INTO public.productos(nombre,precio)
VALUES
('Patatas',2.05),
('Tomates',1.33),
('Cebollas',0.99),
('Lechugas',1.24);

/*11. Consultar todos los clientes de la tabla "Clientes".*/
SELECT * FROM public.Clientes

/*12. Consultar todos los pedidos de la tabla "Pedidos" junto con los nombres de los clientes correspondientes.*/
SELECT public.Pedidos.*, Clientes.nombre
FROM Pedidos
JOIN Clientes ON Pedidos.cliente_id = Clientes.id

/*13. Consultar los productos de la tabla "Productos" cuyo precio sea mayor a $50.*/
SELECT * FROM public.productos
WHERE precio > 2.00

/*14. Consultar los pedidos de la tabla "Pedidos" que tengan una cantidad mayor o igual a 5.*/
SELECT * FROM public.pedidos
WHERE cantidad > 2

/*15. Consultar los clientes de la tabla "Clientes" cuyo nombre empiece con la letra "A".*/
SELECT * FROM public.clientes
WHERE nombre LIKE 'A%'

/*16. Realizar una consulta que muestre el nombre del cliente y el total de pedidos realizados por cada cliente.*/
SELECT public.clientes.nombre, COUNT(public.pedidos.cliente_id) AS total_pedidos
FROM public.clientes
JOIN public.pedidos ON public.clientes.id = public.pedidos.cliente_id
GROUP BY public.clientes.nombre

/*17. Realizar una consulta que muestre el nombre del producto y la cantidad total de pedidos de ese producto.*/
SELECT public.productos.nombre, SUM(public.pedidos.cantidad) AS total_pedidos
FROM public.productos
JOIN public.pedidos ON public.productos.nombre = public.pedidos.producto
GROUP BY public.productos.nombre

/*18. Agregar una columna llamada "fecha" a la tabla "Pedidos" de tipo fecha.*/
ALTER TABLE public.pedidos
ADD COLUMN fecha DATE;

/*19. Agregar una clave externa a la tabla "Pedidos" que haga referencia a la tabla "Productos" en la columna "producto".*/
ALTER TABLE Productos
ADD CONSTRAINT unique_producto UNIQUE (nombre);

ALTER TABLE Pedidos
ADD CONSTRAINT fk_pedidos_producto
FOREIGN KEY (producto) REFERENCES Productos(nombre);

/*20. Realizar una consulta que muestre los nombres de los clientes, los nombres de los productos y las cantidades de los pedidos donde coincida la clave externa.*/
SELECT public.clientes.nombre, public.productos.nombre, public.pedidos.cantidad
FROM public.pedidos
JOIN public.clientes ON public.pedidos.cliente_id = public.clientes.id
JOIN public.productos ON public.pedidos.producto = public.productos.nombre