-- CREAMOS LA BASE DE DATOS
CREATE DATABASE administracion_biblioteca;

-- Especificamos en que base de datos vamos a trabajar.
USE administracion_biblioteca;

-- CREAR TABLA DE ESTUDIANTE CON SUS DIFERENTES TIPOS DE DATOS.
CREATE TABLE Estudiante (
id_matricula INT AUTO_INCREMENT PRIMARY KEY,
nombre VARCHAR(70) NOT NULL,
apellido VARCHAR(70) NOT NULL,
telefono VARCHAR(15),
carrera VARCHAR(70)
);

-- INSERTAR DATOS DE PRUEBA A LA TABLA ESTUDIANTE.
INSERT INTO Estudiante (nombre, apellido, telefono, carrera)
VALUES('Juan Jose', 'Romero Rojas', '123', 'Tecnologia en desarrollo de software'),('Carlos Andres', 'Romero Rojas', '1234', 'Ingenieria industrial'),('Dana Valentina', 'Rojas Gimenez', '12345', 'Negocios internacionales');

-- CREAR TABLA DE LIBRO CON SUS DIFERENTES TIPOS DE DATOS.
CREATE TABLE Libro (
id_libro INT AUTO_INCREMENT PRIMARY KEY,
titulo VARCHAR(70) NOT NULL,
año_publicacion YEAR,
id_editorial INT,
CONSTRAINT fk_editorial FOREIGN KEY (id_editorial) REFERENCES Editorial(id_editorial)
);

-- REALIZACION DE UN ALTER TABLE PARA AGREGAR UNA NUEVA RESTRICCION EN LA TABLA LIBRO.
ALTER TABLE Libro 
ADD CONSTRAINT unique_titulo UNIQUE (titulo);

-- INSERTAR DATOS DE PRUEBA A LA TABLA DE LIBRO.
INSERT INTO Libro (titulo, año_publicacion, id_editorial)
VALUES ('Caperucita roja', '2004', '1'),('Harry Poter', '2000', '2'),('Berserk', '2006', '3');

-- CREAR TABLA DE EDITORIAL CON SUS DIFERENTES TIPOS DE DATOS.
CREATE TABLE Editorial(
id_editorial INT AUTO_INCREMENT PRIMARY KEY,
nombre VARCHAR(70) NOT NULL
);

-- INSERTAR DATOS DE PRUEBA A LA TABLA DE EDITORIAL.
INSERT INTO Editorial (nombre)
VALUES ('Diseñadores de sueños'),('Creadores del encanto'),('Imaginacion grande');

-- CREAR TABLA DE AUTOR CON SUS DIFERENTES TIPOS DE DATOS.
CREATE TABLE Autor(
id_autor INT AUTO_INCREMENT PRIMARY KEY,
nombre VARCHAR(70) NOT NULL,
nacionalidad VARCHAR(70),
fecha_nacimiento DATE
);

-- INSERTAR DATOS DE PRUEBA A LA TABLA DE AUTOR.
INSERT INTO Autor (nombre, nacionalidad, fecha_nacimiento)
VALUES ('Gabriel Garcia Marquez', 'Colombia', '1987-05-09'),('Juan Jose Romero Rojas', 'Peru', '2006-07-15'),('Stella Rojas', 'Mexico', '1995-08-14');

-- CREAR TABLA INTERMEDIA CON SUS DIFERENTES TIPOS DE DATOS.
CREATE TABLE Autor_Libro(
id_autor INT,
id_libro INT,
PRIMARY KEY (id_autor, id_libro),
FOREIGN KEY (id_autor) REFERENCES Autor(id_autor),
FOREIGN KEY (id_libro) REFERENCES Libro(id_libro)
);

-- INSERTAR DATOS DE PRUEBA A LA TABLA DE AUTOR_LIBRO
INSERT INTO Autor_Libro(id_autor, id_libro)
VALUES (1,1), (2,2),(3,3);

-- CREAR TABLA DE PRESTAMOS CON SUS DIFERENTES TIPOS DE DATOS.
CREATE TABLE Prestamos(
id_prestamos INT AUTO_INCREMENT PRIMARY KEY,
fecha_prestamo DATE NOT NULL,
fecha_devolucion DATE,
id_matricula INT,
id_libro INT,
FOREIGN KEY (id_matricula) REFERENCES Estudiante(id_matricula),
FOREIGN KEY (id_libro) REFERENCES Libro(id_libro)
);

-- VALIDAR QUE SE INSERTARON BIEN LOS DATOS
SELECT * FROM Editorial;
SELECT * FROM Autor;
SELECT * FROM Libro;
SELECT * FROM Autor_Libro;
SELECT * FROM Estudiante;


-- VALIDAR LA INTEGRADAD
-- INSERTARE PRESTAMO CON ESTUDIANTE INEXISTENTE 
INSERT INTO Prestamos (fecha_prestamo, id_matricula, id_libro)
VALUES ('2025-10-10', 10, 1);

-- INSERTARE LIBRO CON EDITORIAL INEXISTENTE
INSERT INTO Libro (titulo, año_publicacion, id_editorial)
VALUES ('Prueba', 2018, 35);