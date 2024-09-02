CREATE DATABASE programa;

\c programa

CREATE TABLE gen (
  id INT PRIMARY KEY,
  gen VARCHAR(1) NOT NULL
);
CREATE TABLE nacionalidad (
  id INT PRIMARY KEY,
  nacion VARCHAR(60) NOT NULL
);
CREATE TABLE curso (
  id INT PRIMARY KEY,
  curso VARCHAR(40) NOT NULL
);
CREATE TABLE comuna (
  id INT PRIMARY KEY,
  comuna VARCHAR(40) NOT NULL
);
CREATE TABLE parentesco (
  id INT PRIMARY KEY,
  parentesco VARCHAR(30) NOT NULL
);
CREATE TABLE juzgado (
  id INT PRIMARY KEY,
  juzgado VARCHAR(30) NOT NULL
);
CREATE TABLE motivo (
  id INT PRIMARY KEY,
  motivo VARCHAR(60) NOT NULL
);
CREATE TABLE educacional (
  id INT PRIMARY KEY,
  ed VARCHAR(60) NOT NULL
);
CREATE TABLE salud (
  id INT PRIMARY KEY,
  salud VARCHAR(60) NOT NULL
);
CREATE TABLE roles (
  id INT PRIMARY KEY,
  rol VARCHAR(2) NOT NULL
);
CREATE TABLE profesional (
  id INT PRIMARY KEY,
  nombre VARCHAR(60) NOT NULL,
  email VARCHAR(60) NOT NULL,
  reconocimiento VARCHAR(60),
  rol_id Integer,
  dupla_id Integer,
  urgent BOOLEAN,
  asesoria INT,
  FOREIGN KEY (rol_id) REFERENCES roles(id)
);

CREATE TABLE tareas (
  id INT PRIMARY KEY,
  tarea TEXT,
  profesional INT,
  FOREIGN KEY (profesional) REFERENCES profesional(id)
);

CREATE TABLE logros (
  id SERIAL PRIMARY KEY,
  logro TEXT,
  medalla VARCHAR(60),
  profesional_id INT,
  FOREIGN KEY (profesional_id) REFERENCES profesional(id)
);

CREATE TABLE adulto (
  id INT PRIMARY KEY,
  responsable VARCHAR(60) NOT NULL,
  nacimiento DATE NOT NULL,
  run VARCHAR(13) UNIQUE NOT NULL,
  fono INT NOT NULL,
  labores VARCHAR(60),
  ts_id Integer,
  FOREIGN KEY (ts_id) REFERENCES profesional(id)
);

CREATE TABLE nna (
  id INT PRIMARY KEY,
  nombre VARCHAR(60) NOT NULL,
  nac DATE NOT NULL,
  rut VARCHAR(13) UNIQUE NOT NULL,
  domicilio VARCHAR(255) NOT NULL,
  ingreso DATE NOT NULL,
  rit VARCHAR(13) NOT NULL,
  adulto_id INTEGER,
  psico_id INTEGER,
  salud_id INTEGER,
  educacional_id INTEGER,
  motivo_id INTEGER,
  juzgado_id INTEGER,
  parentesco_id INTEGER,
  comuna_id INTEGER,
  nacionalidad_id INTEGER,
  curso_id INTEGER,
  gen_id INTEGER,
  prorroga DATE,
  larga_permanencia BOOLEAN,
  analisis TEXT,
  fecha_analisis DATE,
  url_analisis TEXT,
  FOREIGN KEY (adulto_id) REFERENCES adulto(id),
  FOREIGN KEY (psico_id) REFERENCES profesional(id),
  FOREIGN KEY (salud_id) REFERENCES salud(id),
  FOREIGN KEY (educacional_id) REFERENCES educacional(id),
  FOREIGN KEY (gen_id) REFERENCES gen(id),
  FOREIGN KEY (motivo_id) REFERENCES motivo(id),
  FOREIGN KEY (juzgado_id) REFERENCES juzgado(id),
  FOREIGN KEY (parentesco_id) REFERENCES parentesco(id),
  FOREIGN KEY (comuna_id) REFERENCES comuna(id),
  FOREIGN KEY (nacionalidad_id) REFERENCES nacionalidad(id),
  FOREIGN KEY (curso_id) REFERENCES curso(id)
);

CREATE TABLE informes (
  nna_id Integer,
  numero Integer NOT NULL,
  url VARCHAR(255),
  FOREIGN KEY (nna_id) REFERENCES nna(id)
);