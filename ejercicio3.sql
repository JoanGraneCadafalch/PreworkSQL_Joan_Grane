/* EJERCICIO 3 */
/*1. Crea una tabla llamada "Productos" con las columnas: "id" (entero, clave primaria), "nombre" (texto) y "precio" (numérico).*/
CREATE TABLE IF NOT EXISTS Productos(
  id SERIAL PRIMARY KEY,
  nombre VARCHAR(255),
  precio DECIMAL
)

/*2. Inserta al menos cinco registros en la tabla "Productos".*/
INSERT INTO public.productos(nombre,precio)
VALUES
('Patatas',2.05),
('Tomates',1.33),
('Cebollas',0.99),
('Lechugas',1.24),
('Pepino',3.01);

/*3. Actualiza el precio de un producto en la tabla "Productos".*/
UPDATE public.productos
SET precio = 1.44
WHERE nombre = 'Tomates';

/*4. Elimina un producto de la tabla "Productos".*/
DELETE FROM public.productos
WHERE nombre = 'Tomates';

/*5. Realiza una consulta que muestre los nombres de los usuarios junto con los nombres de los productos que han comprado (utiliza un INNER JOIN con la tabla "Productos").*/
/* No tenemos estas relaciones entre las tablas usuarios y productos*/

