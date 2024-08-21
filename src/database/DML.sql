INSERT INTO gen (id, gen) VALUES
	(1, 'F'),
	(2, 'M'),
	(3, 'N');

INSERT INTO nacionalidad (id, nacion) VALUES
	(1, 'chilena'),
	(2, 'peruana'),
	(3, 'boliviana'),
    (4, 'haitiana'),
    (5, 'brasileña'),
    (6, 'venezolana');

INSERT INTO curso (id, curso) VALUES
  (1, '1º básico'),
  (2, '2º básico'),
  (3, '3º básico'),
  (4, '4º básico'),
  (5, '5º básico'),
  (6, '6º básico'),
  (7, '7º básico'),
  (8, '8º básico'),
  (9, '1º medio'),
  (10, '2º medio'),
  (11, '3º medio'),
  (12, '4º medio'),
  (13, 'exámenes libres'),
  (14, 'nivel de transición 1'),
  (15, 'nivel de transición 2'),
  (16, 'pre-kinder'),
  (17, 'kinder'),
  (18, 'sin escolarización');

  INSERT INTO comuna (id, comuna) VALUES
  (1, 'Buin'),
  (2, 'Paine'),
  (3, 'Santiago'),
  (4, 'Peñalolen'),
  (5, 'Arica');

  INSERT INTO parentesco (id, parentesco) VALUES
  (1, 'madre'),
  (2, 'padre'),
  (3, 'tia'),
  (4, 'tio'),
  (5, 'abuela'),
  (6, 'abuelo'),
  (7, 'pariente'),
  (8, 'sin parentesco'),
  (9, 'madrastra'),
  (10, 'hermana');

  INSERT INTO juzgado (id, juzgado) VALUES
  (1, 'Juzgado de Familia de Buin'),
  (2, 'C. M. Cautelares'),
  (3, 'Juzgado de Familia de Colina');

INSERT INTO motivo (id, motivo) VALUES
(1, 'Violencia intrafamiliar'),
(2, 'Maltrato'),
(3, 'Negligencia'),
(4, 'Abuso Sexual'),
(5, 'Testigo de VIF'),
(6, 'Medida de protección'),
(7, 'Violación'),
(8, 'Vulneración en la esfera de la sexualidad');

INSERT INTO educacional (id, ed) VALUES 
(1, 'COLEGIO ALTO DEL VALLE'),
(2, 'COLEGIO EL LABRADOR'),
(3, 'ESCUELA HUMBERTO MORENO RAMIREZ'),
(4, 'LICEO 131'),
(5, 'ESC. DE PARV. Y ESP. PUKARAY'),
(6, 'LICEO POLIVALENTE MODERNO CARDENAL CARO'),
(7, 'ESCUELA PART. NAHUEL'),
(8, 'LICEO TECNICO PROFESIONAL DE BUIN'),
(9, 'En casa'),
(10, 'LICEO FRANCISCO JAVIER KRUGGER ALVARADO'),
(11, 'COLEGIO INGLES SAN JOSE DE LINDEROS'),
(12, 'COLEGIO PART. MARIA ANA MOGAS'),
(13, 'LICEO ESMERALDA'),
(14, 'ESCUELA ESPECIAL Nº 168 NAJU'),
(15, 'ESCUELA VALDIVIA DE PAINE'),
(16, 'COLEGIO SAN ISIDRO'),
(17, 'ESCUELA PUKARAY'),
(18, 'ESCUELA ESPECIAL PARTICULAR LO HERMIDA'),
(19, 'CENTRO EDUCACION MARIANO EGANA'),
(20, 'ESCUELA JOSE NUEZ MARTIN'),
(21, 'LICEO ALTO JAHUEL'),
(22, 'Educación Especial Trastornos Específicos del Lenguaje13'),
(23, 'Sin Matricula'),
(24, 'ESCUELA ESP. MI MUNDO EN PALABRAS DE BUIN'),
(25, 'ESCUELA LOS ROSALES DEL BAJO'),
(26, 'COLEGIO DE MAIPO'),
(27, 'ESCUELA TUCAPEL (ARICA)'),
(28, 'SAINT MARY COLLEGE BUIN'),
(29, 'ESC. BASICA MUNICIPAL PAULA JARAQUEMADA ALQUI'), 
(30, 'ESCUELA BÁSICA N 149 SAN MARCEL'),
(31, 'ESCUELA BÁSICA G-N°813 LOS AROMOS DE EL RECURSO');


INSERT INTO salud (id, salud) VALUES 
(1, 'CESFAM Maipo'),
(2, 'Posta de Viluco'),
(3, 'Cesfam Dr. Héctor García'),
(4, 'Particular'),
(5, 'CESFAM Alto Jahuel'),
(6, 'CESFAM Joan Alsina'),
(7, 'Clínica Alemana'),
(8, 'Clínica Santa Catalina de Buin'),
(9, 'Posta Rural El Monte'),
(10, 'Posta Valdivia de Paine'),
(11, 'Particular Uc-Christus'),
(12, 'Cesfam La Faena'),
(13, 'Particular - Dipreca'),
(14, 'CONSULTORIO LINDEROS'),
(15, 'Cesfam Dr. Miguel Solar'),
(16, 'Atención primaria de la zona')
(17, 'Posta Los Morros'),
(18, 'CECOSF Nuevo Buin');

INSERT INTO roles (id, rol) VALUES
(1, 'PS'),
(2, 'TS'),
(3, 'AT');

INSERT INTO profesional (id, nombre, rol_id, dupla_id, email, mensaje, urgent) VALUES
(1, 'Melissa Pulgar', 1, 2, 'melissa.pulgar@fundaciondem.cl', null, false),
(2, 'Marianela Riquelme', 2, 1, 'marianela.riquelme@fundaciondem.cl', null, false),
(3, 'Enzo Montecinos', 1, 4, 'enzo.montecinos@fundaciondem.cl', null, false), 
(4, 'Ángela Oyarzun', 2, 3, 'correo@fundaciondem.cl', null, false),
(5, 'Marcela Castro', 1, 6, 'marcela.castro@fundaciondem.cl', null, false),
(6, 'Natalia Navarro', 2, 5, 'natalia.navarro@fundaciondem.cl', null, false),
(7, 'Esteban Olivares', 3, 7, 'esteban.olivares@fundaciondem.cl', null, false)
;

INSERT INTO adulto (id, responsable, nacimiento, run, fono, labores, ts_id) VALUES
(1, 'Ana Ortega Farias', '1981-06-11', '14.635.486-6', 976964438, 'Temporera', 2),
(2, 'Ángela Barrera Catalán', '1982-08-12', '15.407.583-6', 954048661, 'Carabinero', 2),
(3, 'Camila Espinoza Heredia', '1991-05-25', '17.769.995-0', 928589687, 'labores domésticas y de cuidado', 4),
(4, 'Carla Constanza Navarrete Espinoza', '1989-01-31', '16.962.907-2', 962537155, 'Temporera en Parrones', 4),
(5, 'Carolina Beatriz Ortega Rojas', '1977-01-27', '13.283.534-9', 940627953, 'Técnico profesional en trabajo Social - Dueña de Casa', 4),
(6, 'Carolina Quiñones Rojas', '1991-09-14', '17.765.672-0', 92539230, 'labores domésticas y de cuidado', 4),
(7, 'Catalina Del Pilar Madrid Aguilera', '1985-10-24', '16.272.122-4', 965535677, 'Operaria de producción', 2),
(8, 'Cecilia Castillo Orellana', '1988-10-03', '17.049.610-8', 979135003, 'Ayudante amasandería', 4),
(9, 'Cindy Hernandez Vergara', '1991-10-26', '17.872.373-1', 986479284, 'Dueña de casa', 4),
(10, 'Claudia Illanes Segovia', '1983-12-28', '15.360.138-3', 993505884, 'Dueña de casa', 2),
(11, 'Daniela Andrea Riquelme Pérez', '1996-07-09', '19.421.619-K', 977095655, 'empresa de aseo de vidrios', 4),
(12, 'Daniela Avila Rodriguez', '1990-10-26', '17.590.699-1', 974842440, 'Dueña de casa', 6),
(13, 'Elisa Roxana Alfaro Maldonado', '1980-05-29', '13.955.560-0', 968437365, 'labores domésticas y de cuidado', 2),
(14, 'Eloísa Gonzalez Rivera', '1980-12-02', '13.774.798-7', 971630493, 'técnico paramédico', 2),
(15, 'Emelina Del Carmen Rubio Marin', '1983-09-03', '15.508.309-K', 953427250, 'Independiente en repostería', 4),
(16, 'Erika De La Cruz Bascuñan Saez', '1992-01-11', '18.086.323-0', 930826397, 'servicio de aseo y ornato municipalidad de Buin', 4),
(17, 'Estefanía Belén Pinto Pinto', '1996-07-28', '19.390.936-1', 972090523, 'Trabajador independiente', 6),
(18, 'Georgina Diaz Caceres', '1972-06-01', '14.441.213-3', 971363334, 'Labores domésticas y de cuidado', 6),
(19, 'German Pizarro Espinoza', '1990-08-05', '17.663.610-6', 957942311, 'Jornada laboral', 6),
(20, 'Hilda Llanos Cerda', '1989-04-15', '17.260.740-3', 933510924, 'labores domésticas y de cuidado', 2),
(21, 'Irma Álvarez Viveros', '1964-05-04', '14.511.745-3', 940005690, 'labores domésticas y de cuidado', 6),
(22, 'Isabel Margarita Pardo Pinto', '1973-06-10', '12.393.444-K', 936730690, 'Auxiliar aseo CESAFAM', 4),
(23, 'Jacqueline Castillo Miranda', '1992-12-05', '18.087.995-1', 961085703, 'labores domésticas y de cuidado', 2),
(24, 'Jennifer Cartagena Muñoz', '1990-04-02', '17.589.524-8', 945891945, 'Trabaja Control De Calidad En Unidad Agrícola Copiapo', 2),
(25, 'Jesenia Pilar Silva Torrealba', '1984-09-04', '17.240.412-K', 931455085, 'labores domésticas y de cuidado', 4),
(26, 'Jessica Esmeralda Garrido Vergara', '1977-11-14', '14.377.716-2', 937863996, 'Auxiliar de aseo Colegio', 2),
(27, 'Jessica Gonzalez Catalán', '1987-06-09', '16.568.028-6', 933241927, 'Cajera', 2),
(28, 'Joaquín Ascuí Níñez', '1991-09-27', '17962122-3', 965341566, 'Trabajador dependiente', 6),
(29, 'Jocelyn Zamorano Quezada', '1985-05-07', '17.904.612-1', 940527236, 'labores domésticas y de cuidado', 2),
(30, 'Jonathan Enrique Ortega Guerrero', '1983-06-04', '15.358.134-7', 976674766, 'labores domésticas y de cuidado', 4),
(31, 'Liliana Arirama Grandez', '1989-06-28', '26.482.776-0', 977896983, 'Ayudante de cocina', 6),
(32, 'Maria Jose Romero Lopez', '1987-12-27', '16.696.644-2', 968335716, 'Agencia de Viajes', 2),
(33, 'María Pía Garcia Hidalgo', '1983-09-12', '15.638.026-1', 995372124, 'Fotógrafa', 4),
(34, 'Marta Alvarez Gaete', '1991-11-10', '18.806.302-8', 959667207, 'Maestra De Cocina En Villa Santa Rita - Dueña De Casa', 4),
(35, 'Miriam Gómez Celis', '1985-08-02', '16.131.195-2', 922520707, 'Labores domésticas y de cuidado', 6),
(36, 'Mitzy Mancilla Henríquez', '1990-10-25', '17.738.678-2', 940790861, 'Técnico en Odontología (Cesfam Dr. Héctor García)', 2),
(37, 'Nataly Catalán Barrera', '1990-10-17', '17.590.403-4', 935270830, 'Temporera y dueña de casa', 6),
(38, 'Nelly Huaman Arevalo', '1989-07-27', '22.764.291-2', 997380388, 'Operaria de producción', 6),
(39, 'Oriana Noemi Cordova Campos', '1979-10-08', '13.595.967-7', 946604855, 'Operaria de producción', 4),
(40, 'Oscar Guzman Maye', '1968-04-11', '10.818.053-6', 989454816, 'Constructor', 6),
(41, 'Paola Elvira Rubio Galvez', '1988-11-08', '17.065.403-K', 950661148, 'vendedor independiente', 4),
(42, 'Patricia De Lourdes Hernandez Delgado', '1968-05-14', '11.339.680-6', 987700596, 'Dueña de casa', 6),
(43, 'Patricia Elsa Silva Villagra', '1971-01-31', '11.749.765-8', 961661026, 'Dueña De Minimarket', 6),
(44, 'Patricia Jimena Cabrera Berrios', '1960-12-23', '8180456-7', 989263385, 'labores domésticas y de cuidado', 2),
(45, 'Patricia Peña Gutierrez', '1991-08-29', '17668465-8', 930594313, 'Dueña de casa, Estudiante, Microempresaria', 2),
(46, 'Raysa Araya Figueroa', '1992-02-01', '18.468.454-3', 922170671, 'Asistente de Aula', 2),
(47, 'Romina Rodriguez Rodriguez', '1996-05-30', '19388916-6', 948470491, 'Labores domésticas y de cuidado', 6),
(48, 'Rosa Ponce Martinez', '1991-05-04', '17.871.497-k', 986787339, 'Ingeniera en Prevención de Riesgos (Supermercado Cugat)', 6),
(49, 'Tamara Andrea Acevedo Contreras', '1993-04-21', '19066012-5', 964091609, 'labores domésticas y de cuidado', 6),
(50, 'Valentina Caru', '2008-01-03', '19.066.394-9', 955249530, 'Labores domésticas y de cuidado', 6),
(51, 'Verónica Andrea López Flores', '1982-08-23', '15.365.883-8', 930795463, 'Independiente en "Disfraces y artesanía"', 6),
(52, 'Viviana Aguilera Marquez', '1973-08-12', '13.774.903-3', 973288421, 'auxiliar de aseo escuela viluco', 4),
(53, 'Ximena Paola Melgarejo San Martín', '1987-12-10', '16675652-9', 950687437, 'labores domésticas y de cuidado', 2),
(54, 'Yaditza Del Carmen Soto Guajardo', '1996-07-13', '19.390.902-7', 946531635, 'Independiente', 6),
(55, 'Yanina Sepulveda Ananias', '1996-10-07', '19.515.077-K', 933545342, 'Trabajadora Informal', 2),
(56, 'Yenifer Caruz', '1993-11-01', '18.402.095-5', 972561233, 'Dueña de casa', 6),
(57, 'Yocelyn Caru Orellana', '1996-09-01', '19.391.228-1', 922578937, 'Cesante (técnico en odontología)', 6),
(58, 'Zoraida Lopez Galdames', '1951-02-17', '6.677.932-7', 949333376, 'labores domésticas y de cuidado', 2),
(59, 'Linset Hidalgo', '1994-02-09', '18.816.566-4', 931446640, 'Dependiente/asalariada', 6);


INSERT INTO nna (id, nombre, nac, rut, domicilio, ingreso, rit, adulto_id, psico_id, salud_id, educacional_id, motivo_id, juzgado_id, parentesco_id, comuna_id, nacionalidad_id, curso_id, gen_id) VALUES
(1781128, 'Fernanda Verdugo Ortega', '2009-09-17', '23147383-1', 'Pasaje 17 N°0207, Población Manuel Plaza', '2023-07-28', 'P-613-2023', 1, 1, 3, 8, 7, 1, 1, 1, 1, 9, 1),
(1927712, 'Emilia Belén Concha Barrera', '2017-11-14', '25984340-5', 'Miguel Marchant 231, Villa Los Tuliperos', '2024-06-24', 'X-354-2023', 2, 1, 13, 22, 5, 1, 1, 1, 1, 15, 1),
(1927721, 'Isabella Catalina Concha Barrera', '2021-02-07', '27464861-9', 'Miguel Marchant 231, Villa Los Tuliperos', '2024-06-24', 'X-354-2023', 2, 1, 13, 9, 5, 1, 1, 1, 1, 18, 1),
(1269012, 'Denise Donoso Espinoza', '2007-09-01', '22496062-K', 'Calle San Luis, parcela N° 2, Alto Jahuel', '2023-08-31', 'X-333-2023', 3, 3, 5, 21, 4, 1, 1, 1, 1, 11, 1),
(1269022, 'Lilian Donoso Espinoza', '2007-09-01', '22496036-0', 'Calle San Luis, parcela N° 2, Alto Jahuel', '2023-08-31', 'X-333-2023', 3, 3, 5, 21, 4, 1, 1, 1, 1, 11, 1),
(1877002, 'Isidora Toloza Navarrete', '2011-09-21', '23751500-5', 'Santa Teresa N°050, Sector Viluco', '2023-12-22', 'P-1438-2023', 4, 3, 2, 3, 1, 1, 1, 1, 1, 6, 1),
(1560629, 'Felipe Alvarado Ortega', '2007-08-18', '22479809-1', 'Julio Onill Rodriguez N°814, Villa Los Ciruelos 2', '2023-10-20', 'X-175-2022', 5, 3, 3, 4, 5, 1, 1, 1, 1, 11, 2),
(1560615, 'Sofia Alvarado Ortega', '2012-01-03', '23837000-0', 'Julio Onill Rodriguez N°814,Villa Los Ciruelos 2', '2023-10-20', 'X-175-2022', 5, 3, 3, 4, 4, 1, 1, 1, 1, 7, 1),
(1965676, 'Agustin Fonseca Quiñonez', '2011-02-22', '23567501-3', 'Víctor Troncoso Muñoz N° 121, Condominio Plaza Buin 1, casa 88, Alto Jahuel', '2023-10-18', 'X-553-2023', 6, 3, 5, 21, 2, 1, 1, 1, 1, 5, 2),
(1678032, 'Elisa Antonia Aguayo Madrid', '2009-10-15', '23147928-7', 'Pasaje Héctor Molina Paredes # 02334, Portales De Buin', '2024-06-07', 'P-1212-2023', 7, 1, 1, 2, 4, 1, 1, 1, 1, 9, 1),
(1705967, 'Rizz Lopez Castillo', '2014-02-28', '24557432-0', 'Toma sector Las Parcela 44, Villa Esperanza, localidad de Maipo', '2023-01-25', 'X-392-2019', 8, 3, 1, 24, 1, 1, 1, 1, 1, 4, 2),
(1006016, 'Anais Sotelo Castillo', '2008-05-24', '22729061-7', 'Las Parcelas 44, Campamento Nuevo Amanecer Maipo', '2024-02-13', 'X-542-2023', 8, 3, 1, 4, 1, 1, 1, 1, 1, 11, 1),
(1947413, 'Ariel Pimentel Hernandez', '2009-11-26', '23190559-6', 'Calle 2, Pasaje 18, Casa 30, Villa El Solar', '2024-01-16', 'X-83-2024', 9, 3, 3, 4, 4, 1, 1, 1, 1, 8, 2),
(1294350, 'Antonia Cuturrufo Illanes', '2009-11-29', '23186677-9', 'Miraflores 0112', '2023-06-28', 'P-589-2023', 10, 1, 5, 7, 4, 1, 3, 1, 1, 8, 1),
(1937672, 'Martín Campos Riquelme', '2015-04-12', '24954206-7', 'Villarrica N°2962, Maipo Villa Del Maipo 2', '2024-03-08', 'X-313-2023', 11, 3, 3, 2, 1, 1, 1, 1, 1, 3, 2),
(1840841, 'Oseias Muñoz Avila', '2016-09-14', '25507891-7', 'Pasaje Angela Fonseca N°30. Villa Lo Salinas', '2023-06-27', 'P-687-2021', 12, 5, 3, 1, 3, 1, 1, 1, 1, 2, 2),
(1628256, 'Valentin Contreras Alfaro', '2012-03-16', '23899244-3', 'Miraflores 195, Alto Jahuel Buin', '2023-12-22', 'X-78-2019', 13, 1, 5, 21, 4, 1, 1, 1, 1, 7, 2),
(1926721, 'Agustina Isidora Soto González', '2018-05-26', '26292568-4', 'El esfuerzo, casa 16, Linderos', '2024-06-18', 'X-445-2023', 14, 1, 14, 28, 1, 1, 1, 1, 1, 15, 1),
(1797746, 'Antonella Valenzuela Rubio', '2012-01-18', '23861523-2', 'Doctor Erick Folch Norte N°30, Villa Santa Clara', '2023-12-18', 'X-401-2023', 15, 3, 3, 6, 2, 1, 1, 1, 1, 7, 1),
(1797740, 'Dayra Valenzuela Rubio', '2006-12-29', '22292908-3', 'Doctor Erick Folch Norte N°30, Villa Santa Clara', '2023-12-18', 'X-401-2023', 15, 3, 3, 6, 2, 1, 1, 1, 1, 12, 1),
(1622159, 'Cristian Asahát Guerra Bascuñán', '2017-01-16', '25635715-1', 'Pasaje Hugo Besoain Pérez N° 02297', '2022-11-21', 'X-409-2022', 16, 3, 1, 25, 2, 1, 1, 1, 1, 2, 2),
(1622182, 'Eilin Anaís Pérez Bascuñán', '2007-01-18', '22348673-8', 'Pasaje Hugo Besoain Pérez N° 02297', '2022-11-21', 'X-409-2022', 16, 3, 1, 8, 2, 1, 1, 1, 1, 11, 1),
(1635201, 'Jezreel Emanuel Guerra Bascuñán', '2018-06-02', '26304669-2', 'Pasaje Hugo Besoain Pérez N° 02297', '2022-11-21', 'X-409-2022', 16, 3, 1, 25, 2, 1, 1, 1, 1, 17, 2),
(1953622, 'Matias Ruiz Pinto', '2016-07-02', '25432492-2', 'El Recuerdo De Viluco, Sitio 18, Casa 3401', '2024-01-23', 'X-473-2023', 17, 5, 15, 1, 1, 1, 1, 1, 1, 2, 2),
(1944408, 'Agustin Gonzalez Diaz', '2006-02-08', '22052434-5', 'Pje. Orlando Gaita N° 472', '2023-08-31', 'X-697-2023', 18, 5, 3, 4, 4, 1, 1, 1, 1, 12, 2),
(1809945, 'Isabella Pizarro Cortés', '2012-07-13', '24008633-6', 'Villa Las Palmas, Pasaje Victoria Bannura Nº 1582 Camino Buin Maipo', '2022-05-13', 'X-149-2022', 19, 5, 8, 12, 4, 1, 2, 1, 1, 6, 1),
(1932049, 'Fernanda Contreras Llanos', '2011-03-04', '23577275-2', 'Los Buinenses 0459,Población Nuevo  Buin', '2023-07-25', 'P-533-2023', 20, 1, 3, 4, 4, 1, 1, 1, 1, 8, 1),
(1932048, 'Maite Contreras Llanos', '2016-01-30', '25275154-8', 'Los Buinenses 0459, Población Nuevo Buin', '2023-07-25', 'P-533-2023', 20, 1, 3, 4, 4, 1, 1, 1, 1, 3, 1),
(1877920, 'Maximiliano Allende Maureira', '2015-11-15', '25205227-5', 'Dragica Ciudad Pap 147, El Molino, Paradero 12, Maipo', '2023-11-14', 'X-474-2023', 21, 5, 1, 4, 7, 1, 7, 1, 1, 3, 2),
(1585286, 'Josefina Perez Pardo', '2009-03-03', '22965403-9', 'Los Magnolios N°259, Poblacion Arturo Prat, Localidad De Maipo', '2024-03-18', 'X-427-2023', 22, 3, 1, 26, 4, 1, 1, 1, 1, 9, 1),
(1873403, 'Amy Cabrera Castillo', '2012-06-01', '23969722-4', 'Los jacintos 160 Linderos', '2023-06-27', 'P-697-2022', 23, 1, 3, 6, 4, 1, 1, 1, 1, 6, 1),
(1854366, 'Micaela Carvajal Cartagena', '2007-01-07', '22301631-6', 'Calle los ciruelos sitio 18, La Estancilla', '2022-06-29', 'X-531-2023', 24, 1, 3, 6, 4, 1, 1, 1, 1, 12, 1),
(1954551, 'Pascual Viedma Silva', '2017-04-30', '25751966-K', 'Club Santa Adela 2104 Paradero 7', '2023-10-18', 'P-1049-2023', 25, 3, 1, 1, 2, 1, 1, 1, 1, 1, 2),
(1951333, 'Renato Keller Garrido', '2012-11-15', '24117336-4', 'Adan Guzman N°60, Villa José Miguel Carrera, Sector Alto Jahuel', '2024-01-16', 'X-92-2024', 26, 1, 5, 21, 4, 1, 1, 1, 1, 6, 2),
(1932294, 'Constanza Tamayo Gonzalez', '2008-01-31', '22629593-3', 'Calle El naranjal 0373 Villa Nuevo Buin', '2023-07-24', 'X-319-2022', 27, 1, 3, 8, 5, 1, 1, 1, 1, 10, 1),
(1920974, 'Florencia Ascui Rosales', '2009-11-18', '23174028-7', 'Camino Valdivia de Paine, parcela 20', '2023-05-29', 'X-137-2023', 28, 5, 7, 11, 2, 1, 2, 1, 1, 9, 1),
(1921691, 'Jorge Soto Zamorano', '2016-02-25', '25310620-4', 'Nicolás Encina 2033', '2023-06-28', 'X-440-2023', 29, 1, 16, 27, 1, 1, 1, 5, 1, 2, 2),
(1644595, 'Emilia Ortega Carreño', '2012-01-21', '23849776-0', 'Manuel Montt 1015', '2024-01-23', 'X-05-2023', 30, 3, 6, 4, 1, 1, 2, 1, 1, 7, 1),
(1952430, 'Camila Agudelo Arirama', '2018-07-21', '26383341-4', 'caracas 2237', '2023-08-31', 'X-309-2023', 31, 5, 12, 18, 5, 1, 1, 4, 2, 15, 1),
(1942541, 'Otilia Lopez Arirama', '2006-04-15', '27831275-5', 'caracas 2237', '2023-06-23', 'X-309-2023', 31, 5, 12, 19, 4, 1, 1, 4, 2, 11, 1),
(1942539, 'Shary Agudelo Arirama', '2012-07-20', '26869413-7', 'caracas 2237', '2023-06-23', 'X-309-2023', 31, 5, 12, 19, 4, 1, 1, 4, 2, 6, 1),
(1936870, 'Florencia Henriquez Romero', '2012-05-20', '23957306-1', 'Esperanza 349 Alto Jahuel', '2023-07-28', 'X-125-2024', 32, 1, 5, 10, 4, 1, 1, 1, 1, 7, 1),
(1920867, 'Augusta Cruz García', '2013-10-02', '24435490-4', 'Luis Eugenio Riquelme Pino 355, Casa 7', '2024-05-16', 'X-267-2023', 33, 3, 11, 16, 1, 1, 1, 1, 1, 3, 1),
(1920863, 'Dominga Cruz García', '2011-12-23', '23828946-7', 'Luis Eugenio Riquelme Pino 355, Casa 7', '2024-05-16', 'X-267-2023', 33, 3, 11, 16, 1, 1, 1, 1, 1, 5, 1),
(1920870, 'Milagros Cruz García', '2017-03-14', '25708058-7', 'Luis Eugenio Riquelme Pino 355, Casa 7', '2024-05-16', 'X-267-2023', 33, 3, 11, 16, 1, 1, 1, 1, 1, 17, 1),
(1929228, 'Antonella Becerra Alvarez', '2011-11-14', '23797305-4', 'Calle Joel Pérez Calderón N° 31 Villa José Miguel carrera, Alto Jahuel', '2023-07-27', 'X-539-2022', 34, 3, 5, 21, 4, 1, 1, 1, 1, 6, 1),
(1934498, 'Damian Agustín Sandoval Gómez', '2013-06-19', '24310261-8', 'Victoria Aguirre 680, Villa Cardenal Raúl Silva Henríquez', '2024-04-22', 'X-276-2023', 35, 5, 3, 17, 6, 1, 1, 1, 1, 5, 2),
(1934495, 'Helena Mía Sandoval Gómez', '2018-09-09', '26465340-1', 'Victoria Aguirre 680, Villa Cardenal Raúl Silva Henríquez', '2024-04-22', 'X-276-2023', 35, 5, 3, 17, 6, 1, 1, 1, 1, 16, 1),
(1889875, 'Dylan Marambio Mancilla', '2016-01-09', '25250909-7', 'Avda. Bernardo O¨Higgins N°355', '2023-06-27', 'X-377-2022', 36, 1, 3, 4, 4, 1, 1, 1, 1, 3, 2),
(1848825, 'Marianela Cespedes Catalan', '2007-05-02', '22391931-6', 'Horacio Fernández casa 31 villa José Miguel Carrera- Alto Jahuel', '2023-06-12', 'X-42-2023', 37, 5, 5, 4, 4, 1, 1, 1, 1, 11, 1),
(1776238, 'Luis Sulca Huaman', '2011-08-29', '23732855-8', 'Luciano Cruz Aguayo 641, Villa Los Hidalgos', '2023-08-31', 'X-20-2023', 38, 5, 3, 4, 1, 1, 1, 1, 1, 7, 2),
(1274199, 'Estrella Leyton Cordova', '2010-09-02', '23418205-6', 'Pasaje Esperanza N° 368, Villa Miraflores, Alto Jahuel', '2023-02-28', 'X-25-2022', 39, 3, 3, 1, 8, 1, 1, 1, 1, 8, 1),
(1712796, 'Cristina Belén Guzmán Carvajal', '2006-07-09', '22163376-8', 'Pasaje El Raleo 01421, Nuevo Buin', '2022-04-20', 'X-330-2019', 40, 5, 3, 10, 2, 1, 2, 1, 1, 12, 1),
(1793402, 'Darlin María Camilla Rubio', '2016-01-31', '25273281-0', 'Juan Castro Acuña 1762', '2021-11-05', 'X-8-2020', 41, 3, 15, 29, 4, 1, 1, 2, 1, 3, 1),
(1839808, 'Gabriela Rodríguez Hernández', '2006-11-11', '22259240-2', 'Manuel Rodríguez 865, Buin', '2022-05-09', 'X-324-2022', 42, 5, 3, 6, 4, 1, 1, 1, 1, 12, 1),
(1377947, 'Antonela Arciego Pavez', '2011-05-09', '23644016-8', 'Juan Linsay 1572, Viñas De Buin 1', '2024-02-13', 'X-376-2023', 43, 5, 3, 4, 4, 1, 5, 1, 1, 7, 1),
(1506141, 'Angel Perez Campos', '2015-11-08', '25185227-8', 'Delicias De Viluco, Sitio 17', '2024-02-08', 'X-245-2014', 44, 1, 2, 3, 1, 1, 5, 1, 1, 3, 2),
(1499289, 'Angelo Perez Campos', '2014-10-07', '24762817-7', 'Delicias De Viluco, Sitio 17', '2024-02-08', 'X-245-2014', 44, 1, 2, 3, 1, 1, 5, 1, 1, 4, 2),
(1307767, 'Mabel Soto Herrera', '2008-09-29', '22832494-9', 'Camino Padre Hurtado 9380', '2023-06-28', 'X-196-2024', 45, 1, 9, 13, 4, 3, 9, 1, 1, 10, 1),
(1856067, 'Abraham Sanhueza Araya', '2014-06-04', '24645589-9', 'Calle Ramón Antonio Romero 873 villa Los Hidalgos', '2023-07-24', 'X-319-2022', 46, 1, 13, 20, 1, 1, 1, 1, 1, 4, 2),
(1930351, 'Mateo Torres Rodriguez', '2018-11-08', '26563108-8', 'Eduardo Aravena Cofré 2053', '2023-07-24', 'X-226-2023', 47, 5, 3, 14, 5, 1, 1, 1, 1, 15, 2),
(1921785, 'Martina Araya Ponce', '2016-01-12', '25260722-6', 'Bernardino Bravo N°167', '2023-06-27', 'X-166-2023', 48, 5, 3, 7, 4, 1, 1, 1, 1, 3, 1),
(1927459, 'Martina Acevedo Contreras', '2006-02-23', '22059786-5', 'Parcela 22 A, Sitio 47 Km 4, Lo Cerrillos, Linderos', '2023-11-14', 'P-1520-2022', 49, 5, 3, 4, 1, 1, 10, 1, 1, 10, 1),
(1920702, 'Josue Riquelme Caru', '2017-08-24', '25879958-5', 'El Vicario 213, villa Campanario Maipo', '2024-01-22', 'x-367-2019', 50, 5, 3, 5, 1, 1, 1, 1, 1, 1, 2),
(1947416, 'Simon Ernesto Leonard López', '2012-10-26', '24100588-7', 'Guillermo Sandoval 753, Villaseca', '2023-10-31', 'P-928-2023', 51, 5, 3, 4, 1, 1, 1, 1, 1, 5, 1),
(1880214, 'Joaquín Roberto Martinez Aguilera', '2011-11-23', '23804790-0', 'Las Pataguas, Parcela 19, Valdivia De Paine', '2022-09-01', 'X-259-2022', 52, 3, 10, 15, 1, 1, 1, 1, 1, 7, 2),
(1830838, 'Jade Isabel Katara Quezada Melgarejo', '2010-02-05', '23244856-3', 'Calle Dragica Ciudad Pap 171, Villa El Molino, Maipo', '2022-06-10', 'X-361-2021', 53, 1, 3, 4, 1, 1, 1, 1, 1, 7, 1),
(1891942, 'Pablo Alexander Audala Soto', '2012-01-11', '24162304-1', 'Francisco Javier Krugger N° 1285', '2024-03-08', 'X-66-2023', 54, 5, 5, 21, 8, 1, 1, 1, 1, 6, 2),
(1736331, 'Paz Molina Sepulveda', '2017-03-18', '25713780-5', 'Padre Hugo Rios 73, Villa Padre Hurtado', '2023-06-30', 'X-186-2020', 55, 1, 3, 5, 4, 1, 1, 1, 1, 2, 1),
(1736322, 'Elena Molina Sepulveda', '2014-01-13', '24510027-2', 'Padre Hugo Rios 73, Villa Padre Hurtado', '2023-06-30', 'X-186-2020', 55, 1, 3, 5, 4, 1, 1, 1, 1, 4, 1),
(1736329, 'Isidora Molina Sepulveda', '2019-02-11', '26706064-9', 'Padre Hugo Rios 73, Villa Padre Hurtado', '2023-06-30', 'X-186-2020', 55, 1, 3, 5, 4, 1, 1, 1, 1, 15, 1),
(1932323, 'Agustina Caruz Villegas', '2009-05-01', '23009897-2', 'Ohiggins 936 Villa Los Ciruelos', '2023-07-26', 'P-536-2023', 56, 5, 4, 6, 4, 1, 3, 1, 1, 8, 1),
(1952276, 'Pascuala Agusta Lunas Caru', '2019-03-07', '26735969-5', 'La Alborada, Sitio 13, Camino Valdivia De Paine', '2024-04-24', 'X-402-2023', 57, 5, 3, 24, 8, 1, 1, 1, 1, 17, 1),
(1259730, 'Emilia Muñoz Muñoz', '2011-07-30', '23707280-4', 'pasaje Enrique Chacón 524 VIlla Tierras del Maipo', '2023-07-24', 'P-488-2023', 58, 1, 1, 5, 2, 1, 5, 1, 1, 7, 1),
(1968470, 'Ignacia Antonela Maureira Hidalgo', '2012-02-20', '23881461-8', 'Carlos Strutz 160, población Arturo Prat', '2024-07-15', 'X-138-2024', 59, 5, 3, 30, 4, 1, 1, 1, 1, 7, 1);

INSERT INTO informes (nna_id, numero, informe_ps, informe_ts) VALUES
(1006016, 2, FALSE, FALSE),
(1259730, 4, FALSE, FALSE),
(1269012, 4, FALSE, FALSE),
(1269022, 4, FALSE, FALSE),
(1274199, 6, FALSE, FALSE),
(1294350, 4, FALSE, FALSE),
(1307767, 4, FALSE, FALSE),
(1377947, 1, FALSE, FALSE),
(1499289, 2, FALSE, FALSE),
(1506141, 2, FALSE, FALSE),
(1560615, 3, FALSE, FALSE),
(1560629, 3, FALSE, FALSE),
(1585286, 2, FALSE, FALSE),
(1622159, 7, FALSE, FALSE),
(1622182, 7, FALSE, FALSE),
(1628256, 3, FALSE, FALSE),
(1635201, 7, FALSE, FALSE),
(1644595, 2, FALSE, FALSE),
(1678032, 1, FALSE, FALSE),
(1705967, 6, FALSE, FALSE),
(1712796, 9, FALSE, FALSE),
(1735658, 2, FALSE, FALSE),
(1736322, 5, FALSE, FALSE),
(1736329, 5, FALSE, FALSE),
(1736331, 4, FALSE, FALSE),
(1776238, 4, FALSE, FALSE),
(1781128, 4, FALSE, FALSE),
(1793402, 11, FALSE, FALSE),
(1797740, 2, FALSE, FALSE),
(1797746, 2, FALSE, FALSE),
(1809945, 9, FALSE, FALSE),
(1830838, 8, FALSE, FALSE),
(1839808, 9, FALSE, FALSE),
(1840841, 5, FALSE, FALSE),
(1848825, 5, FALSE, FALSE),
(1854366, 8, FALSE, FALSE),
(1856067, 4, FALSE, FALSE),
(1873403, 4, FALSE, FALSE),
(1877002, 2, FALSE, FALSE),
(1877920, 2, FALSE, FALSE),
(1880214, 7, FALSE, FALSE),
(1889875, 4, FALSE, FALSE),
(1891942, 1, FALSE, FALSE),
(1920702, 2, FALSE, FALSE),
(1920863, 1, FALSE, FALSE),
(1920867, 1, FALSE, FALSE),
(1920870, 1, FALSE, FALSE),
(1920974, 5, FALSE, FALSE),
(1921691, 4, FALSE, FALSE),
(1921785, 4, FALSE, FALSE),
(1926721, 1, FALSE, FALSE),
(1927459, 2, FALSE, FALSE),
(1927712, 1, FALSE, FALSE),
(1927721, 1, FALSE, FALSE),
(1929228, 4, FALSE, FALSE),
(1930351, 5, FALSE, FALSE),
(1932048, 4, FALSE, FALSE),
(1932049, 4, FALSE, FALSE),
(1932294, 4, FALSE, FALSE),
(1932323, 4, FALSE, FALSE),
(1934495, 1, FALSE, FALSE),
(1934498, 1, FALSE, FALSE),
(1936870, 4, FALSE, FALSE),
(1937672, 1, FALSE, FALSE),
(1942539, 5, FALSE, FALSE),
(1942541, 5, FALSE, FALSE),
(1944408, 3, FALSE, FALSE),
(1947413, 2, FALSE, FALSE),
(1947416, 3, FALSE, FALSE),
(1951333, 2, FALSE, FALSE),
(1952276, 1, FALSE, FALSE),
(1952430, 4, FALSE, FALSE),
(1953622, 2, FALSE, FALSE),
(1954551, 3, FALSE, FALSE),
(1965676, 3, FALSE, FALSE);

ALTER TABLE informes
  ADD CONSTRAINT fk_informe_nna
  FOREIGN KEY (nna_id)
  REFERENCES nna(id)
  ON DELETE CASCADE;

ALTER TABLE adulto
  ADD CONSTRAINT fk_informe_nna
  FOREIGN KEY (ts_id)
  REFERENCES profesional(id)
  ON DELETE CASCADE;

  UPDATE nna SET larga_permanencia = false;

  UPDATE nna SET prorroga = '2024-11-21' WHERE id = 1622159;
  UPDATE nna SET prorroga = '2024-07-09' WHERE id = 1712796;
  UPDATE nna SET prorroga = '2024-08-21' WHERE id = 1622182;
  UPDATE nna SET prorroga = '2024-08-10' WHERE id = 1274199;
  UPDATE nna SET prorroga = '2024-11-28' WHERE id = 1920974;
  UPDATE nna SET prorroga = '2024-11-11' WHERE id = 1839808;
  UPDATE nna SET prorroga = '2024-09-10' WHERE id = 1830838;
  UPDATE nna SET prorroga = '2024-11-21' WHERE id = 1635201;
  UPDATE nna SET prorroga = '2024-06-30' WHERE id = 1880214;
  UPDATE nna SET prorroga = '2024-06-30' WHERE id = 1854366;
  UPDATE nna SET prorroga = '2024-08-26' WHERE id = 1705967;

ALTER TABLE profesional ADD COLUMN email VARCHAR(60);
UPDATE profesional SET email = 'melissa.pulgar@fundaciondem.cl' WHERE id = 1;
UPDATE profesional SET email = 'marianela.riquelme@fundaciondem.cl' WHERE id = 2;
UPDATE profesional SET email = 'enzo.montecinos@fundaciondem.cl' WHERE id = 3;
UPDATE profesional SET email = 'angela.oyarzun@fundaciondem.cl' WHERE id = 4;
UPDATE profesional SET email = 'marcela.castro@fundaciondem.cl' WHERE id = 5;
UPDATE profesional SET email = 'natalia.navarro@fundaciondem.cl' WHERE id = 6;
UPDATE profesional SET email = 'esteban.olivares@fundaciondem.cl' WHERE id = 7;
