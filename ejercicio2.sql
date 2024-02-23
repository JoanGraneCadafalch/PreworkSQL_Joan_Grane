/* EJERCICIO 2 */
/*1. Crea una base de datos llamada "MiBaseDeDatos".*/
CREATE DATABASE MiBaseDeDatos;

/*2. Crea una tabla llamada "Usuarios" con las columnas: "id" (entero, clave primaria), "nombre" (texto) y "edad" (entero).*/
CREATE TABLE IF NOT EXISTS Usuarios(
	id SERIAL PRIMARY KEY,
	nombre VARCHAR(255),
	edad int
)

/*3. Inserta dos registros en la tabla "Usuarios".*/
INSERT INTO public.usuarios(nombre,edad)
VALUES
('Lara',31),
('Jose',28);

/*4. Actualiza la edad de un usuario en la tabla "Usuarios".*/
UPDATE public.usuarios
SET edad = 29
WHERE nombre = 'Jose';

/*5. Elimina un usuario de la tabla "Usuarios".*/
DELETE FROM public.usuarios
WHERE nombre = 'Lara'

/*1. Crea una tabla llamada "Ciudades" con las columnas: "id" (entero, clave primaria), "nombre" (texto) y "pais" (texto).*/
CREATE TABLE IF NOT EXISTS ciudades(
	id SERIAL PRIMARY KEY,
	nombre VARCHAR(255),
	pais VARCHAR(255)
)

/*2. Inserta al menos tres registros en la tabla "Ciudades".*/
INSERT INTO public.ciudades(nombre,pais)
VALUES
('Paris','Francia'),
('Londres','Reino Unido'),
('Munich','Alemania'),
('Madrid','España');

/*3. Crea una foreign key en la tabla "Usuarios" que se relacione con la columna "id" de la tabla "Ciudades".*/
ALTER TABLE public.usuarios
ADD COLUMN id_ciudad INT;

ALTER TABLE public.usuarios
ADD CONSTRAINT fk_usuarios_ciudades
FOREIGN KEY (id_ciudad) REFERENCES public.ciudades(id);

/*4. Realiza una consulta que muestre los nombres de los usuarios junto con el nombre de su ciudad y país (utiliza un LEFT JOIN).*/
INSERT INTO public.usuarios(nombre,edad,id_ciudad)
VALUES
('Ana',31,4),
('Angel',28,4),
('Mery',42,2),
('Carol',46,3),
('Andrew',33,1);

SELECT * FROM public.usuarios users
LEFT JOIN public.ciudades ciudad
ON users.id_ciudad = ciudad.id;

/*5. Realiza una consulta que muestre solo los usuarios que tienen una ciudad asociada (utiliza un INNER JOIN).*/
SELECT * FROM public.usuarios users
INNER JOIN public.ciudades ciudad
on users.id_ciudad = ciudad.id;
