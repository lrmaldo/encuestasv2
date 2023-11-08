-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1:3306
-- Tiempo de generación: 16-10-2023 a las 19:43:15
-- Versión del servidor: 8.0.31
-- Versión de PHP: 7.4.33

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `encuestasv2`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `datos_generales`
--

DROP TABLE IF EXISTS `datos_generales`;
CREATE TABLE IF NOT EXISTS `datos_generales` (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `genero` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `edad` int DEFAULT NULL,
  `domicilio` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `ciudad` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `cp` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `telefono` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `celular` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `usuario_id` int UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `datos_generales_usuario_id_foreign` (`usuario_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `datos_generales`
--

INSERT INTO `datos_generales` (`id`, `genero`, `edad`, `domicilio`, `ciudad`, `cp`, `telefono`, `celular`, `usuario_id`, `created_at`, `updated_at`) VALUES
(4, 'Masculino', 29, '1 de mayo num 74', 'Ciudad', '68373', NULL, '2871811810', 7, '2023-09-13 16:17:22', '2023-09-13 16:17:22');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `encuestas`
--

DROP TABLE IF EXISTS `encuestas`;
CREATE TABLE IF NOT EXISTS `encuestas` (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `titulo` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `descripcion` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` tinyint DEFAULT '0',
  `tipo_encuesta_id` int UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `encuestas_tipo_encuesta_id_foreign` (`tipo_encuesta_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `encuestas`
--

INSERT INTO `encuestas` (`id`, `titulo`, `descripcion`, `status`, `tipo_encuesta_id`, `created_at`, `updated_at`) VALUES
(1, 'PROGRAMA DE SEGUIMIENTO DE EGRESADOS', 'Gracias por tomar el tiempo para contestar el cuestionario que será de gran utilidad\r\npara el Instituto y en especial para el programa del cual Usted egresó', 1, 1, '2023-09-07 18:54:03', '2023-09-07 18:54:03'),
(2, 'Encuesta a empleadores', 'Gracias por tomar el tiempo para contestar el cuestionario que será de gran utilidad\r\npara el Instituto y en especial para el programa del cual Usted egresó', 1, 2, '2023-09-07 23:02:12', '2023-09-07 23:02:12');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `encuesta_usuarios`
--

DROP TABLE IF EXISTS `encuesta_usuarios`;
CREATE TABLE IF NOT EXISTS `encuesta_usuarios` (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `encuesta_id` int UNSIGNED DEFAULT NULL,
  `pregunta_id` int UNSIGNED DEFAULT NULL,
  `respuesta_id` int UNSIGNED DEFAULT NULL,
  `tipo_pregunta` int DEFAULT NULL,
  `valor_respuesta` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `usuario_id` int UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `encuesta_usuarios_encuesta_id_foreign` (`encuesta_id`),
  KEY `encuesta_usuarios_pregunta_id_foreign` (`pregunta_id`),
  KEY `encuesta_usuarios_respuesta_id_foreign` (`respuesta_id`),
  KEY `encuesta_usuarios_usuario_id_foreign` (`usuario_id`)
) ENGINE=InnoDB AUTO_INCREMENT=124 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `encuesta_usuarios`
--

INSERT INTO `encuesta_usuarios` (`id`, `encuesta_id`, `pregunta_id`, `respuesta_id`, `tipo_pregunta`, `valor_respuesta`, `usuario_id`, `created_at`, `updated_at`) VALUES
(22, 2, 12, NULL, 1, 'ts', 7, '2023-09-13 17:02:23', '2023-09-13 17:02:23'),
(23, 2, 17, 40, 2, NULL, 7, '2023-09-13 17:02:23', '2023-09-13 17:02:23'),
(24, 2, 18, 43, 4, NULL, 7, '2023-09-13 17:02:23', '2023-09-13 17:02:23'),
(25, 2, 19, 48, 4, NULL, 7, '2023-09-13 17:02:23', '2023-09-13 17:02:23'),
(26, 2, 20, NULL, 1, 'ddd', 7, '2023-09-13 17:02:23', '2023-09-13 17:02:23'),
(27, 2, 21, 66, 2, NULL, 7, '2023-09-13 17:02:23', '2023-09-13 17:02:23'),
(28, 2, 22, NULL, 1, 'ddd', 7, '2023-09-13 17:02:23', '2023-09-13 17:02:23'),
(29, 2, 23, 72, 2, NULL, 7, '2023-09-13 17:02:24', '2023-09-13 17:02:24'),
(30, 2, 24, 77, 3, NULL, 7, '2023-09-13 17:02:24', '2023-09-13 17:02:24'),
(31, 2, 24, 78, 3, NULL, 7, '2023-09-13 17:02:24', '2023-09-13 17:02:24'),
(32, 2, 24, 79, 3, NULL, 7, '2023-09-13 17:02:24', '2023-09-13 17:02:24'),
(33, 2, 24, 80, 3, NULL, 7, '2023-09-13 17:02:24', '2023-09-13 17:02:24'),
(34, 2, 25, NULL, 1, 'dddd', 7, '2023-09-13 17:02:24', '2023-09-13 17:02:24'),
(35, 2, 27, 85, 4, NULL, 7, '2023-09-13 17:02:24', '2023-09-13 17:02:24'),
(36, 2, 28, 89, 4, NULL, 7, '2023-09-13 17:02:24', '2023-09-13 17:02:24'),
(37, 2, 29, 96, 4, NULL, 7, '2023-09-13 17:02:24', '2023-09-13 17:02:24'),
(38, 2, 30, 100, 4, NULL, 7, '2023-09-13 17:02:24', '2023-09-13 17:02:24'),
(39, 2, 31, 105, 4, NULL, 7, '2023-09-13 17:02:24', '2023-09-13 17:02:24'),
(40, 2, 32, 110, 4, NULL, 7, '2023-09-13 17:02:24', '2023-09-13 17:02:24'),
(41, 2, 33, 116, 4, NULL, 7, '2023-09-13 17:02:24', '2023-09-13 17:02:24'),
(42, 2, 34, 120, 4, NULL, 7, '2023-09-13 17:02:24', '2023-09-13 17:02:24'),
(43, 2, 35, 125, 4, NULL, 7, '2023-09-13 17:02:24', '2023-09-13 17:02:24'),
(44, 2, 36, 130, 4, NULL, 7, '2023-09-13 17:02:24', '2023-09-13 17:02:24'),
(45, 2, 37, 135, 4, NULL, 7, '2023-09-13 17:02:24', '2023-09-13 17:02:24'),
(46, 2, 38, 140, 4, NULL, 7, '2023-09-13 17:02:24', '2023-09-13 17:02:24'),
(47, 2, 39, 145, 4, NULL, 7, '2023-09-13 17:02:24', '2023-09-13 17:02:24'),
(48, 2, 40, 150, 4, NULL, 7, '2023-09-13 17:02:24', '2023-09-13 17:02:24'),
(49, 2, 41, 155, 4, NULL, 7, '2023-09-13 17:02:25', '2023-09-13 17:02:25'),
(50, 2, 42, 160, 4, NULL, 7, '2023-09-13 17:02:25', '2023-09-13 17:02:25'),
(51, 2, 43, NULL, 1, 'ddddd', 7, '2023-09-13 17:02:25', '2023-09-13 17:02:25'),
(52, 2, 44, 166, 2, NULL, 7, '2023-09-13 17:02:25', '2023-09-13 17:02:25'),
(53, 2, 45, 169, 2, NULL, 7, '2023-09-13 17:02:25', '2023-09-13 17:02:25'),
(54, 2, 46, NULL, 1, 'dd', 7, '2023-09-13 17:02:25', '2023-09-13 17:02:25'),
(55, 2, 47, NULL, 1, 'dd', 7, '2023-09-13 17:02:25', '2023-09-13 17:02:25'),
(56, 2, 12, NULL, 1, 'ts', 7, '2023-09-13 17:03:05', '2023-09-13 17:03:05'),
(57, 2, 17, 40, 2, NULL, 7, '2023-09-13 17:03:05', '2023-09-13 17:03:05'),
(58, 2, 18, 43, 4, NULL, 7, '2023-09-13 17:03:05', '2023-09-13 17:03:05'),
(59, 2, 19, 48, 4, NULL, 7, '2023-09-13 17:03:05', '2023-09-13 17:03:05'),
(60, 2, 20, NULL, 1, 'ddd', 7, '2023-09-13 17:03:05', '2023-09-13 17:03:05'),
(61, 2, 21, 66, 2, NULL, 7, '2023-09-13 17:03:05', '2023-09-13 17:03:05'),
(62, 2, 22, NULL, 1, 'ddd', 7, '2023-09-13 17:03:05', '2023-09-13 17:03:05'),
(63, 2, 23, 72, 2, NULL, 7, '2023-09-13 17:03:05', '2023-09-13 17:03:05'),
(64, 2, 24, 77, 3, NULL, 7, '2023-09-13 17:03:06', '2023-09-13 17:03:06'),
(65, 2, 24, 78, 3, NULL, 7, '2023-09-13 17:03:06', '2023-09-13 17:03:06'),
(66, 2, 24, 79, 3, NULL, 7, '2023-09-13 17:03:06', '2023-09-13 17:03:06'),
(67, 2, 24, 80, 3, NULL, 7, '2023-09-13 17:03:06', '2023-09-13 17:03:06'),
(68, 2, 25, NULL, 1, 'dddd', 7, '2023-09-13 17:03:06', '2023-09-13 17:03:06'),
(69, 2, 27, 85, 4, NULL, 7, '2023-09-13 17:03:06', '2023-09-13 17:03:06'),
(70, 2, 28, 89, 4, NULL, 7, '2023-09-13 17:03:06', '2023-09-13 17:03:06'),
(71, 2, 29, 96, 4, NULL, 7, '2023-09-13 17:03:06', '2023-09-13 17:03:06'),
(72, 2, 30, 100, 4, NULL, 7, '2023-09-13 17:03:06', '2023-09-13 17:03:06'),
(73, 2, 31, 105, 4, NULL, 7, '2023-09-13 17:03:06', '2023-09-13 17:03:06'),
(74, 2, 32, 110, 4, NULL, 7, '2023-09-13 17:03:06', '2023-09-13 17:03:06'),
(75, 2, 33, 116, 4, NULL, 7, '2023-09-13 17:03:07', '2023-09-13 17:03:07'),
(76, 2, 34, 120, 4, NULL, 7, '2023-09-13 17:03:07', '2023-09-13 17:03:07'),
(77, 2, 35, 125, 4, NULL, 7, '2023-09-13 17:03:07', '2023-09-13 17:03:07'),
(78, 2, 36, 130, 4, NULL, 7, '2023-09-13 17:03:07', '2023-09-13 17:03:07'),
(79, 2, 37, 135, 4, NULL, 7, '2023-09-13 17:03:07', '2023-09-13 17:03:07'),
(80, 2, 38, 140, 4, NULL, 7, '2023-09-13 17:03:07', '2023-09-13 17:03:07'),
(81, 2, 39, 145, 4, NULL, 7, '2023-09-13 17:03:07', '2023-09-13 17:03:07'),
(82, 2, 40, 150, 4, NULL, 7, '2023-09-13 17:03:07', '2023-09-13 17:03:07'),
(83, 2, 41, 155, 4, NULL, 7, '2023-09-13 17:03:07', '2023-09-13 17:03:07'),
(84, 2, 42, 160, 4, NULL, 7, '2023-09-13 17:03:07', '2023-09-13 17:03:07'),
(85, 2, 43, NULL, 1, 'ddddd', 7, '2023-09-13 17:03:07', '2023-09-13 17:03:07'),
(86, 2, 44, 166, 2, NULL, 7, '2023-09-13 17:03:07', '2023-09-13 17:03:07'),
(87, 2, 45, 169, 2, NULL, 7, '2023-09-13 17:03:07', '2023-09-13 17:03:07'),
(88, 2, 46, NULL, 1, 'dd', 7, '2023-09-13 17:03:07', '2023-09-13 17:03:07'),
(89, 2, 47, NULL, 1, 'dd', 7, '2023-09-13 17:03:07', '2023-09-13 17:03:07'),
(90, 2, 12, NULL, 1, 'ts', 7, '2023-09-13 17:03:57', '2023-09-13 17:03:57'),
(91, 2, 17, 40, 2, NULL, 7, '2023-09-13 17:03:57', '2023-09-13 17:03:57'),
(92, 2, 18, 43, 4, NULL, 7, '2023-09-13 17:03:57', '2023-09-13 17:03:57'),
(93, 2, 19, 48, 4, NULL, 7, '2023-09-13 17:03:58', '2023-09-13 17:03:58'),
(94, 2, 20, NULL, 1, 'ddd', 7, '2023-09-13 17:03:58', '2023-09-13 17:03:58'),
(95, 2, 21, 66, 2, NULL, 7, '2023-09-13 17:03:58', '2023-09-13 17:03:58'),
(96, 2, 22, NULL, 1, 'ddd', 7, '2023-09-13 17:03:58', '2023-09-13 17:03:58'),
(97, 2, 23, 72, 2, NULL, 7, '2023-09-13 17:03:58', '2023-09-13 17:03:58'),
(98, 2, 24, 77, 3, NULL, 7, '2023-09-13 17:03:58', '2023-09-13 17:03:58'),
(99, 2, 24, 78, 3, NULL, 7, '2023-09-13 17:03:58', '2023-09-13 17:03:58'),
(100, 2, 24, 79, 3, NULL, 7, '2023-09-13 17:03:58', '2023-09-13 17:03:58'),
(101, 2, 24, 80, 3, NULL, 7, '2023-09-13 17:03:58', '2023-09-13 17:03:58'),
(102, 2, 25, NULL, 1, 'dddd', 7, '2023-09-13 17:03:58', '2023-09-13 17:03:58'),
(103, 2, 27, 85, 4, NULL, 7, '2023-09-13 17:03:58', '2023-09-13 17:03:58'),
(104, 2, 28, 89, 4, NULL, 7, '2023-09-13 17:03:58', '2023-09-13 17:03:58'),
(105, 2, 29, 96, 4, NULL, 7, '2023-09-13 17:03:58', '2023-09-13 17:03:58'),
(106, 2, 30, 100, 4, NULL, 7, '2023-09-13 17:03:58', '2023-09-13 17:03:58'),
(107, 2, 31, 105, 4, NULL, 7, '2023-09-13 17:03:58', '2023-09-13 17:03:58'),
(108, 2, 32, 110, 4, NULL, 7, '2023-09-13 17:03:58', '2023-09-13 17:03:58'),
(109, 2, 33, 116, 4, NULL, 7, '2023-09-13 17:03:59', '2023-09-13 17:03:59'),
(110, 2, 34, 120, 4, NULL, 7, '2023-09-13 17:03:59', '2023-09-13 17:03:59'),
(111, 2, 35, 125, 4, NULL, 7, '2023-09-13 17:03:59', '2023-09-13 17:03:59'),
(112, 2, 36, 130, 4, NULL, 7, '2023-09-13 17:03:59', '2023-09-13 17:03:59'),
(113, 2, 37, 135, 4, NULL, 7, '2023-09-13 17:03:59', '2023-09-13 17:03:59'),
(114, 2, 38, 140, 4, NULL, 7, '2023-09-13 17:03:59', '2023-09-13 17:03:59'),
(115, 2, 39, 145, 4, NULL, 7, '2023-09-13 17:03:59', '2023-09-13 17:03:59'),
(116, 2, 40, 150, 4, NULL, 7, '2023-09-13 17:03:59', '2023-09-13 17:03:59'),
(117, 2, 41, 155, 4, NULL, 7, '2023-09-13 17:03:59', '2023-09-13 17:03:59'),
(118, 2, 42, 160, 4, NULL, 7, '2023-09-13 17:03:59', '2023-09-13 17:03:59'),
(119, 2, 43, NULL, 1, 'ddddd', 7, '2023-09-13 17:03:59', '2023-09-13 17:03:59'),
(120, 2, 44, 166, 2, NULL, 7, '2023-09-13 17:03:59', '2023-09-13 17:03:59'),
(121, 2, 45, 169, 2, NULL, 7, '2023-09-13 17:03:59', '2023-09-13 17:03:59'),
(122, 2, 46, NULL, 1, 'dd', 7, '2023-09-13 17:03:59', '2023-09-13 17:03:59'),
(123, 2, 47, NULL, 1, 'dd', 7, '2023-09-13 17:03:59', '2023-09-13 17:03:59');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `failed_jobs`
--

DROP TABLE IF EXISTS `failed_jobs`;
CREATE TABLE IF NOT EXISTS `failed_jobs` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `uuid` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `migrations`
--

DROP TABLE IF EXISTS `migrations`;
CREATE TABLE IF NOT EXISTS `migrations` (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `migration` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2019_08_19_000000_create_failed_jobs_table', 1),
(4, '2020_12_09_232137_create_permission_tables', 1),
(5, '2020_12_12_160229_create_encuestas_table', 1),
(6, '2020_12_13_171316_create_preguntas_table', 1),
(7, '2020_12_13_172027_create_tipo_encuestas_table', 1),
(8, '2020_12_13_172203_add_foreign_key_encuesta_table', 1),
(9, '2020_12_13_234734_tipos_preguntas', 1),
(10, '2020_12_13_235412_add_foreign_tipo_pregunta', 1),
(11, '2020_12_15_163620_create_respuestas_table', 1),
(12, '2020_12_18_141842_create_encuesta_usuarios_table', 1),
(13, '2020_12_18_155859_create_datos_generales_table', 1),
(14, '2023_09_05_175121_add_column_user_table', 1),
(15, '2023_09_07_120139_agregar_campo_celular_datos', 2);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `model_has_permissions`
--

DROP TABLE IF EXISTS `model_has_permissions`;
CREATE TABLE IF NOT EXISTS `model_has_permissions` (
  `permission_id` bigint UNSIGNED NOT NULL,
  `model_type` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `model_id` bigint UNSIGNED NOT NULL,
  PRIMARY KEY (`permission_id`,`model_id`,`model_type`),
  KEY `model_has_permissions_model_id_model_type_index` (`model_id`,`model_type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `model_has_roles`
--

DROP TABLE IF EXISTS `model_has_roles`;
CREATE TABLE IF NOT EXISTS `model_has_roles` (
  `role_id` bigint UNSIGNED NOT NULL,
  `model_type` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `model_id` bigint UNSIGNED NOT NULL,
  PRIMARY KEY (`role_id`,`model_id`,`model_type`),
  KEY `model_has_roles_model_id_model_type_index` (`model_id`,`model_type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `model_has_roles`
--

INSERT INTO `model_has_roles` (`role_id`, `model_type`, `model_id`) VALUES
(1, 'App\\Models\\User', 1),
(2, 'App\\Models\\User', 2),
(2, 'App\\Models\\User', 3),
(2, 'App\\Models\\User', 4),
(2, 'App\\Models\\User', 5),
(1, 'App\\Models\\User', 6),
(2, 'App\\Models\\User', 7);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `password_resets`
--

DROP TABLE IF EXISTS `password_resets`;
CREATE TABLE IF NOT EXISTS `password_resets` (
  `email` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  KEY `password_resets_email_index` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `permissions`
--

DROP TABLE IF EXISTS `permissions`;
CREATE TABLE IF NOT EXISTS `permissions` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `guard_name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `permissions`
--

INSERT INTO `permissions` (`id`, `name`, `guard_name`, `created_at`, `updated_at`) VALUES
(1, 'role-list', 'web', '2023-09-07 17:44:59', '2023-09-07 17:44:59'),
(2, 'role-create', 'web', '2023-09-07 17:44:59', '2023-09-07 17:44:59'),
(3, 'role-edit', 'web', '2023-09-07 17:44:59', '2023-09-07 17:44:59'),
(4, 'role-delete', 'web', '2023-09-07 17:44:59', '2023-09-07 17:44:59'),
(5, 'user-list', 'web', '2023-09-07 17:44:59', '2023-09-07 17:44:59'),
(6, 'user-create', 'web', '2023-09-07 17:44:59', '2023-09-07 17:44:59'),
(7, 'user-edit', 'web', '2023-09-07 17:44:59', '2023-09-07 17:44:59'),
(8, 'user-delete', 'web', '2023-09-07 17:44:59', '2023-09-07 17:44:59'),
(9, 'encuestas lista', 'web', '2023-09-07 17:44:59', '2023-09-07 17:44:59'),
(10, 'encuestas crear', 'web', '2023-09-07 17:44:59', '2023-09-07 17:44:59'),
(11, 'encuestas editar', 'web', '2023-09-07 17:44:59', '2023-09-07 17:44:59'),
(12, 'encuestas eliminar', 'web', '2023-09-07 17:44:59', '2023-09-07 17:44:59'),
(13, 'encuesta-guardar', 'web', '2023-09-07 17:44:59', '2023-09-07 17:44:59'),
(14, 'encuesta-ver', 'web', '2023-09-07 17:44:59', '2023-09-07 17:44:59'),
(15, 'resultados', 'web', '2023-09-07 17:44:59', '2023-09-07 17:44:59');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `preguntas`
--

DROP TABLE IF EXISTS `preguntas`;
CREATE TABLE IF NOT EXISTS `preguntas` (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `titulo` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `encuesta_id` int UNSIGNED DEFAULT NULL,
  `tipo_pregunta_id` int UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `preguntas_encuesta_id_foreign` (`encuesta_id`),
  KEY `preguntas_tipo_pregunta_id_foreign` (`tipo_pregunta_id`)
) ENGINE=InnoDB AUTO_INCREMENT=116 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `preguntas`
--

INSERT INTO `preguntas` (`id`, `titulo`, `encuesta_id`, `tipo_pregunta_id`, `created_at`, `updated_at`) VALUES
(1, '¿Tenía empleo antes de cursar el posgrado en el ITtuxtepec?', 1, 2, '2023-09-07 18:54:16', '2023-09-07 18:54:16'),
(2, 'El tipo de contratación era:', 1, 2, '2023-09-07 18:55:20', '2023-09-07 18:55:20'),
(3, '¿Cambió de empleo después de haber egresado del programa de posgrado?', 1, 2, '2023-09-07 22:39:24', '2023-09-07 22:47:30'),
(4, '¿Hay congruencia entre la actividad laboral con su formación académica?', 1, 2, '2023-09-07 22:48:37', '2023-09-07 22:48:37'),
(5, '¿Labora actualmente?', 1, 2, '2023-09-07 22:49:10', '2023-09-07 22:49:10'),
(6, 'Lugar donde labora actualmente:', 1, 2, '2023-09-07 22:49:43', '2023-09-07 22:49:43'),
(7, 'La institución donde labora es:', 1, 1, '2023-09-07 22:50:46', '2023-09-07 22:50:46'),
(8, 'Si su respuesta fue \"Otra\" especifique cuál(es).', 1, 1, '2023-09-07 22:51:15', '2023-09-07 22:51:15'),
(9, 'Antigüedad en el empleo: (años)', 1, 4, '2023-09-07 22:51:37', '2023-09-07 22:54:49'),
(10, 'Puesto(s) que desempeña:', 1, 1, '2023-09-07 22:57:39', '2023-09-07 22:57:39'),
(11, 'Tipo de contratación:', 1, 2, '2023-09-07 22:58:07', '2023-09-07 22:58:07'),
(12, 'Razón social de la Empresa', 2, 1, '2023-09-07 23:02:42', '2023-09-07 23:02:42'),
(17, 'Su empresa u organismo es:', 2, 2, '2023-09-07 23:04:35', '2023-09-07 23:04:35'),
(18, 'Tamaño de la empresa u organismo:', 2, 4, '2023-09-07 23:06:22', '2023-09-07 23:06:22'),
(19, 'Actividad económica de la empresa u organismo. Indique a cual clasificación corresponde su empresa:', 2, 4, '2023-09-07 23:07:18', '2023-09-07 23:21:56'),
(20, 'Si la pregunta anterior puso OTRA especifique', 2, 1, '2023-09-07 23:22:30', '2023-09-07 23:22:30'),
(21, 'Numero de profesionistas con nivel de Posgrado que laboran en su empresa u organismo', 2, 2, '2023-09-07 23:22:42', '2023-09-07 23:22:42'),
(22, 'Número de egresados con posgrado (Maestría en Ciencias en Alimentos, MCA) del Instituto Tecnológico de Tuxtepec y jerárquico que ocupan en su organización', 2, 1, '2023-09-07 23:24:20', '2023-09-07 23:24:20'),
(23, 'Congruencia entre el perfil de posgrado y/o Investigación o función que desarrollan los egresados de la MCA ITTuxtepec en su empresa u organización. Del total de egresados anote el porcentaje', 2, 2, '2023-09-07 23:24:32', '2023-09-07 23:24:32'),
(24, 'Requisitos que establece su empresa u organismo para la contratación de personal con nivel de posgrado.', 2, 3, '2023-09-07 23:25:34', '2023-09-07 23:25:34'),
(25, 'Posgrados que demanda preferentemente su empresa u organismo', 2, 1, '2023-09-07 23:27:03', '2023-09-07 23:27:03'),
(26, 'En su opinión ¿Que competencias considera deben desarrollar los egresados con posgrado del ITTuxtepec, para desempeñarse eficientemente en sus actividades laborales? Por favor evalué conforme', 2, 3, '2023-09-13 16:31:49', '2023-09-13 16:32:38'),
(27, 'a) Habilidad para resolver conflictos', 2, 4, '2023-09-13 16:33:07', '2023-09-13 16:37:50'),
(28, 'b) Ortografía y redacción de documentos', 2, 4, '2023-09-13 16:35:51', '2023-09-13 16:36:53'),
(29, 'c) Mejora de procesos', 2, 4, '2023-09-13 16:38:35', '2023-09-13 16:38:35'),
(30, 'd) Trabajo en equipo', 2, 4, '2023-09-13 16:39:25', '2023-09-13 16:39:25'),
(31, 'e) Habilidad para administrar tiempo', 2, 4, '2023-09-13 16:40:16', '2023-09-13 16:40:16'),
(32, 'f) Seguridad personal', 2, 4, '2023-09-13 16:41:01', '2023-09-13 16:41:01'),
(33, 'g) Facilidad de palabra', 2, 4, '2023-09-13 16:41:55', '2023-09-13 16:41:55'),
(34, 'h) Gestión de proyectos', 2, 4, '2023-09-13 16:42:53', '2023-09-13 16:42:53'),
(35, 'i) Puntualidad y asistencia', 2, 4, '2023-09-13 16:43:38', '2023-09-13 16:43:38'),
(36, 'j) Cumplimiento de las normas', 2, 4, '2023-09-13 16:45:22', '2023-09-13 16:45:22'),
(37, 'k) Integración al trabajo', 2, 4, '2023-09-13 16:46:03', '2023-09-13 16:46:03'),
(38, 'l) Creatividad e innovación', 2, 4, '2023-09-13 16:46:53', '2023-09-13 16:46:53'),
(39, 'm) Capacidad de negociación', 2, 4, '2023-09-13 16:47:33', '2023-09-13 16:47:33'),
(40, 'n) Capacidad de abstracción, análisis y síntesis', 2, 4, '2023-09-13 16:48:11', '2023-09-13 16:48:11'),
(41, 'o) Liderazgo y toma de decisiones', 2, 4, '2023-09-13 16:49:04', '2023-09-13 16:49:04'),
(42, 'p) Adaptación al cambio', 2, 4, '2023-09-13 16:49:51', '2023-09-13 16:49:51'),
(43, 'q) Otras, especifique', 2, 1, '2023-09-13 16:50:40', '2023-09-13 16:50:40'),
(44, 'Con base al desarrollo laboral así como a las actividades laborales que realiza el egresado de la MCA ITTuxtepec ¿Cómo considera su desempeño laboral respecto a su formación académica?', 2, 2, '2023-09-13 16:51:56', '2023-09-13 16:51:56'),
(45, 'Con base al desarrollo laboral así como a las actividades laborales que realiza el egresado de la MCA ITTuxtepec. ¿Cuál es el grado de satisfacción con respecto a él?', 2, 2, '2023-09-13 16:55:19', '2023-09-13 16:55:19'),
(46, 'De acuerdo con las necesidades de su empresa u organismo ¿Qué sugiere para mejorar la formación de los egresados la MCA ITTuxtepec?', 2, 1, '2023-09-13 16:56:26', '2023-09-13 16:56:26'),
(47, 'Comentarios y sugerencias:', 2, 1, '2023-09-13 16:56:46', '2023-09-13 16:56:46'),
(48, 'Si su respuesta fue \"Otro\" especifique.', 1, 1, '2023-09-13 17:17:19', '2023-09-13 17:17:19'),
(49, '¿Qué factores influyeron para conseguir empleo?', 1, 3, '2023-09-13 17:17:51', '2023-09-13 17:17:51'),
(50, '¿Cuánto tiempo le llevó conseguir empleo después de haber egresado del programa?', 1, 1, '2023-09-13 17:20:41', '2023-09-13 17:20:41'),
(51, 'Si es su caso, las causas que le impiden conseguir empleo son:', 1, 3, '2023-09-13 17:20:58', '2023-09-13 17:20:58'),
(52, '¿Cuáles fueron las estrategias para conseguir empleo?', 1, 3, '2023-09-13 17:22:53', '2023-09-13 17:22:53'),
(53, 'Nombre de la licenciatura cursada:', 1, 1, '2023-09-13 17:27:11', '2023-09-13 17:27:11'),
(54, 'Institución en que la(s) cursó:', 1, 1, '2023-09-13 17:27:27', '2023-09-13 17:27:27'),
(55, '¿Qué tiempo después de haber concluido los módulos o créditos de la maestrìa obtuvo el grado?', 1, 2, '2023-09-13 17:30:49', '2023-09-13 17:30:49'),
(56, '¿Qué causas incidieron para que usted tomara más tiempo en la obtención de su grado (si es el caso)?', 1, 3, '2023-09-13 17:32:20', '2023-09-13 17:32:20'),
(57, 'Si su respuesta fue \"Otro\" especifique.', 1, 1, '2023-09-13 17:34:41', '2023-09-13 17:34:41'),
(58, '¿Considera la graduación indispensable para el ejercicio profesional?', 1, 3, '2023-09-13 17:34:56', '2023-09-13 17:34:56'),
(59, 'Si su respuesta fue \"Otro\" especifique.', 1, 1, '2023-09-13 17:38:36', '2023-09-13 17:38:36'),
(60, '¿Estuvo becado para cursar sus estudios de Posgrado?', 1, 2, '2023-09-13 17:38:49', '2023-09-13 17:38:49'),
(61, '¿Qué institución le otorgó la beca?', 1, 3, '2023-09-13 17:42:00', '2023-09-13 17:42:00'),
(62, 'Si su respuesta fue \"Otra\" especifique.', 1, 1, '2023-09-13 17:43:05', '2023-09-13 17:43:05'),
(63, '¿Que tipo de beca obtuvo al cursar sus estudios de posgrado?', 1, 3, '2023-09-13 17:43:21', '2023-09-13 17:43:21'),
(64, 'Si su respuesta fue \"Otra\" especifique.', 1, 1, '2023-09-13 17:45:20', '2023-09-13 17:45:20'),
(65, '¿Desde la terminación de su posgrado, ha tomado cursos de actualización?', 1, 2, '2023-09-14 00:14:40', '2023-09-14 00:14:40'),
(66, 'Especifique los diplomados, cursos, seminarios, talleres, etc. que haya tomado en el último año:', 1, 1, '2023-09-14 00:24:57', '2023-09-14 00:30:30'),
(67, 'Indique los tipos de cursos de actualización que le gustaría que el ITTuxtepec impartiera.', 1, 1, '2023-09-14 01:09:14', '2023-09-14 01:09:14'),
(68, '¿Al ingresar al programa se le solicitó como requisito tener habilidades de otro idioma', 1, 2, '2023-09-14 01:10:50', '2023-09-14 01:13:06'),
(69, '¿Tiene dominio sobre algún otro idioma, además del español?', 1, 2, '2023-09-14 01:15:52', '2023-09-14 01:15:52'),
(70, '¿Cuál(es)?', 1, 1, '2023-09-14 01:25:38', '2023-09-14 01:25:38'),
(71, '¿Cuál es el nivel de dominio del idioma extranjero? Especifique:', 1, 3, '2023-09-14 01:29:01', '2023-09-14 01:31:11'),
(73, 'Traducción:', 1, 3, '2023-09-14 02:55:26', '2023-09-14 02:55:26'),
(74, 'Comprensión:', 1, 3, '2023-09-14 02:56:35', '2023-09-14 02:56:35'),
(75, '¿Participa en actividades de producción de conocimientos y publicaciones?', 1, 2, '2023-09-14 03:04:21', '2023-09-14 03:04:21'),
(76, 'Especifique en cuáles:', 1, 3, '2023-09-14 03:08:35', '2023-09-14 03:08:35'),
(77, 'Periódicos:', 1, 2, '2023-09-14 03:08:59', '2023-09-14 03:08:59'),
(78, 'Revistas especializadas:', 1, 2, '2023-09-14 03:09:45', '2023-09-14 03:09:45'),
(79, 'Libros:', 1, 2, '2023-09-15 21:36:21', '2023-09-15 21:36:21'),
(80, 'Capítulos de libros:', 1, 2, '2023-09-15 21:37:04', '2023-09-15 21:37:04'),
(81, 'Coautorías:', 1, 2, '2023-09-15 21:37:59', '2023-09-15 21:37:59'),
(82, 'Tesis:', 1, 2, '2023-09-15 21:51:04', '2023-09-15 21:51:04'),
(83, 'Asesorías a empresas:', 1, 2, '2023-09-15 21:51:47', '2023-09-15 21:51:47'),
(84, 'Asesorías técnicas:', 1, 2, '2023-09-15 21:52:34', '2023-09-15 21:52:34'),
(85, 'Informes técnicos:', 1, 2, '2023-09-15 21:53:15', '2023-09-15 21:53:15'),
(86, 'Patentes:', 1, 2, '2023-09-15 21:58:04', '2023-09-15 21:58:04'),
(87, 'Estudios de factibilidad:', 1, 2, '2023-09-15 21:58:38', '2023-09-15 21:58:38'),
(88, 'Elaboración de proyectos:', 1, 2, '2023-09-15 21:59:16', '2023-09-15 21:59:16'),
(89, 'Elaboración de proyectos:', 1, 2, '2023-09-15 22:00:13', '2023-09-15 22:00:13'),
(90, 'Titulación de egresados:', 1, 2, '2023-09-15 22:45:39', '2023-09-15 22:45:39'),
(91, 'Si hay otro(s), especifique cuál(es).', 1, 1, '2023-09-15 22:46:28', '2023-09-15 22:46:28'),
(92, '¿Ha recibido premios, reconocimientos o distinciones por su ejercicio profesional o de otra índole?', 1, 2, '2023-09-15 22:48:52', '2023-09-15 22:48:52'),
(93, 'Si su respuesta es afirmativa especifique la institución que le otorgó el reconocimiento y de que tipo fue.', 1, 1, '2023-09-15 22:49:32', '2023-09-15 22:49:32'),
(95, '¿Los contenidos temáticos del Plan de Estudios del Programa que cursó responden a las exigencias laborales actuales?', 1, 3, '2023-09-15 23:00:20', '2023-09-15 23:00:20'),
(96, 'Las formas de evaluación utilizadas por los docentes del programa que cursó fueron:', 1, 3, '2023-09-15 23:01:41', '2023-09-15 23:01:41'),
(97, 'La bibliografía del programa utilizada por los docentes fue:', 1, 3, '2023-09-15 23:09:55', '2023-09-15 23:09:55'),
(98, 'Las estrategias didácticas utilizadas por los docentes fueron', 1, 3, '2023-09-15 23:12:03', '2023-09-15 23:12:03'),
(99, '¿Se especializó en sus conocimientos en un campo específico después de egresar del programa?', 1, 2, '2023-09-15 23:15:14', '2023-09-15 23:15:14'),
(100, 'Si su respuesta fue \"Sï\", especifique en qué.', 1, 1, '2023-09-15 23:15:42', '2023-09-15 23:15:42'),
(101, '¿Qué tan satisfecho está con la formación adquirida en el programa de maestría que cursó?', 1, 3, '2023-09-15 23:16:49', '2023-09-15 23:16:49'),
(102, '¿En qué nivel se cumplieron las expectativas y metas que se propuso al cursar el posgrado en el ITTuxtepec?', 1, 3, '2023-09-15 23:20:05', '2023-09-15 23:20:05'),
(103, '¿Cómo evaluaría la calidad del programa que lo formó académicamente?', 1, 3, '2023-09-15 23:20:54', '2023-09-15 23:20:54'),
(104, 'Autoevaluación: En el próximo grupo de preguntas se le pide que autoevalúe su desarrollo después de haber egresado del (los) programa(s) que haya realizado en el ITTuxtepec.', 1, 3, '2023-09-15 23:21:51', '2023-09-15 23:22:12'),
(105, '¿Qué tanto mejoró sus habilidades y destrezas para desempeñarse en sus actividades laborales y profesionales?', 1, 3, '2023-09-15 23:23:09', '2023-09-15 23:23:09'),
(106, 'Sus habilidades y destrezas para resolver problemas en la práctica profesional son:', 1, 3, '2023-09-15 23:24:52', '2023-09-15 23:24:52'),
(107, 'Sus habilidades de liderazgo para desempeñarse en sus funciones laborales (integridad, honestidad, sensibilidad para con los demás, flexibilidad en sus funciones, etc.) son:', 1, 3, '2023-09-15 23:26:05', '2023-09-15 23:26:05'),
(108, '¿Sabe manejar conflictos, entre sus compañeros de trabajo?', 1, 2, '2023-09-15 23:29:42', '2023-09-15 23:29:42'),
(109, 'Sus habilidades de comunicación en el ámbito laboral son:', 1, 3, '2023-09-15 23:30:17', '2023-09-15 23:30:17'),
(110, 'Mucho', 1, 3, '2023-09-15 23:31:50', '2023-09-15 23:31:50'),
(111, 'Sus habilidades y destrezas para la creatividad e innovación son:', 1, 3, '2023-09-15 23:32:58', '2023-09-15 23:32:58'),
(112, 'Sus habilidades para usar métodos y analizar datos son:', 1, 3, '2023-09-15 23:33:40', '2023-09-15 23:33:40'),
(113, 'Sus habilidades para trabajar en equipo son:', 1, 3, '2023-09-15 23:34:41', '2023-09-15 23:34:41'),
(114, 'Grado de satisfacción en su lugar de trabajo:', 1, 3, '2023-09-15 23:35:31', '2023-09-15 23:35:31'),
(115, 'Comentarios y sugerencias:', 1, 1, '2023-09-15 23:36:59', '2023-09-15 23:36:59');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `respuestas`
--

DROP TABLE IF EXISTS `respuestas`;
CREATE TABLE IF NOT EXISTS `respuestas` (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `texto` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `pregunta_id` int UNSIGNED DEFAULT NULL,
  `encuesta_id` int UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `respuestas_pregunta_id_foreign` (`pregunta_id`),
  KEY `respuestas_encuesta_id_foreign` (`encuesta_id`)
) ENGINE=InnoDB AUTO_INCREMENT=322 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `respuestas`
--

INSERT INTO `respuestas` (`id`, `texto`, `pregunta_id`, `encuesta_id`, `created_at`, `updated_at`) VALUES
(1, 'Sí', 1, 1, '2023-09-07 18:54:48', '2023-09-07 18:54:48'),
(2, 'No', 1, 1, '2023-09-07 18:54:53', '2023-09-07 18:54:53'),
(3, 'Sí', 3, 1, '2023-09-07 22:45:25', '2023-09-07 22:47:48'),
(4, 'No', 3, 1, '2023-09-07 22:45:32', '2023-09-07 22:47:41'),
(6, 'Base', 2, 1, '2023-09-07 22:47:09', '2023-09-07 22:47:09'),
(7, 'Eventual', 2, 1, '2023-09-07 22:47:17', '2023-09-07 22:47:17'),
(8, 'Otro', 2, 1, '2023-09-07 22:47:21', '2023-09-07 22:47:21'),
(9, 'Sí', 4, 1, '2023-09-07 22:48:47', '2023-09-07 22:48:47'),
(10, 'No', 4, 1, '2023-09-07 22:48:59', '2023-09-07 22:48:59'),
(11, 'Sí', 5, 1, '2023-09-07 22:49:20', '2023-09-07 22:49:20'),
(12, 'No', 5, 1, '2023-09-07 22:49:27', '2023-09-07 22:49:27'),
(13, 'Pública', 6, 1, '2023-09-07 22:49:57', '2023-09-07 22:49:57'),
(14, 'Privada', 6, 1, '2023-09-07 22:50:15', '2023-09-07 22:50:15'),
(15, 'Otra', 6, 1, '2023-09-07 22:50:21', '2023-09-07 22:50:21'),
(16, 'Menos de un año', 9, 1, '2023-09-07 22:52:19', '2023-09-07 22:52:19'),
(17, '1', 9, 1, '2023-09-07 22:52:57', '2023-09-07 22:52:57'),
(18, '3', 9, 1, '2023-09-07 22:53:00', '2023-09-07 22:53:00'),
(19, '4', 9, 1, '2023-09-07 22:53:04', '2023-09-07 22:53:04'),
(20, '5', 9, 1, '2023-09-07 22:53:06', '2023-09-07 22:53:06'),
(21, '6', 9, 1, '2023-09-07 22:53:09', '2023-09-07 22:53:09'),
(22, '7', 9, 1, '2023-09-07 22:53:13', '2023-09-07 22:53:13'),
(23, '8', 9, 1, '2023-09-07 22:53:16', '2023-09-07 22:53:16'),
(24, '9', 9, 1, '2023-09-07 22:53:19', '2023-09-07 22:53:19'),
(25, '10', 9, 1, '2023-09-07 22:53:24', '2023-09-07 22:53:24'),
(26, '11', 9, 1, '2023-09-07 22:53:29', '2023-09-07 22:53:29'),
(27, '12', 9, 1, '2023-09-07 22:53:33', '2023-09-07 22:53:33'),
(28, '13', 9, 1, '2023-09-07 22:53:39', '2023-09-07 22:53:39'),
(29, '14', 9, 1, '2023-09-07 22:53:43', '2023-09-07 22:53:43'),
(30, '15', 9, 1, '2023-09-07 22:53:46', '2023-09-07 22:53:46'),
(31, '16', 9, 1, '2023-09-07 22:53:50', '2023-09-07 22:53:50'),
(32, '17', 9, 1, '2023-09-07 22:53:54', '2023-09-07 22:53:54'),
(33, '18', 9, 1, '2023-09-07 22:53:58', '2023-09-07 22:53:58'),
(34, '19', 9, 1, '2023-09-07 22:54:02', '2023-09-07 22:54:02'),
(35, '20', 9, 1, '2023-09-07 22:54:09', '2023-09-07 22:54:09'),
(36, 'Más de 20', 9, 1, '2023-09-07 22:54:29', '2023-09-07 22:54:29'),
(37, 'Base', 11, 1, '2023-09-07 22:58:14', '2023-09-07 22:58:14'),
(38, 'Eventual', 11, 1, '2023-09-07 22:58:35', '2023-09-07 22:58:35'),
(39, 'Otro', 11, 1, '2023-09-07 22:58:41', '2023-09-07 22:58:41'),
(40, 'Pública', 17, 2, '2023-09-07 23:04:46', '2023-09-07 23:04:46'),
(41, 'Privada', 17, 2, '2023-09-07 23:04:51', '2023-09-07 23:04:51'),
(42, 'Social', 17, 2, '2023-09-07 23:05:00', '2023-09-07 23:05:00'),
(43, 'Microempresa (De 1 a 30)', 18, 2, '2023-09-07 23:06:33', '2023-09-07 23:06:33'),
(44, 'Pequeña (De 31 a 100)', 18, 2, '2023-09-07 23:06:43', '2023-09-07 23:06:43'),
(45, 'Mediana (De 101 a 500)', 18, 2, '2023-09-07 23:06:51', '2023-09-07 23:06:51'),
(46, 'Grande (Mas de 500)', 18, 2, '2023-09-07 23:06:58', '2023-09-07 23:06:58'),
(47, 'Agro-industrial', 19, 2, '2023-09-07 23:07:26', '2023-09-07 23:07:26'),
(48, 'Silvicultura', 19, 2, '2023-09-07 23:18:40', '2023-09-07 23:18:48'),
(49, 'Pesca y acuacultura', 19, 2, '2023-09-07 23:18:57', '2023-09-07 23:18:57'),
(50, 'Minería', 19, 2, '2023-09-07 23:19:02', '2023-09-07 23:19:02'),
(51, 'Alimentos, bebidas y tabaco', 19, 2, '2023-09-07 23:19:07', '2023-09-07 23:19:07'),
(52, 'Textiles, Vestido y cuero', 19, 2, '2023-09-07 23:19:17', '2023-09-07 23:19:17'),
(53, 'Madera y sus productos', 19, 2, '2023-09-07 23:19:23', '2023-09-07 23:19:23'),
(54, 'Papel, imprenta y editoriales', 19, 2, '2023-09-07 23:19:29', '2023-09-07 23:19:29'),
(55, 'Química', 19, 2, '2023-09-07 23:19:35', '2023-09-07 23:19:35'),
(56, 'Caucho y plástico', 19, 2, '2023-09-07 23:19:42', '2023-09-07 23:19:42'),
(57, 'Minerales no metálicos', 19, 2, '2023-09-07 23:19:48', '2023-09-07 23:19:48'),
(58, 'Productos metálicos, maquinaria y  equipo', 19, 2, '2023-09-07 23:19:53', '2023-09-07 23:19:53'),
(59, 'Construcción', 19, 2, '2023-09-07 23:19:59', '2023-09-07 23:19:59'),
(60, 'Electricidad, gas y agua', 19, 2, '2023-09-07 23:20:05', '2023-09-07 23:20:05'),
(61, 'Comercio y turismo', 19, 2, '2023-09-07 23:20:34', '2023-09-07 23:20:34'),
(62, 'Transporte, y almacenaje y comunicaciones', 19, 2, '2023-09-07 23:20:40', '2023-09-07 23:20:40'),
(63, 'Servicios financieros seguros, actividades inmobiliarios y de alquiler', 19, 2, '2023-09-07 23:20:47', '2023-09-07 23:20:47'),
(64, 'Educación', 19, 2, '2023-09-07 23:20:54', '2023-09-07 23:20:54'),
(65, 'Otra (especifique) en el siguiente campo', 19, 2, '2023-09-07 23:21:09', '2023-09-07 23:21:09'),
(66, '1', 21, 2, '2023-09-07 23:22:52', '2023-09-07 23:22:52'),
(67, 'De 2 a 5', 21, 2, '2023-09-07 23:22:58', '2023-09-07 23:22:58'),
(68, 'De 5 a 8', 21, 2, '2023-09-07 23:23:03', '2023-09-07 23:23:03'),
(69, 'De 9 a 10', 21, 2, '2023-09-07 23:23:08', '2023-09-07 23:23:08'),
(70, 'Mas de 10', 21, 2, '2023-09-07 23:23:14', '2023-09-07 23:23:14'),
(71, 'Completamente', 23, 2, '2023-09-07 23:24:43', '2023-09-07 23:24:43'),
(72, 'Medianamente', 23, 2, '2023-09-07 23:24:48', '2023-09-07 23:24:48'),
(73, 'Ligeramente', 23, 2, '2023-09-07 23:24:54', '2023-09-07 23:24:54'),
(74, 'Ninguna relación', 23, 2, '2023-09-07 23:25:01', '2023-09-07 23:25:01'),
(75, 'Área o campo de estudio', 24, 2, '2023-09-07 23:25:41', '2023-09-07 23:25:41'),
(76, 'Titulación', 24, 2, '2023-09-07 23:25:48', '2023-09-07 23:25:48'),
(77, 'Experiencia laboral/practica (antes de egresar )', 24, 2, '2023-09-07 23:25:55', '2023-09-07 23:25:55'),
(78, 'Posicionamiento de la institución de egreso', 24, 2, '2023-09-07 23:26:02', '2023-09-07 23:26:02'),
(79, 'Conocimiento de idiomas extranjeros', 24, 2, '2023-09-07 23:26:09', '2023-09-07 23:26:09'),
(80, 'Recomendaciones/referencias', 24, 2, '2023-09-07 23:26:16', '2023-09-07 23:26:16'),
(81, 'Personalidad/actitudes', 24, 2, '2023-09-07 23:26:21', '2023-09-07 23:26:21'),
(82, 'Capacidad de liderazgo', 24, 2, '2023-09-07 23:26:27', '2023-09-07 23:26:27'),
(83, '1', 27, 2, '2023-09-13 16:33:21', '2023-09-13 16:33:21'),
(84, '2', 27, 2, '2023-09-13 16:33:26', '2023-09-13 16:33:26'),
(85, '3', 27, 2, '2023-09-13 16:33:30', '2023-09-13 16:33:30'),
(86, '4', 27, 2, '2023-09-13 16:33:34', '2023-09-13 16:33:34'),
(87, '5', 27, 2, '2023-09-13 16:33:38', '2023-09-13 16:33:38'),
(88, '1', 28, 2, '2023-09-13 16:36:05', '2023-09-13 16:36:05'),
(89, '2', 28, 2, '2023-09-13 16:36:28', '2023-09-13 16:36:28'),
(90, '3', 28, 2, '2023-09-13 16:36:33', '2023-09-13 16:36:33'),
(91, '4', 28, 2, '2023-09-13 16:36:36', '2023-09-13 16:36:36'),
(92, '5', 28, 2, '2023-09-13 16:36:40', '2023-09-13 16:36:40'),
(93, '1', 29, 2, '2023-09-13 16:38:48', '2023-09-13 16:38:48'),
(94, '2', 29, 2, '2023-09-13 16:38:52', '2023-09-13 16:38:52'),
(95, '3', 29, 2, '2023-09-13 16:38:55', '2023-09-13 16:38:55'),
(96, '4', 29, 2, '2023-09-13 16:39:00', '2023-09-13 16:39:00'),
(97, '5', 29, 2, '2023-09-13 16:39:04', '2023-09-13 16:39:04'),
(98, '1', 30, 2, '2023-09-13 16:39:42', '2023-09-13 16:39:42'),
(99, '2', 30, 2, '2023-09-13 16:39:46', '2023-09-13 16:39:46'),
(100, '3', 30, 2, '2023-09-13 16:39:50', '2023-09-13 16:39:50'),
(101, '4', 30, 2, '2023-09-13 16:39:54', '2023-09-13 16:39:54'),
(102, '5', 30, 2, '2023-09-13 16:39:58', '2023-09-13 16:39:58'),
(103, '1', 31, 2, '2023-09-13 16:40:24', '2023-09-13 16:40:24'),
(104, '2', 31, 2, '2023-09-13 16:40:27', '2023-09-13 16:40:27'),
(105, '3', 31, 2, '2023-09-13 16:40:31', '2023-09-13 16:40:31'),
(106, '4', 31, 2, '2023-09-13 16:40:36', '2023-09-13 16:40:36'),
(107, '5', 31, 2, '2023-09-13 16:40:39', '2023-09-13 16:40:39'),
(108, '1', 32, 2, '2023-09-13 16:41:11', '2023-09-13 16:41:11'),
(109, '2', 32, 2, '2023-09-13 16:41:14', '2023-09-13 16:41:14'),
(110, '3', 32, 2, '2023-09-13 16:41:18', '2023-09-13 16:41:18'),
(111, '4', 32, 2, '2023-09-13 16:41:21', '2023-09-13 16:41:21'),
(112, '5', 32, 2, '2023-09-13 16:41:24', '2023-09-13 16:41:24'),
(113, '1', 33, 2, '2023-09-13 16:42:03', '2023-09-13 16:42:03'),
(114, '2', 33, 2, '2023-09-13 16:42:07', '2023-09-13 16:42:07'),
(115, '3', 33, 2, '2023-09-13 16:42:11', '2023-09-13 16:42:11'),
(116, '4', 33, 2, '2023-09-13 16:42:14', '2023-09-13 16:42:14'),
(117, '5', 33, 2, '2023-09-13 16:42:18', '2023-09-13 16:42:18'),
(118, '1', 34, 2, '2023-09-13 16:43:02', '2023-09-13 16:43:02'),
(119, '2', 34, 2, '2023-09-13 16:43:06', '2023-09-13 16:43:06'),
(120, '3', 34, 2, '2023-09-13 16:43:10', '2023-09-13 16:43:10'),
(121, '4', 34, 2, '2023-09-13 16:43:14', '2023-09-13 16:43:14'),
(122, '5', 34, 2, '2023-09-13 16:43:17', '2023-09-13 16:43:17'),
(123, '1', 35, 2, '2023-09-13 16:43:47', '2023-09-13 16:43:47'),
(124, '2', 35, 2, '2023-09-13 16:43:50', '2023-09-13 16:43:50'),
(125, '3', 35, 2, '2023-09-13 16:43:53', '2023-09-13 16:43:53'),
(126, '4', 35, 2, '2023-09-13 16:43:57', '2023-09-13 16:43:57'),
(127, '5', 35, 2, '2023-09-13 16:44:01', '2023-09-13 16:44:01'),
(128, '1', 36, 2, '2023-09-13 16:45:33', '2023-09-13 16:45:33'),
(129, '2', 36, 2, '2023-09-13 16:45:36', '2023-09-13 16:45:36'),
(130, '3', 36, 2, '2023-09-13 16:45:38', '2023-09-13 16:45:38'),
(131, '4', 36, 2, '2023-09-13 16:45:43', '2023-09-13 16:45:43'),
(132, '5', 36, 2, '2023-09-13 16:45:47', '2023-09-13 16:45:47'),
(133, '1', 37, 2, '2023-09-13 16:46:14', '2023-09-13 16:46:14'),
(134, '2', 37, 2, '2023-09-13 16:46:17', '2023-09-13 16:46:17'),
(135, '3', 37, 2, '2023-09-13 16:46:21', '2023-09-13 16:46:21'),
(136, '4', 37, 2, '2023-09-13 16:46:24', '2023-09-13 16:46:24'),
(137, '5', 37, 2, '2023-09-13 16:46:28', '2023-09-13 16:46:28'),
(138, '1', 38, 2, '2023-09-13 16:47:02', '2023-09-13 16:47:02'),
(139, '2', 38, 2, '2023-09-13 16:47:05', '2023-09-13 16:47:05'),
(140, '3', 38, 2, '2023-09-13 16:47:08', '2023-09-13 16:47:08'),
(141, '4', 38, 2, '2023-09-13 16:47:13', '2023-09-13 16:47:13'),
(142, '5', 38, 2, '2023-09-13 16:47:16', '2023-09-13 16:47:16'),
(143, '1', 39, 2, '2023-09-13 16:47:41', '2023-09-13 16:47:41'),
(144, '2', 39, 2, '2023-09-13 16:47:44', '2023-09-13 16:47:44'),
(145, '3', 39, 2, '2023-09-13 16:47:47', '2023-09-13 16:47:47'),
(146, '4', 39, 2, '2023-09-13 16:47:50', '2023-09-13 16:47:50'),
(147, '5', 39, 2, '2023-09-13 16:47:53', '2023-09-13 16:47:53'),
(148, '1', 40, 2, '2023-09-13 16:48:24', '2023-09-13 16:48:24'),
(149, '2', 40, 2, '2023-09-13 16:48:28', '2023-09-13 16:48:28'),
(150, '3', 40, 2, '2023-09-13 16:48:31', '2023-09-13 16:48:31'),
(151, '4', 40, 2, '2023-09-13 16:48:34', '2023-09-13 16:48:34'),
(152, '5', 40, 2, '2023-09-13 16:48:37', '2023-09-13 16:48:37'),
(153, '1', 41, 2, '2023-09-13 16:49:16', '2023-09-13 16:49:16'),
(154, '2', 41, 2, '2023-09-13 16:49:19', '2023-09-13 16:49:19'),
(155, '3', 41, 2, '2023-09-13 16:49:23', '2023-09-13 16:49:23'),
(156, '4', 41, 2, '2023-09-13 16:49:27', '2023-09-13 16:49:27'),
(157, '5', 41, 2, '2023-09-13 16:49:30', '2023-09-13 16:49:30'),
(158, '1', 42, 2, '2023-09-13 16:50:02', '2023-09-13 16:50:02'),
(159, '2', 42, 2, '2023-09-13 16:50:05', '2023-09-13 16:50:05'),
(160, '3', 42, 2, '2023-09-13 16:50:08', '2023-09-13 16:50:08'),
(161, '4', 42, 2, '2023-09-13 16:50:11', '2023-09-13 16:50:11'),
(162, '5', 42, 2, '2023-09-13 16:50:14', '2023-09-13 16:50:14'),
(163, 'a) Excelente', 44, 2, '2023-09-13 16:52:17', '2023-09-13 16:52:17'),
(164, 'b) Muy bueno', 44, 2, '2023-09-13 16:52:28', '2023-09-13 16:52:28'),
(165, 'c) Bueno', 44, 2, '2023-09-13 16:52:40', '2023-09-13 16:52:40'),
(166, 'd) Regular', 44, 2, '2023-09-13 16:52:55', '2023-09-13 16:52:55'),
(167, 'e) Malo', 44, 2, '2023-09-13 16:53:15', '2023-09-13 16:53:15'),
(168, 'a) Excelente', 45, 2, '2023-09-13 16:55:30', '2023-09-13 16:55:30'),
(169, 'b) Bueno', 45, 2, '2023-09-13 16:55:44', '2023-09-13 16:55:44'),
(170, 'c) Bueno', 45, 2, '2023-09-13 16:55:52', '2023-09-13 16:55:52'),
(171, 'd) Regular', 45, 2, '2023-09-13 16:55:57', '2023-09-13 16:55:57'),
(172, 'e) Malo', 45, 2, '2023-09-13 16:56:03', '2023-09-13 16:56:03'),
(173, 'Prestigio del ITTuxtepec', 49, 1, '2023-09-13 17:18:12', '2023-09-13 17:18:12'),
(174, 'Perfil académico', 49, 1, '2023-09-13 17:18:25', '2023-09-13 17:18:25'),
(175, 'Experiencia laboral', 49, 1, '2023-09-13 17:18:36', '2023-09-13 17:18:36'),
(176, 'Género', 49, 1, '2023-09-13 17:18:47', '2023-09-13 17:18:47'),
(177, 'Por la edad', 49, 1, '2023-09-13 17:18:56', '2023-09-13 17:18:56'),
(178, 'Por recomendaciones', 49, 1, '2023-09-13 17:19:08', '2023-09-13 17:19:08'),
(179, 'Otro', 49, 1, '2023-09-13 17:19:36', '2023-09-13 17:19:36'),
(180, 'Poca experiencia laboral', 51, 1, '2023-09-13 17:21:09', '2023-09-13 17:21:09'),
(181, 'Falta de oportunidades en el área', 51, 1, '2023-09-13 17:21:24', '2023-09-13 17:21:24'),
(182, 'Por no tener el grado académico', 51, 1, '2023-09-13 17:21:36', '2023-09-13 17:21:36'),
(183, 'Falta de dominio de otro idioma', 51, 1, '2023-09-13 17:21:48', '2023-09-13 17:21:48'),
(184, 'Causas personales', 51, 1, '2023-09-13 17:21:57', '2023-09-13 17:21:57'),
(185, 'Otro', 51, 1, '2023-09-13 17:22:32', '2023-09-13 17:22:32'),
(186, 'Periódico', 52, 1, '2023-09-13 17:23:19', '2023-09-13 17:23:19'),
(187, 'Bolsa de trabajo', 52, 1, '2023-09-13 17:23:34', '2023-09-13 17:23:34'),
(188, 'Convocatoria', 52, 1, '2023-09-13 17:23:47', '2023-09-13 17:23:47'),
(189, 'Solicitud de empleo', 52, 1, '2023-09-13 17:23:58', '2023-09-13 17:23:58'),
(190, 'Otro', 52, 1, '2023-09-13 17:24:12', '2023-09-13 17:24:12'),
(191, '6 meses - 1 año', 55, 1, '2023-09-13 17:31:05', '2023-09-13 17:31:05'),
(192, '1 año - 2 años', 55, 1, '2023-09-13 17:31:18', '2023-09-13 17:31:18'),
(193, '2 años - 3 años', 55, 1, '2023-09-13 17:31:29', '2023-09-13 17:31:29'),
(194, 'Mas de 3 años', 55, 1, '2023-09-13 17:31:39', '2023-09-13 17:31:39'),
(195, 'Académico', 56, 1, '2023-09-13 17:32:48', '2023-09-13 17:33:09'),
(196, 'Laboral', 56, 1, '2023-09-13 17:33:02', '2023-09-13 17:33:02'),
(197, 'Personal', 56, 1, '2023-09-13 17:34:10', '2023-09-13 17:34:10'),
(198, 'Otro', 56, 1, '2023-09-13 17:34:23', '2023-09-13 17:34:23'),
(199, 'Se adquiere ascenso en el trabajo', 58, 1, '2023-09-13 17:35:14', '2023-09-13 17:35:14'),
(200, 'Asegura el trabajo', 58, 1, '2023-09-13 17:35:25', '2023-09-13 17:35:25'),
(201, 'Es indispensable para conseguir empleo', 58, 1, '2023-09-13 17:37:49', '2023-09-13 17:37:49'),
(202, 'Para el ejercicio legal de la profesión', 58, 1, '2023-09-13 17:38:00', '2023-09-13 17:38:00'),
(203, 'Otro', 58, 1, '2023-09-13 17:38:12', '2023-09-13 17:38:12'),
(204, 'si', 60, 1, '2023-09-13 17:38:57', '2023-09-13 17:38:57'),
(205, 'no', 60, 1, '2023-09-13 17:39:01', '2023-09-13 17:39:01'),
(206, 'La institución donde labora', 61, 1, '2023-09-13 17:42:14', '2023-09-13 17:42:14'),
(207, 'COSNET', 61, 1, '2023-09-13 17:42:25', '2023-09-13 17:42:25'),
(208, 'CONACYT', 61, 1, '2023-09-13 17:42:34', '2023-09-13 17:42:34'),
(209, 'Otra', 61, 1, '2023-09-13 17:42:44', '2023-09-13 17:42:44'),
(210, 'Económica', 63, 1, '2023-09-13 17:43:37', '2023-09-13 17:43:37'),
(211, 'Descarga laboral total', 63, 1, '2023-09-13 17:43:53', '2023-09-13 17:43:53'),
(212, 'Descarga laboral parcial', 63, 1, '2023-09-13 17:44:02', '2023-09-13 17:44:02'),
(213, 'Manutención y seguro médico', 63, 1, '2023-09-13 17:44:12', '2023-09-13 17:44:12'),
(214, 'Manutención, colegiatura y seguro médico', 63, 1, '2023-09-13 17:44:25', '2023-09-13 17:44:25'),
(215, 'Beca tesis', 63, 1, '2023-09-13 17:44:37', '2023-09-13 17:44:37'),
(216, 'Otra', 63, 1, '2023-09-13 17:44:47', '2023-09-13 17:44:47'),
(218, 'Si', 65, 1, '2023-09-14 00:14:58', '2023-09-14 00:14:58'),
(219, 'No', 65, 1, '2023-09-14 00:15:04', '2023-09-14 00:15:04'),
(220, 'Si', 68, 1, '2023-09-14 01:11:30', '2023-09-14 01:11:30'),
(221, 'No', 68, 1, '2023-09-14 01:11:44', '2023-09-14 01:11:44'),
(222, 'Si', 69, 1, '2023-09-14 01:16:09', '2023-09-14 01:16:09'),
(223, 'No', 69, 1, '2023-09-14 01:16:10', '2023-09-14 01:16:22'),
(230, '100%', 73, 1, '2023-09-14 02:55:47', '2023-09-14 02:55:47'),
(231, '90%', 73, 1, '2023-09-14 02:55:54', '2023-09-14 02:55:54'),
(232, '80%', 73, 1, '2023-09-14 02:56:02', '2023-09-14 02:56:02'),
(233, '70%', 73, 1, '2023-09-14 02:56:11', '2023-09-14 02:56:11'),
(234, '50%', 73, 1, '2023-09-14 02:56:17', '2023-09-14 02:56:17'),
(235, '100%', 74, 1, '2023-09-14 03:03:20', '2023-09-14 03:03:20'),
(236, '90%', 74, 1, '2023-09-14 03:03:29', '2023-09-14 03:03:29'),
(237, '80%', 74, 1, '2023-09-14 03:03:37', '2023-09-14 03:03:37'),
(238, '70%', 74, 1, '2023-09-14 03:03:43', '2023-09-14 03:03:43'),
(239, '50%', 74, 1, '2023-09-14 03:03:52', '2023-09-14 03:03:52'),
(240, 'Si', 75, 1, '2023-09-14 03:04:34', '2023-09-14 03:04:34'),
(241, 'No', 75, 1, '2023-09-14 03:04:46', '2023-09-14 03:04:46'),
(242, 'Si', 77, 1, '2023-09-14 03:09:15', '2023-09-14 03:09:15'),
(243, 'No', 77, 1, '2023-09-14 03:09:21', '2023-09-14 03:09:21'),
(244, 'Si', 78, 1, '2023-09-14 03:09:59', '2023-09-14 03:09:59'),
(245, 'No', 78, 1, '2023-09-14 03:10:05', '2023-09-14 03:10:05'),
(246, 'Si', 79, 1, '2023-09-15 21:36:33', '2023-09-15 21:36:33'),
(247, 'No', 79, 1, '2023-09-15 21:36:42', '2023-09-15 21:36:42'),
(248, 'Si', 80, 1, '2023-09-15 21:37:16', '2023-09-15 21:37:16'),
(249, 'No', 80, 1, '2023-09-15 21:37:26', '2023-09-15 21:37:26'),
(250, 'Si', 81, 1, '2023-09-15 21:38:20', '2023-09-15 21:38:20'),
(251, 'No', 81, 1, '2023-09-15 21:38:30', '2023-09-15 21:38:30'),
(252, 'Si', 82, 1, '2023-09-15 21:51:17', '2023-09-15 21:51:17'),
(253, 'No', 82, 1, '2023-09-15 21:51:26', '2023-09-15 21:51:26'),
(254, 'Si', 83, 1, '2023-09-15 21:51:59', '2023-09-15 21:51:59'),
(255, 'No', 83, 1, '2023-09-15 21:52:07', '2023-09-15 21:52:07'),
(256, 'Si', 84, 1, '2023-09-15 21:52:44', '2023-09-15 21:52:44'),
(257, 'No', 84, 1, '2023-09-15 21:52:54', '2023-09-15 21:52:54'),
(258, 'Si', 85, 1, '2023-09-15 21:57:39', '2023-09-15 21:57:39'),
(259, 'No', 85, 1, '2023-09-15 21:57:43', '2023-09-15 21:57:43'),
(260, 'Si', 86, 1, '2023-09-15 21:58:14', '2023-09-15 21:58:14'),
(261, 'No', 86, 1, '2023-09-15 21:58:19', '2023-09-15 21:58:19'),
(262, 'Si', 87, 1, '2023-09-15 21:58:46', '2023-09-15 21:58:46'),
(263, 'No', 87, 1, '2023-09-15 21:58:50', '2023-09-15 21:58:50'),
(264, 'Si', 88, 1, '2023-09-15 21:59:24', '2023-09-15 21:59:24'),
(265, 'No', 88, 1, '2023-09-15 21:59:28', '2023-09-15 21:59:28'),
(266, 'Si', 89, 1, '2023-09-15 22:00:23', '2023-09-15 22:00:23'),
(267, 'No', 89, 1, '2023-09-15 22:00:29', '2023-09-15 22:00:29'),
(268, 'Si', 90, 1, '2023-09-15 22:45:48', '2023-09-15 22:45:48'),
(269, 'No', 90, 1, '2023-09-15 22:45:55', '2023-09-15 22:45:55'),
(270, 'Si', 92, 1, '2023-09-15 22:49:01', '2023-09-15 22:49:01'),
(271, 'No', 92, 1, '2023-09-15 22:49:07', '2023-09-15 22:49:07'),
(272, 'Mucho', 95, 1, '2023-09-15 23:00:33', '2023-09-15 23:00:33'),
(273, 'Regular', 95, 1, '2023-09-15 23:00:42', '2023-09-15 23:00:42'),
(274, 'Poco', 95, 1, '2023-09-15 23:00:48', '2023-09-15 23:00:48'),
(275, 'Nada', 95, 1, '2023-09-15 23:00:59', '2023-09-15 23:00:59'),
(276, 'Buenas', 96, 1, '2023-09-15 23:01:53', '2023-09-15 23:01:53'),
(277, 'Regulares', 96, 1, '2023-09-15 23:02:03', '2023-09-15 23:02:03'),
(278, 'Malas', 96, 1, '2023-09-15 23:02:29', '2023-09-15 23:02:29'),
(279, 'Actualizada', 97, 1, '2023-09-15 23:10:08', '2023-09-15 23:10:08'),
(280, 'No actualizada', 97, 1, '2023-09-15 23:10:17', '2023-09-15 23:10:17'),
(281, 'Ambas', 97, 1, '2023-09-15 23:10:38', '2023-09-15 23:10:38'),
(282, 'Tradicionales', 98, 1, '2023-09-15 23:12:29', '2023-09-15 23:12:29'),
(283, 'Innovadoras', 98, 1, '2023-09-15 23:12:38', '2023-09-15 23:12:38'),
(284, 'Ambas', 98, 1, '2023-09-15 23:12:44', '2023-09-15 23:12:44'),
(285, 'Si', 99, 1, '2023-09-15 23:15:21', '2023-09-15 23:15:21'),
(286, 'No', 99, 1, '2023-09-15 23:15:26', '2023-09-15 23:15:26'),
(287, 'Mucho', 101, 1, '2023-09-15 23:17:11', '2023-09-15 23:17:11'),
(288, 'Regular', 101, 1, '2023-09-15 23:17:11', '2023-09-15 23:17:23'),
(289, 'Poco', 101, 1, '2023-09-15 23:17:30', '2023-09-15 23:17:30'),
(290, 'Mucho', 102, 1, '2023-09-15 23:20:15', '2023-09-15 23:20:21'),
(291, 'Regular', 102, 1, '2023-09-15 23:20:28', '2023-09-15 23:20:28'),
(292, 'Poco', 102, 1, '2023-09-15 23:20:34', '2023-09-15 23:20:34'),
(293, 'Muy bueno', 103, 1, '2023-09-15 23:21:13', '2023-09-15 23:21:13'),
(294, 'Bueno', 103, 1, '2023-09-15 23:21:19', '2023-09-15 23:21:19'),
(295, 'Regular', 103, 1, '2023-09-15 23:21:27', '2023-09-15 23:21:27'),
(296, 'Mucho', 105, 1, '2023-09-15 23:23:20', '2023-09-15 23:23:20'),
(297, 'Regular', 105, 1, '2023-09-15 23:23:24', '2023-09-15 23:23:24'),
(298, 'Poco', 105, 1, '2023-09-15 23:23:29', '2023-09-15 23:23:29'),
(299, 'Mejores', 106, 1, '2023-09-15 23:25:01', '2023-09-15 23:25:01'),
(300, 'Iguales', 106, 1, '2023-09-15 23:25:13', '2023-09-15 23:25:13'),
(301, 'Mejores', 107, 1, '2023-09-15 23:26:22', '2023-09-15 23:26:22'),
(302, 'Iguales', 107, 1, '2023-09-15 23:26:30', '2023-09-15 23:26:30'),
(303, 'Si', 108, 1, '2023-09-15 23:29:51', '2023-09-15 23:29:51'),
(304, 'No', 108, 1, '2023-09-15 23:29:55', '2023-09-15 23:29:55'),
(305, 'Mejores', 109, 1, '2023-09-15 23:30:28', '2023-09-15 23:30:28'),
(306, 'Iguales', 109, 1, '2023-09-15 23:30:33', '2023-09-15 23:30:33'),
(307, 'Mucho', 110, 1, '2023-09-15 23:32:09', '2023-09-15 23:32:09'),
(308, 'Regular', 110, 1, '2023-09-15 23:32:19', '2023-09-15 23:32:19'),
(309, 'Poco', 110, 1, '2023-09-15 23:32:29', '2023-09-15 23:32:29'),
(310, 'Nada', 110, 1, '2023-09-15 23:32:34', '2023-09-15 23:32:34'),
(311, 'Mejores', 111, 1, '2023-09-15 23:33:09', '2023-09-15 23:33:09'),
(312, 'Iguales', 111, 1, '2023-09-15 23:33:17', '2023-09-15 23:33:17'),
(313, 'Muy buenas', 112, 1, '2023-09-15 23:33:52', '2023-09-15 23:33:52'),
(314, 'Buenas', 112, 1, '2023-09-15 23:34:07', '2023-09-15 23:34:07'),
(315, 'Regulares', 112, 1, '2023-09-15 23:34:14', '2023-09-15 23:34:14'),
(316, 'Malas', 112, 1, '2023-09-15 23:34:21', '2023-09-15 23:34:21'),
(317, 'Mejores', 113, 1, '2023-09-15 23:34:52', '2023-09-15 23:34:52'),
(318, 'Iguales', 113, 1, '2023-09-15 23:35:03', '2023-09-15 23:35:03'),
(319, 'Muy Satisfecho', 114, 1, '2023-09-15 23:35:53', '2023-09-15 23:35:53'),
(320, 'Satisfecho', 114, 1, '2023-09-15 23:36:02', '2023-09-15 23:36:02'),
(321, 'Sin importancia', 114, 1, '2023-09-15 23:36:26', '2023-09-15 23:36:26');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `roles`
--

DROP TABLE IF EXISTS `roles`;
CREATE TABLE IF NOT EXISTS `roles` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `guard_name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `roles`
--

INSERT INTO `roles` (`id`, `name`, `guard_name`, `created_at`, `updated_at`) VALUES
(1, 'Admin', 'web', '2023-09-07 17:44:59', '2023-09-07 17:44:59'),
(2, 'encuestado', 'web', '2023-09-07 17:44:59', '2023-09-07 17:44:59');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `role_has_permissions`
--

DROP TABLE IF EXISTS `role_has_permissions`;
CREATE TABLE IF NOT EXISTS `role_has_permissions` (
  `permission_id` bigint UNSIGNED NOT NULL,
  `role_id` bigint UNSIGNED NOT NULL,
  PRIMARY KEY (`permission_id`,`role_id`),
  KEY `role_has_permissions_role_id_foreign` (`role_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `role_has_permissions`
--

INSERT INTO `role_has_permissions` (`permission_id`, `role_id`) VALUES
(1, 1),
(2, 1),
(3, 1),
(4, 1),
(5, 1),
(6, 1),
(7, 1),
(8, 1),
(9, 1),
(10, 1),
(11, 1),
(12, 1),
(13, 1),
(14, 1),
(15, 1),
(13, 2),
(14, 2);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipos_preguntas`
--

DROP TABLE IF EXISTS `tipos_preguntas`;
CREATE TABLE IF NOT EXISTS `tipos_preguntas` (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `nombre` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `tipos_preguntas`
--

INSERT INTO `tipos_preguntas` (`id`, `nombre`, `created_at`, `updated_at`) VALUES
(1, 'Texto', '2023-09-07 17:44:59', '2023-09-07 17:44:59'),
(2, 'Opción Múltiple', '2023-09-07 17:44:59', '2023-09-07 17:44:59'),
(3, 'Casillas', '2023-09-07 17:44:59', '2023-09-07 17:44:59'),
(4, 'Seleccion', NULL, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipo_encuestas`
--

DROP TABLE IF EXISTS `tipo_encuestas`;
CREATE TABLE IF NOT EXISTS `tipo_encuestas` (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `nombre` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `tipo_encuestas`
--

INSERT INTO `tipo_encuestas` (`id`, `nombre`, `created_at`, `updated_at`) VALUES
(1, 'Egresados', '2023-09-07 17:44:59', '2023-09-07 17:44:59'),
(2, 'Empleadores', '2023-09-07 17:44:59', '2023-09-07 17:44:59');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `users`
--

DROP TABLE IF EXISTS `users`;
CREATE TABLE IF NOT EXISTS `users` (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `es_empleado` tinyint DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`, `es_empleado`) VALUES
(1, 'Leo Maldonado', 'lrmaldo@gmail.com', NULL, '$2y$10$5nGv95Rz8LlYuWqZJcLR8uU8.xR0Tammjeaxwn/fPabx7xnwY0mEe', NULL, '2023-09-07 17:44:59', '2023-09-07 17:44:59', NULL),
(6, 'Lissette Rodriguez Najera', 'lissetterodriguezn@gmail.com', NULL, '$2y$10$et44WvvYnFVdY0XFv3tKtuuOaE1vS5pszN/PwlUZMDsFdlZMvoDyS', NULL, '2023-09-08 16:13:23', '2023-09-08 16:13:23', NULL),
(7, 'test', 'test@test.com', NULL, '$2y$10$IkweHEc6jyNJIdOko.523ejbnOT3Mmz.TbQbgwTE/wDQtulThggL6', NULL, '2023-09-13 16:13:52', '2023-09-13 16:13:52', 2);

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `datos_generales`
--
ALTER TABLE `datos_generales`
  ADD CONSTRAINT `datos_generales_usuario_id_foreign` FOREIGN KEY (`usuario_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Filtros para la tabla `encuestas`
--
ALTER TABLE `encuestas`
  ADD CONSTRAINT `encuestas_tipo_encuesta_id_foreign` FOREIGN KEY (`tipo_encuesta_id`) REFERENCES `tipo_encuestas` (`id`) ON DELETE CASCADE;

--
-- Filtros para la tabla `encuesta_usuarios`
--
ALTER TABLE `encuesta_usuarios`
  ADD CONSTRAINT `encuesta_usuarios_encuesta_id_foreign` FOREIGN KEY (`encuesta_id`) REFERENCES `encuestas` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `encuesta_usuarios_pregunta_id_foreign` FOREIGN KEY (`pregunta_id`) REFERENCES `preguntas` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `encuesta_usuarios_respuesta_id_foreign` FOREIGN KEY (`respuesta_id`) REFERENCES `respuestas` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `encuesta_usuarios_usuario_id_foreign` FOREIGN KEY (`usuario_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Filtros para la tabla `model_has_permissions`
--
ALTER TABLE `model_has_permissions`
  ADD CONSTRAINT `model_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE;

--
-- Filtros para la tabla `model_has_roles`
--
ALTER TABLE `model_has_roles`
  ADD CONSTRAINT `model_has_roles_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE;

--
-- Filtros para la tabla `preguntas`
--
ALTER TABLE `preguntas`
  ADD CONSTRAINT `preguntas_encuesta_id_foreign` FOREIGN KEY (`encuesta_id`) REFERENCES `encuestas` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `preguntas_tipo_pregunta_id_foreign` FOREIGN KEY (`tipo_pregunta_id`) REFERENCES `tipos_preguntas` (`id`) ON DELETE CASCADE;

--
-- Filtros para la tabla `respuestas`
--
ALTER TABLE `respuestas`
  ADD CONSTRAINT `respuestas_encuesta_id_foreign` FOREIGN KEY (`encuesta_id`) REFERENCES `encuestas` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `respuestas_pregunta_id_foreign` FOREIGN KEY (`pregunta_id`) REFERENCES `preguntas` (`id`) ON DELETE CASCADE;

--
-- Filtros para la tabla `role_has_permissions`
--
ALTER TABLE `role_has_permissions`
  ADD CONSTRAINT `role_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `role_has_permissions_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
