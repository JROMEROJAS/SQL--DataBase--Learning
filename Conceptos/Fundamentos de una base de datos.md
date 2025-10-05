# 📚 DIAGRAMA ENTIDAD RELACION
Es el modelo conceptual mas utilizado, basado en una percepcion del mundo real mediante una coleccion de objetos, que como su nombre indica, se denominan entidades y relaciones. Una entidad es un objeto real sobre el cual se quiere almacenar informacion. Estos distintos datos que se almacenan sobre este objeto o entidad se denominan atributos.
- Entidad: Un objeto del mundo real. (Ej: Cliente, carro, etc).
- Relacion: Vinculo que existe entre entidades. (Ej: Cliente "realiza" pedido).
- Atributos: Propiedad o caracteristica de una entidad. (Ej: Nombre, edad, etc).
- Atributos simple: Tienen datos unicos y no estan compuestos por nada mas.
- Atributos compuestos: Son aquellos que se componen de atributos mas pequenos.
- Key: Atributo que le agregamos a las entidades para identificarlos de manera unica.


-----

# 🧪 CARDINALIDAD DE UNA RELACION 
La cardinalidad de una relacion es el numero maximo de ocurrencias entre las distintas entidades que se relacionan. Pueden existir distintos tipos como lo son:
- Relacion 1-1 : Una instancia de una entidad se relaciona unicamente con otra instancia de otra entidad.
- Relacion 1-N o N-1: Relacion de un valor de una entidad con muchos valores de otra.
- Relacion N-M : Relacion de un valor de una entidad con muchos de otra y viceversa.


-----

# 📚 DIAGRAMA RELACIONAL
Se planteo para obtener una mayor flexibilidad y rigor en el tratamiento de los datos. El modelo relacional esta formado por tablas donde se representan datos y las relaciones. Una tabla es una lista de valores con un nombre, donde cada valor es una fila o registro compuesto por una o mas columnas o campos, los conceptos fundamentales de este modelo son: 
- Tabla: Contienen distribuidos los datos y relaciones en dos dimensiones, filas y columnas.
- Columnas: Contienen los distintos atributos, que son las partes en las que se desglosara la informacion de cada registro.
- Filas: Almacenaran las distintas instancias denomiadas registros represetna un conjunto de objetos de la vida real del que se almacenan datos.
- Clave primaria: Campo de la tabla que realiza la funcion de identificador, el cual deber ser unico para cada registro.
- Clave ajena: Hace referecnia a los campos que se anaden a una tabla para que quede constancia de su relacion con otra.
- Relaciones: Los datos almacenados en la tabla van a estar relacionados entre si, las relaciones entre las tabalas tambien disponen de cardinalidad.



