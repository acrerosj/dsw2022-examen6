-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Servidor: db
-- Tiempo de generación: 27-01-2023 a las 13:24:36
-- Versión del servidor: 8.0.30
-- Versión de PHP: 8.0.19

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `fct`
--
CREATE DATABASE IF NOT EXISTS `fct` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci;
USE `fct`;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `choices`
--

CREATE TABLE `choices` (
  `id` int NOT NULL,
  `user_id` int NOT NULL,
  `company_id` int NOT NULL,
  `created_at` timestamp NOT NULL,
  `updated_at` timestamp NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `companies`
--

CREATE TABLE `companies` (
  `id` int NOT NULL,
  `name` varchar(40) COLLATE utf8mb4_spanish_ci NOT NULL,
  `url` varchar(100) COLLATE utf8mb4_spanish_ci NOT NULL,
  `mode` varchar(20) COLLATE utf8mb4_spanish_ci NOT NULL,
  `description` varchar(200) COLLATE utf8mb4_spanish_ci NOT NULL,
  `created_at` timestamp NOT NULL,
  `updated_at` timestamp NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;

--
-- Volcado de datos para la tabla `companies`
--

INSERT INTO `companies` (`id`, `name`, `url`, `mode`, `description`, `created_at`, `updated_at`) VALUES
(1, 'ATOS', 'https://atos.net/es/spain ', 'online', 'Desarrollo de aplicaciones a grandes empresas. Muy variadas dependiendo del proyecto.Java Spring, React / Angular,...\r\n', '2023-01-27 13:07:49', '2023-01-27 13:07:49'),
(2, 'Lean Mind', 'https://leanmind.es/es/', 'online', 'Desarrollo de aplicaciones y asesoramiento a empresas de desarrollo. Software de calidad, principios de diseño, patrones, BDD, TDD, DDD, Typescript.\r\n', '2023-01-27 13:07:49', '2023-01-27 13:07:49'),
(3, 'CodeBay', 'https://www.codebay-innovation.com/es/inicio/', 'semipresencial', 'Desarrollo de portales a grandes empresas\r\nCMS específico de Adobe.', '2023-01-27 13:09:57', '2023-01-27 13:09:57'),
(4, 'Ayuntamiento de Adeje', 'https://www.adeje.es/', 'presencial', 'Gestión municipal. Desarrollo de aplicaciones propias.\r\n', '2023-01-27 13:09:57', '2023-01-27 13:09:57'),
(5, 'STV', 'http://stvcanarias.com/ ', 'presencial', 'Distribución y reparación de máquinas de vending. Desarrollo de aplicaciones propias para la gestión de las reparaciones, etc.\r\n', '2023-01-27 13:11:36', '2023-01-27 13:11:36'),
(6, 'GOWEB', 'https://www.goweb.es/', 'presencial', 'Mantenimiento tecnológico y desarrollo software Wordpress.\r\n', '2023-01-27 13:11:36', '2023-01-27 13:11:36'),
(7, 'Akrolih', 'https://akrolih.com/', 'online', 'Asesoramiento, sitio web, comercio electrónico, CMS: Wordpress, PrestaShop (Modificar módulos) CRM a medida. Laravel\r\nSEO y marketing\r\n', '2023-01-27 13:13:03', '2023-01-27 13:13:03'),
(8, 'Medano Solution', 'https://medanosol.es/es', 'online', 'Desarrollo de WebApp. React, typescript, tailwind, mongo, docker, graphQL\r\n', '2023-01-27 13:13:03', '2023-01-27 13:13:03'),
(9, 'Conectatec', 'https://www.conectatec.com/ ', 'presencial', 'Innovación y marketing para hoteles. Desarrollo y mantenimiento de Webs, WebApps.', '2023-01-27 13:16:30', '2023-01-27 13:16:30'),
(10, 'Blue Grow', 'https://thebluegrow.com/', 'online', 'Presencia Web y posicionamiento. Estrategias de marketing. Wordpress / Elementor / Plugins\r\nSEO y marketing Diseño web.\r\n', '2023-01-27 13:16:30', '2023-01-27 13:16:30'),
(11, 'Nexo365', 'https://nexo365.com', 'presencial', 'Instalación y mantenimiento de alarmas, seguridad, TPV. Desarrollo de App propia (CRM)\r\n', '2023-01-27 13:17:58', '2023-01-27 13:17:58'),
(12, 'Turitop', 'https://www.turitop.com/es/', 'online', 'Presencia Web y posicionamiento. Gestión de reserva de eventos. Wordpress / Módulos propios\r\n', '2023-01-27 13:17:58', '2023-01-27 13:17:58');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `users`
--

CREATE TABLE `users` (
  `id` int NOT NULL,
  `name` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci NOT NULL,
  `password` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci NOT NULL,
  `profesor` tinyint(1) NOT NULL,
  `created_at` timestamp NOT NULL,
  `updated_at` timestamp NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;

--
-- Volcado de datos para la tabla `users`
--

INSERT INTO `users` (`id`, `name`, `password`, `profesor`, `created_at`, `updated_at`) VALUES
(1, 'Andrés', '123', 1, '2023-01-26 16:45:22', '2023-01-26 16:45:22'),
(2, 'Julio', '123', 0, '2023-01-26 16:45:22', '2023-01-26 16:45:22'),
(3, 'Diogo', '123', 0, '2023-01-27 12:54:18', '2023-01-27 12:54:18'),
(4, 'Junjie', '123', 0, '2023-01-27 12:54:18', '2023-01-27 12:54:18'),
(5, 'Eduardo', '123', 0, '2023-01-27 12:55:04', '2023-01-27 12:55:04'),
(6, 'Alberto', '123', 0, '2023-01-27 12:55:04', '2023-01-27 12:55:04'),
(7, 'Héctor', '123', 0, '2023-01-27 12:55:39', '2023-01-27 12:55:39'),
(8, 'Roberto', '123', 0, '2023-01-27 12:55:39', '2023-01-27 12:55:39'),
(9, 'Favio', '123', 0, '2023-01-27 12:56:01', '2023-01-27 12:56:01'),
(10, 'Brian', '123', 0, '2023-01-27 12:56:01', '2023-01-27 12:56:01'),
(11, 'Jonás', '123', 0, '2023-01-27 12:56:27', '2023-01-27 12:56:27'),
(12, 'Adrián', '123', 0, '2023-01-27 12:56:27', '2023-01-27 12:56:27'),
(13, 'Naya', '123', 0, '2023-01-27 12:56:50', '2023-01-27 12:56:50'),
(14, 'Manuel', '123', 0, '2023-01-27 12:56:50', '2023-01-27 12:56:50'),
(15, 'Iván', '123', 0, '2023-01-27 12:57:49', '2023-01-27 12:57:49'),
(16, 'Alejandro', '123', 0, '2023-01-27 12:57:49', '2023-01-27 12:57:49'),
(17, 'Álvaro', '123', 0, '2023-01-27 12:57:49', '2023-01-27 12:57:49'),
(18, 'Elena', '123', 1, '2023-01-27 13:00:39', '2023-01-27 13:00:39'),
(19, 'Eva', '123', 1, '2023-01-27 13:00:39', '2023-01-27 13:00:39'),
(20, 'Adalberto', '123', 1, '2023-01-27 13:00:39', '2023-01-27 13:00:39'),
(21, 'César', '123', 1, '2023-01-27 13:00:39', '2023-01-27 13:00:39');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `choices`
--
ALTER TABLE `choices`
  ADD PRIMARY KEY (`id`),
  ADD KEY `choice_company` (`company_id`),
  ADD KEY `choice_user` (`user_id`);

--
-- Indices de la tabla `companies`
--
ALTER TABLE `companies`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `choices`
--
ALTER TABLE `choices`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `companies`
--
ALTER TABLE `companies`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT de la tabla `users`
--
ALTER TABLE `users`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `choices`
--
ALTER TABLE `choices`
  ADD CONSTRAINT `choice_company` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `choice_user` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
