CREATE TABLE `tipos_de_documentos` (
  `id` int,
  `nombre` Tipo,
  `abreviatura` Tipo,
  PRIMARY KEY (`id`)
);

CREATE TABLE `roles` (
  `id` int,
  `nombre` varchar(80),
  PRIMARY KEY (`id`)
);

CREATE TABLE `empleados` (
  `id` int,
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

CREATE TABLE `asignaturas` (
  `id` int,
  `nombre` varchar(80),
  PRIMARY KEY (`id`)
);

CREATE TABLE `asignatura_curso` (
  `id` int,
  `cursos_id` int,
  `asignaturas_id` int,
  `empleados_id` int,
  `empleados_tipos_de_documentos_id` int,
  `empleados_roles_id` int,
  PRIMARY KEY (`id`),
  FOREIGN KEY (`empleados_tipos_de_documentos_id`) REFERENCES `empleados`(`id`),
  FOREIGN KEY (`asignaturas_id`) REFERENCES `asignaturas`(`id`)
);

CREATE TABLE `estudiante` (
  `id` int,
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

CREATE TABLE `cursos` (
  `id` int,
  `nombre` varchar(80),
  `director_de_grupo` varchar(80),
  PRIMARY KEY (`id`)
);