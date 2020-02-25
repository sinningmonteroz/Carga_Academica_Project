-- phpMyAdmin SQL Dump
-- version 5.0.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 25-02-2020 a las 23:00:10
-- Versión del servidor: 10.4.11-MariaDB
-- Versión de PHP: 7.3.14

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `project_carga_academica`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `asignaturas`
--

CREATE TABLE `asignaturas` (
  `id` int(11) NOT NULL,
  `nombre` varchar(50) NOT NULL,
  `creditos` varchar(50) NOT NULL,
  `semestre` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cargos`
--

CREATE TABLE `cargos` (
  `id` int(11) NOT NULL,
  `nombre` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `facultades`
--

CREATE TABLE `facultades` (
  `id` int(11) NOT NULL,
  `nombre` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `periodos`
--

CREATE TABLE `periodos` (
  `id` int(11) NOT NULL,
  `anualidad` int(11) NOT NULL,
  `periodo` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `permisos`
--

CREATE TABLE `permisos` (
  `id` int(11) NOT NULL,
  `modulo` varchar(50) NOT NULL,
  `p_crear` varchar(50) NOT NULL,
  `p_modificar` varchar(50) NOT NULL,
  `p_eliminar` varchar(50) NOT NULL,
  `id_cargo` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `plan_estudio`
--

CREATE TABLE `plan_estudio` (
  `id` int(11) NOT NULL,
  `id_asignatura` int(11) NOT NULL,
  `id_docente` int(11) NOT NULL,
  `jornada` varchar(50) DEFAULT NULL,
  `programa1` int(11) NOT NULL,
  `programa2` int(11) DEFAULT NULL,
  `hrs_semestral` varchar(50) DEFAULT NULL,
  `version` varchar(50) NOT NULL,
  `fecha_hora` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `tipo_vista` varchar(50) DEFAULT NULL,
  `periodo` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `programas`
--

CREATE TABLE `programas` (
  `id` int(11) NOT NULL,
  `nombre` varchar(50) NOT NULL,
  `id_facultad` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipo_contrato`
--

CREATE TABLE `tipo_contrato` (
  `id` int(11) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `hr_clase` varchar(50) NOT NULL,
  `hr_institucionales` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

CREATE TABLE `usuarios` (
  `id` int(11) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `facultad` int(11) NOT NULL,
  `perfil_docente` text NOT NULL,
  `tipo_contrato` int(11) NOT NULL,
  `id_cargo` int(11) NOT NULL,
  `identidad` varchar(100) NOT NULL,
  `password` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `versiones`
--

CREATE TABLE `versiones` (
  `id` int(11) NOT NULL,
  `num_version` varchar(50) NOT NULL,
  `fecha_creacion` timestamp NOT NULL DEFAULT current_timestamp(),
  `fecha_edicion` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `asignaturas`
--
ALTER TABLE `asignaturas`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `cargos`
--
ALTER TABLE `cargos`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `facultades`
--
ALTER TABLE `facultades`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `periodos`
--
ALTER TABLE `periodos`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `permisos`
--
ALTER TABLE `permisos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK_permisos_cargos` (`id_cargo`);

--
-- Indices de la tabla `plan_estudio`
--
ALTER TABLE `plan_estudio`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK_plan_estudio_asignaturas` (`id_asignatura`),
  ADD KEY `FK_plan_estudio_usuarios` (`id_docente`),
  ADD KEY `FK_plan_estudio_programas` (`programa1`),
  ADD KEY `FK_plan_estudio_programas_2` (`programa2`),
  ADD KEY `FK_plan_estudio_periodos` (`periodo`);

--
-- Indices de la tabla `programas`
--
ALTER TABLE `programas`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK_programas_facultades` (`id_facultad`);

--
-- Indices de la tabla `tipo_contrato`
--
ALTER TABLE `tipo_contrato`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK_usuarios_tipo_contrato` (`tipo_contrato`),
  ADD KEY `FK_usuarios_cargos` (`id_cargo`);

--
-- Indices de la tabla `versiones`
--
ALTER TABLE `versiones`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `asignaturas`
--
ALTER TABLE `asignaturas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `cargos`
--
ALTER TABLE `cargos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `facultades`
--
ALTER TABLE `facultades`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `periodos`
--
ALTER TABLE `periodos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `permisos`
--
ALTER TABLE `permisos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `plan_estudio`
--
ALTER TABLE `plan_estudio`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `programas`
--
ALTER TABLE `programas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `tipo_contrato`
--
ALTER TABLE `tipo_contrato`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `versiones`
--
ALTER TABLE `versiones`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `permisos`
--
ALTER TABLE `permisos`
  ADD CONSTRAINT `FK_permisos_cargos` FOREIGN KEY (`id_cargo`) REFERENCES `cargos` (`id`) ON UPDATE CASCADE;

--
-- Filtros para la tabla `plan_estudio`
--
ALTER TABLE `plan_estudio`
  ADD CONSTRAINT `FK_plan_estudio_asignaturas` FOREIGN KEY (`id_asignatura`) REFERENCES `asignaturas` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_plan_estudio_periodos` FOREIGN KEY (`periodo`) REFERENCES `periodos` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_plan_estudio_programas` FOREIGN KEY (`programa1`) REFERENCES `programas` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_plan_estudio_programas_2` FOREIGN KEY (`programa2`) REFERENCES `programas` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_plan_estudio_usuarios` FOREIGN KEY (`id_docente`) REFERENCES `usuarios` (`id`) ON UPDATE CASCADE;

--
-- Filtros para la tabla `programas`
--
ALTER TABLE `programas`
  ADD CONSTRAINT `FK_programas_facultades` FOREIGN KEY (`id_facultad`) REFERENCES `facultades` (`id`) ON UPDATE CASCADE;

--
-- Filtros para la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD CONSTRAINT `FK_usuarios_cargos` FOREIGN KEY (`id_cargo`) REFERENCES `cargos` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_usuarios_tipo_contrato` FOREIGN KEY (`tipo_contrato`) REFERENCES `tipo_contrato` (`id`) ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
