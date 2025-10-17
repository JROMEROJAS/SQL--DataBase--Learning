# 🧠 En que se base la actividad?
En la creacion del diseño y creacion de una base de datos relacional que nace previamente de la realizacion de un modelo entidad-relacion y relacional de una actividad planteada el corte pasado. Este trataba del manejo o gestion de la informacion principal de una biblioteca donde incluia varias entidades o objetos: 

- **Estudiantes.**
- **Libros.**
- **Editoriales.**
- **Autores.**
- **Prestamos.**

## 🧱 Estructura de la base de datos

- 🧩**Estudiantes:**
Contiene los datos personales de los estudiantes registrados en la biblioteca.
```sql
CREATE TABLE Estudiante (
id_matricula INT AUTO_INCREMENT PRIMARY KEY, --Utilizamos el auto_increment en la primary key para que se autoincremente al momento de detectar cambios de nuevos registros.
nombre VARCHAR(70) NOT NULL, --Utilizamos tipos de datos varchar en nombre, apellido, telefono y carrera. Ya que son cadenas de texto o string con una cantidad variada, en este caso le asigne 70 a los mas largos y 15 al telefono. Por otra parte tambien utilizamos la restriccion not null para no aceptar datos vacios.
apellido VARCHAR(70) NOT NULL,
telefono VARCHAR(15),
carrera VARCHAR(70)
);
```


- 🧩**Editorial:**
Registra las editoriales que publican libros.
```sql
CREATE TABLE Editorial(
id_editorial INT AUTO_INCREMENT PRIMARY KEY, --Un poco de lo mismo, utilizamos autoincrement y tipos de datos varchar y restricciones not null.
nombre VARCHAR(70) NOT NULL
);
```


- 🧩**Libro:**
Almacena la informacion de los libros disponibles.
```sql
CREATE TABLE Libro (
id_libro INT AUTO_INCREMENT PRIMARY KEY, --Un poco de lo mismo, utilizamos autoincrement en la primary key.
titulo VARCHAR(70) NOT NULL, --Tipo de datos varchar y restricciones not null ya que si o si deben tener un titulo.
año_publicacion YEAR, --Tipo de datos numerico year para poder identificar el año en que se publica el libro.
id_editorial INT, --Tipo de dato numerico int para manejar enteros.
CONSTRAINT fk_editorial FOREIGN KEY (id_editorial) REFERENCES Editorial(id_editorial) --Agregamos la llave foranea de editorial, esto para decir que los libros pertenecen a una editorial registrada.
);

ALTER TABLE Libro --Por otra parte utilice un alter table ya que luego de crear la tabla me di cuenta que pude ingresar una restriccion unique, esto con el fin de poder decir que cada titulo de cada libro debe ser unico y no repetido.
ADD CONSTRAINT unique_titulo UNIQUE (titulo);
```


- 🧩**Autor:**
Guarda los datos de los autores de los libros.
```sql
CREATE TABLE Autor(
id_autor INT AUTO_INCREMENT PRIMARY KEY, --Utilizamos autoincrement en la primary key.
nombre VARCHAR(70) NOT NULL, --Tipo de datos varchar y restriccion notnull.
nacionalidad VARCHAR(70), 
fecha_nacimiento DATE --Tipo de dato numerico date, que nos permite manejar datos numerico de tipo fecha.
);
```


- 🧩**Autor_Libro:**
Esta es una tabla intermedia, es la que representa la relacion de muchos a muchos entre autores y libros.
```sql
CREATE TABLE Autor_Libro(
id_autor INT, --Tipos de datos numeros int, es decir, enteros.
id_libro INT,
PRIMARY KEY (id_autor, id_libro),
FOREIGN KEY (id_autor) REFERENCES Autor(id_autor), --Utilizacion de llave foraneas para la relacion que esta tabla tiene entre autores y libros. Es decir, lo que estamos diciendo es que un libro puede tener varios autores y un autor varios libros.
FOREIGN KEY (id_libro) REFERENCES Libro(id_libro)
);
```


- 🧩**Prestamos:**
Esta se encarga de registrar los prestamos de libros a estudiantes.
```sql
CREATE TABLE Prestamos(
id_prestamos INT AUTO_INCREMENT PRIMARY KEY, --Utilizamos auto increment en la primary key.
fecha_prestamo DATE NOT NULL, --Utilizamos el tipo de dato date para manejar fechas y ademas la restriccion not null para que no acepte campos vacios.
fecha_devolucion DATE,
id_matricula INT, --Tipo de datos numericos int tambien, generalmente sirven para la mayoria de los casos.
id_libro INT,
FOREIGN KEY (id_matricula) REFERENCES Estudiante(id_matricula), --Y por ultimo la relacion entre matricula que identifica al estudiante que tiene el libro y id_libro que basicamente nos especifica el numero del ISBN del libro.
FOREIGN KEY (id_libro) REFERENCES Libro(id_libro)
);
```

-----
## 🚀 Insertar datos de prueba en las diferentes tablas
- 🧩**Estudiantes:**
```sql
-- INSERTAR DATOS DE PRUEBA A LA TABLA ESTUDIANTE.
INSERT INTO Estudiante (nombre, apellido, telefono, carrera)
VALUES('Juan Jose', 'Romero Rojas', '123', 'Tecnologia en desarrollo de software'),('Carlos Andres', 'Romero Rojas', '1234', 'Ingenieria industrial'),('Dana Valentina', 'Rojas Gimenez', '12345', 'Negocios internacionales');
```


- 🧩**Libro:**
```sql
-- INSERTAR DATOS DE PRUEBA A LA TABLA DE LIBRO.
INSERT INTO Libro (titulo, año_publicacion, id_editorial)
VALUES ('Caperucita roja', '2004', '1'),('Harry Poter', '2000', '2'),('Berserk', '2006', '3');
```


- 🧩**Editorial:**
```sql
-- INSERTAR DATOS DE PRUEBA A LA TABLA DE EDITORIAL.
INSERT INTO Editorial (nombre)
VALUES ('Diseñadores de sueños'),('Creadores del encanto'),('Imaginacion grande');
```


- 🧩**Autor:**
```sql
-- INSERTAR DATOS DE PRUEBA A LA TABLA DE AUTOR.
INSERT INTO Autor (nombre, nacionalidad, fecha_nacimiento)
VALUES ('Gabriel Garcia Marquez', 'Colombia', '1987-05-09'),('Juan Jose Romero Rojas', 'Peru', '2006-07-15'),('Stella Rojas', 'Mexico', '1995-08-14');
```

- 🧩**Autor_Libro:**
```sql
-- INSERTAR DATOS DE PRUEBA A LA TABLA DE AUTOR_LIBRO
INSERT INTO Autor_Libro(id_autor, id_libro)
VALUES (1,1), (2,2),(3,3);
```

-----
## ⚡ Validamos si se insertaron bien los datos
```sql
-- VALIDAR QUE SE INSERTARON BIEN LOS DATOS
--Select from nos ayuda a ejecutar las tablas como tal, esto con el fin de ver la informacion o registro que estas tienen.
SELECT * FROM Editorial;
SELECT * FROM Autor;
SELECT * FROM Libro;
SELECT * FROM Autor_Libro;
SELECT * FROM Estudiante;
```


-----
## ⚠️ Validar si detecta errores
```sql
-- VALIDAR LA INTEGRADAD
-- INSERTARE PRESTAMO CON ESTUDIANTE INEXISTENTE 
INSERT INTO Prestamos (fecha_prestamo, id_matricula, id_libro) --Aqui lo que hago es insertar datos erroneos para ver si me los detecta correcto(seria que esta mal) o erroneos (seria lo correcto).
VALUES ('2025-10-10', 10, 1);
```
