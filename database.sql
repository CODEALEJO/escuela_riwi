
----------------------------------------------------/*CREACION DE TODAS LAS TABLAS*/------------------------------------------------------------
/*CREAR LA TABLA DE DOCUMENTOS*/
CREATE TABLE `tipos_de_documentos` (
  `id` int auto_increment unique,
  `nombre` varchar(150),
  `abreviatura` varchar(50),
  PRIMARY KEY (`id`)
);

/*CREACION DE LA TABLA ROLES*/
CREATE TABLE `roles` (
  `id` int auto_increment unique,
  `nombre` varchar(80),
  PRIMARY KEY (`id`)
);

/*CREACION DE LA TABLA EMPLEADOS*/
CREATE TABLE `empleados` (
  `id` int auto_increment unique,
  `empleados` varchar(150),
  `apellidos` varchar(150),
  `fecha de nacimiento` date,
  `direccion` varchar(45),
  `telefono` varchar(80),
  `numero_de_documento` varchar(80),
  `salario` float,
  `tipos_de_documentos_id` int,
  `roles_id` int,
  PRIMARY KEY (`id`)
);


/*CREACION DE LA TABLA ASIGNATURAS*/
CREATE TABLE `asignaturas` (
  `id` int auto_increment unique,
  `nombre` varchar(80),
  PRIMARY KEY (`id`)
);


/*CREACION DE LA TABLA ASIGNATURA_CURSO*/
CREATE TABLE `asignatura_curso` (
  `id` int auto_increment unique,
  `cursos_id` int,
  `asignaturas_id` int,
  `empleados_id` int,
  `empleados_tipos_de_documentos_id` int,
  `empleados_roles_id` int,
  PRIMARY KEY (`id`),
  FOREIGN KEY (`empleados_tipos_de_documentos_id`) REFERENCES `empleados`(`id`),
  FOREIGN KEY (`asignaturas_id`) REFERENCES `asignaturas`(`id`)
);

/*CREACIN DE LA TABLA ESTUDIANTE*/
CREATE TABLE `estudiante` (
  `id` int auto_increment unique,
  `nombre` varchar(150),
  `apellido` varchar(150),
  `fecha_de_nacimiento` DATE,
  `direccion` varchar(150),
  `telefono` varchar(80),
  `numero_de_emergencia` varchar(80),
  `tipo_de_documento` int,
  `numero_de_documento` varchar(80),
  `tipos_de_documentos_id` int,
  `cursos_id` int,
  PRIMARY KEY (`id`),
  FOREIGN KEY (`tipos_de_documentos_id`) REFERENCES `tipos_de_documentos`(`id`)
);

/*CREACION DE LA TABLA CURSOS*/
CREATE TABLE `cursos` (
  `id` int auto_increment unique,
  `nombre` varchar(80),
  `director_de_grupo` varchar(80),
  PRIMARY KEY (`id`)
);

-------------------------------------------------/*INSERCION DE TODOS LOS DATOS A LAS TABLAS */------------------------------------------------

/*TIPOS DE DOCUMENTOS*/
INSERT INTO tipos_de_documentos (nombre, abreviatura) VALUES
('Cédula de ciudadanía', 'C.C.'),
('Tarjeta de identidad', 'T.I.'),  
('Cédula de extranjería', 'C.E.'),
('Pasaporte', 'PSP'),
('Registro civil', 'R.C.');

/*ROLES*/
INSERT INTO roles (nombre) VALUES
('Administrador'),
('Profesor'),
('Estudiante'),
('Secretario'),
('Técnico');

/*DATA_EMPLEADOS*/
INSERT INTO empleados (empleados, apellidos, `fecha de nacimiento`, direccion, telefono, numero_de_documento, salario, tipos_de_documentos_id, roles_id) VALUES
('Juan', 'Pérez', '1990-05-15', 'Calle 123', '123456789', '12345678', 2500.00, 1, 2),
('María', 'González', '1985-08-20', 'Avenida 456', '987654321', '87654321', 2800.00, 2, 3),
('Carlos', 'Martínez', '1988-02-10', 'Plaza Principal', '555123456', '56789123', 3000.00, 1, 1),
('Ana', 'López', '1993-11-25', 'Calle Central', '777888999', '98765432', 2700.00, 3, 2),
('Pedro', 'Sánchez', '1987-04-30', 'Avenida Principal', '999888777', '34567890', 2600.00, 2, 3);

/*ASIGNATURAS/MATERIAS*/
INSERT INTO asignaturas (nombre) VALUES
('Matemáticas'),
('Historia'),
('Ciencias'), 
('Literatura'),
('Arte');

/*DATA CURSOS/GRADOS*/
INSERT INTO cursos (nombre, director_de_grupo) VALUES
('sexto', 'Juan Pérez'), 
('octavo', 'María González'),
('septimo', 'Carlos Martínez'), 
('noveno', 'Ana López'),
('decimo', 'Pedro Sánchez');

/*TODOS LOS ID DE CADA TABLA CON FK*/
INSERT INTO asignatura_curso (cursos_id, asignaturas_id, empleados_id, empleados_tipos_de_documentos_id, empleados_roles_id)
VALUES 
    (1, 1, 1, 1, 1),
    (1, 2, 2, 2, 2),
    (2, 3, 3, 1, 2),
    (2, 4, 4, 2, 1),
    (3, 5, 5, 1, 1);

/*DATA_ESTUDIANTES*/
INSERT INTO estudiante (nombre, apellido, fecha_de_nacimiento, direccion, telefono, numero_de_emergencia, tipo_de_documento, numero_de_documento, tipos_de_documentos_id, cursos_id)
VALUES 
    ('Juan', 'Pérez', '2000-05-15', 'Calle 123', '123456789', '987654321', 1, '1234567890', 1, 1),
    ('María', 'Gómez', '2001-08-20', 'Av. Principal', '987654321', '123456789', 2, '0987654321', 2, 1),
    ('Carlos', 'López', '1999-03-10', 'Carrera 45', '456789012', '654321987', 1, '2345678901', 1, 2),
    ('Laura', 'Martínez', '2002-11-25', 'Plaza Mayor', '789012345', '321987654', 2, '3456789012', 2, 2),
    ('Pedro', 'García', '2003-04-05', 'Avenida Central', '567890123', '789012345', 1, '4567890123', 1, 3);

/*UPDATE CURSOS*/
UPDATE cursos SET nombre= ('sexto') WHERE id= 1;
UPDATE cursos SET nombre= ('septimo') WHERE id= 2;
UPDATE cursos SET nombre= ('octavo') WHERE id= 3;
UPDATE cursos SET nombre= ('noveno') WHERE id= 4;
UPDATE cursos SET nombre= ('decimo') WHERE id= 5;

-----------------------------------------------------------/*CONSULTAS*/-----------------------------------------------------------------------

/*PUNTO 1: ESTUDIANTES de un CURSO x*/
SELECT e.id AS estudiante_id, e.nombre AS nombre_estudiante, c.nombre AS nombre_curso, c.director_de_grupo
FROM estudiante e
INNER JOIN asignatura_curso ac ON e.cursos_id = ac.cursos_id
INNER JOIN cursos c ON ac.cursos_id = c.id
WHERE ac.cursos_id = 1
GROUP BY e.id;

/*PUNTO 2: ESTUDIANTES que vean una ASIGNATURA x*/
SELECT e.nombre AS nombre_estudiante, a.nombre AS nombre_asignatura
FROM estudiante e
INNER JOIN asignatura_curso ac ON e.cursos_id = ac.cursos_id
INNER JOIN asignaturas a ON ac.asignaturas_id = a.id
WHERE ac.asignaturas_id = 5;

/*PUNTO 3: PROFESORES que den clase a un ESTUDIANTE x*/
SELECT prof.empleados, prof.apellidos, est.id,est.nombre, est.apellido  FROM empleados prof
INNER JOIN asignatura_curso ac ON prof.id = ac.empleados_id
INNER JOIN estudiante est ON est.cursos_id = ac.cursos_id
WHERE est.id = 8

/*PUNTO 4: Ver los grupos ordenados de forma descendente por la cantidad de
estudiantes que tiene inscritos*/
SELECT COUNT(*) AS Alumnos,c.nombre from estudiante e
INNER JOIN cursos c ON e.cursos_id = c.id
GROUP BY c.nombre ORDER BY Alumnos desc