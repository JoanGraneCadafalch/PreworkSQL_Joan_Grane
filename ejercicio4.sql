/* EJERCICIO 4 */
/*1. Crea una tabla llamada "Pedidos" con las columnas: "id" (entero, clave primaria), "id_usuario" (entero, clave foránea de la tabla "Usuarios") y "id_producto" (entero, clave foránea de la tabla "Productos").*/
CREATE TABLE IF NOT EXISTS pedidos(
  	id SERIAL PRIMARY KEY,
	id_usuario INT NOT NULL,
	CONSTRAINT FK_id_usuario FOREIGN KEY (id_usuario) REFERENCES public.usuarios(id),
	id_producto INT NOT NULL,
	CONSTRAINT FK_id_producto FOREIGN KEY (id_producto) REFERENCES public.productos(id)
	)

/*2. Inserta al menos tres registros en la tabla "Pedidos" que relacionen usuarios con productos.*/
INSERT INTO public.pedidos(id_usuario,id_producto)
VALUES
(5,1),
(5,3),
(4,3),
(3,4),
(2,5);

/*3. Realiza una consulta que muestre los nombres de los usuarios y los nombres de los productos que han comprado, incluidos aquellos que no han realizado ningún pedido (utiliza LEFT JOIN y COALESCE).*/
SELECT public.usuarios.nombre AS NombreUsuario, COALESCE(public.productos.nombre, 'Ningún producto') AS NombreProducto
FROM Usuarios
LEFT JOIN public.pedidos ON public.usuarios.id = public.pedidos.id_usuario
LEFT JOIN public.productos ON public.pedidos.id_producto = public.productos.id
ORDER BY public.usuarios.nombre;

/*4. Realiza una consulta que muestre los nombres de los usuarios que han realizado un pedido, pero también los que no han realizado ningún pedido (utiliza LEFT JOIN).*/
SELECT DISTINCT public.usuarios.nombre AS NombreUsuario
FROM public.usuarios
ORDER BY public.usuarios.nombre;

/*5. Agrega una nueva columna llamada "cantidad" a la tabla "Pedidos" y actualiza los registros existentes con un valor (utiliza ALTER TABLE y UPDATE)*/
ALTER TABLE public.pedidos
ADD COLUMN cantidad INT;

UPDATE public.pedidos
SET cantidad =FLOOR(1 + (RANDOM() * 10));
