-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Versión del servidor:         10.4.11-MariaDB - mariadb.org binary distribution
-- SO del servidor:              Win64
-- HeidiSQL Versión:             10.3.0.5771
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


-- Volcando estructura de base de datos para project_carga_academica
CREATE DATABASE IF NOT EXISTS `project_carga_academica` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `project_carga_academica`;

-- Volcando estructura para tabla project_carga_academica.asignaturas
CREATE TABLE IF NOT EXISTS `asignaturas` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) NOT NULL,
  `creditos` int(11) NOT NULL,
  `semestre` varchar(50) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_asignaturas_horas_semestre` (`creditos`),
  CONSTRAINT `FK_asignaturas_horas_semestre` FOREIGN KEY (`creditos`) REFERENCES `horas_semestre` (`id`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Volcando datos para la tabla project_carga_academica.asignaturas: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `asignaturas` DISABLE KEYS */;
/*!40000 ALTER TABLE `asignaturas` ENABLE KEYS */;

-- Volcando estructura para tabla project_carga_academica.cargos
CREATE TABLE IF NOT EXISTS `cargos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

-- Volcando datos para la tabla project_carga_academica.cargos: ~4 rows (aproximadamente)
/*!40000 ALTER TABLE `cargos` DISABLE KEYS */;
INSERT INTO `cargos` (`id`, `nombre`) VALUES
	(1, 'Vice-Académica'),
	(2, 'Director(a) Facultad'),
	(3, 'Administrador'),
	(4, 'Docente');
/*!40000 ALTER TABLE `cargos` ENABLE KEYS */;

-- Volcando estructura para tabla project_carga_academica.facultades
CREATE TABLE IF NOT EXISTS `facultades` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

-- Volcando datos para la tabla project_carga_academica.facultades: ~4 rows (aproximadamente)
/*!40000 ALTER TABLE `facultades` DISABLE KEYS */;
INSERT INTO `facultades` (`id`, `nombre`) VALUES
	(1, 'FACI'),
	(2, 'FACS'),
	(3, 'FACA'),
	(4, 'FACSA');
/*!40000 ALTER TABLE `facultades` ENABLE KEYS */;

-- Volcando estructura para tabla project_carga_academica.horas_semestre
CREATE TABLE IF NOT EXISTS `horas_semestre` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `creditos` int(11) NOT NULL,
  `horas_programas` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Volcando datos para la tabla project_carga_academica.horas_semestre: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `horas_semestre` DISABLE KEYS */;
/*!40000 ALTER TABLE `horas_semestre` ENABLE KEYS */;

-- Volcando estructura para tabla project_carga_academica.periodos
CREATE TABLE IF NOT EXISTS `periodos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `anualidad` int(11) NOT NULL,
  `periodo` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Volcando datos para la tabla project_carga_academica.periodos: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `periodos` DISABLE KEYS */;
/*!40000 ALTER TABLE `periodos` ENABLE KEYS */;

-- Volcando estructura para tabla project_carga_academica.permisos
CREATE TABLE IF NOT EXISTS `permisos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `modulo` varchar(50) NOT NULL,
  `p_crear` varchar(50) NOT NULL,
  `p_modificar` varchar(50) NOT NULL,
  `p_eliminar` varchar(50) NOT NULL,
  `id_cargo` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_permisos_cargos` (`id_cargo`),
  CONSTRAINT `FK_permisos_cargos` FOREIGN KEY (`id_cargo`) REFERENCES `cargos` (`id`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Volcando datos para la tabla project_carga_academica.permisos: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `permisos` DISABLE KEYS */;
/*!40000 ALTER TABLE `permisos` ENABLE KEYS */;

-- Volcando estructura para tabla project_carga_academica.plan_estudio
CREATE TABLE IF NOT EXISTS `plan_estudio` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_asignatura` int(11) NOT NULL,
  `id_docente` int(11) NOT NULL,
  `jornada` varchar(50) DEFAULT NULL,
  `programa1` int(11) NOT NULL,
  `programa2` int(11) DEFAULT NULL,
  `hrs_semestral` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_plan_estudio_asignaturas` (`id_asignatura`),
  KEY `FK_plan_estudio_usuarios` (`id_docente`),
  KEY `FK_plan_estudio_programas` (`programa1`),
  KEY `FK_plan_estudio_programas_2` (`programa2`),
  CONSTRAINT `FK_plan_estudio_asignaturas` FOREIGN KEY (`id_asignatura`) REFERENCES `asignaturas` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `FK_plan_estudio_programas` FOREIGN KEY (`programa1`) REFERENCES `programas` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `FK_plan_estudio_programas_2` FOREIGN KEY (`programa2`) REFERENCES `programas` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `FK_plan_estudio_usuarios` FOREIGN KEY (`id_docente`) REFERENCES `usuarios` (`id`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Volcando datos para la tabla project_carga_academica.plan_estudio: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `plan_estudio` DISABLE KEYS */;
/*!40000 ALTER TABLE `plan_estudio` ENABLE KEYS */;

-- Volcando estructura para tabla project_carga_academica.programas
CREATE TABLE IF NOT EXISTS `programas` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) NOT NULL,
  `id_facultad` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_programas_facultades` (`id_facultad`),
  CONSTRAINT `FK_programas_facultades` FOREIGN KEY (`id_facultad`) REFERENCES `facultades` (`id`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Volcando datos para la tabla project_carga_academica.programas: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `programas` DISABLE KEYS */;
/*!40000 ALTER TABLE `programas` ENABLE KEYS */;

-- Volcando estructura para tabla project_carga_academica.tipo_contrato
CREATE TABLE IF NOT EXISTS `tipo_contrato` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) NOT NULL,
  `hr_clase` varchar(50) NOT NULL,
  `hr_institucionales` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

-- Volcando datos para la tabla project_carga_academica.tipo_contrato: ~3 rows (aproximadamente)
/*!40000 ALTER TABLE `tipo_contrato` DISABLE KEYS */;
INSERT INTO `tipo_contrato` (`id`, `nombre`, `hr_clase`, `hr_institucionales`) VALUES
	(1, 'Tiempo Completo', '24', '24'),
	(2, 'Medio Tiempo', '24', '0'),
	(3, 'Catedratico', '12', '0');
/*!40000 ALTER TABLE `tipo_contrato` ENABLE KEYS */;

-- Volcando estructura para tabla project_carga_academica.usuarios
CREATE TABLE IF NOT EXISTS `usuarios` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombres` varchar(100) NOT NULL,
  `apellidos` varchar(100) NOT NULL,
  `facultad` int(11) NOT NULL,
  `perfil_docente` text NOT NULL,
  `tipo_contrato` int(11) NOT NULL,
  `id_cargo` int(11) NOT NULL,
  `identidad` varchar(100) NOT NULL,
  `password` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_usuarios_tipo_contrato` (`tipo_contrato`),
  KEY `FK_usuarios_cargos` (`id_cargo`),
  KEY `FK_usuarios_facultades` (`facultad`),
  CONSTRAINT `FK_usuarios_cargos` FOREIGN KEY (`id_cargo`) REFERENCES `cargos` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `FK_usuarios_facultades` FOREIGN KEY (`facultad`) REFERENCES `facultades` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `FK_usuarios_tipo_contrato` FOREIGN KEY (`tipo_contrato`) REFERENCES `tipo_contrato` (`id`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

-- Volcando datos para la tabla project_carga_academica.usuarios: ~1 rows (aproximadamente)
/*!40000 ALTER TABLE `usuarios` DISABLE KEYS */;
INSERT INTO `usuarios` (`id`, `nombres`, `apellidos`, `facultad`, `perfil_docente`, `tipo_contrato`, `id_cargo`, `identidad`, `password`) VALUES
	(1, 'Ronaldo Aldair', 'Sinning Montero', 1, 'Que te importa', 2, 3, '1102872306', '');
/*!40000 ALTER TABLE `usuarios` ENABLE KEYS */;

-- Volcando estructura para tabla project_carga_academica.versiones
CREATE TABLE IF NOT EXISTS `versiones` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `num_version` varchar(50) NOT NULL,
  `fecha_creacion` timestamp NOT NULL DEFAULT current_timestamp(),
  `fecha_edicion` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `id_plan` int(11) DEFAULT NULL,
  `periodo` int(11) DEFAULT NULL,
  `estado` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_versiones_plan_estudio` (`id_plan`),
  KEY `FK_versiones_periodos` (`periodo`),
  CONSTRAINT `FK_versiones_periodos` FOREIGN KEY (`periodo`) REFERENCES `periodos` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `FK_versiones_plan_estudio` FOREIGN KEY (`id_plan`) REFERENCES `plan_estudio` (`id`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Volcando datos para la tabla project_carga_academica.versiones: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `versiones` DISABLE KEYS */;
/*!40000 ALTER TABLE `versiones` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
