-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1:3306
-- Tiempo de generación: 08-09-2023 a las 16:26:41
-- Versión del servidor: 8.0.31
-- Versión de PHP: 8.2.0

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
  `genero` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `edad` int DEFAULT NULL,
  `domicilio` text COLLATE utf8mb4_unicode_ci,
  `ciudad` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `cp` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `telefono` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `celular` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `usuario_id` int UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `datos_generales_usuario_id_foreign` (`usuario_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `encuestas`
--

DROP TABLE IF EXISTS `encuestas`;
CREATE TABLE IF NOT EXISTS `encuestas` (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `titulo` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `descripcion` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
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
  `valor_respuesta` text COLLATE utf8mb4_unicode_ci,
  `usuario_id` int UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `encuesta_usuarios_encuesta_id_foreign` (`encuesta_id`),
  KEY `encuesta_usuarios_pregunta_id_foreign` (`pregunta_id`),
  KEY `encuesta_usuarios_respuesta_id_foreign` (`respuesta_id`),
  KEY `encuesta_usuarios_usuario_id_foreign` (`usuario_id`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `failed_jobs`
--

DROP TABLE IF EXISTS `failed_jobs`;
CREATE TABLE IF NOT EXISTS `failed_jobs` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `uuid` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
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
  `migration` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
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
  `model_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
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
  `model_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
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
(1, 'App\\Models\\User', 6);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `password_resets`
--

DROP TABLE IF EXISTS `password_resets`;
CREATE TABLE IF NOT EXISTS `password_resets` (
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
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
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `guard_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
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
  `titulo` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `encuesta_id` int UNSIGNED DEFAULT NULL,
  `tipo_pregunta_id` int UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `preguntas_encuesta_id_foreign` (`encuesta_id`),
  KEY `preguntas_tipo_pregunta_id_foreign` (`tipo_pregunta_id`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

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
(25, 'Posgrados que demanda preferentemente su empresa u organismo', 2, 1, '2023-09-07 23:27:03', '2023-09-07 23:27:03');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `respuestas`
--

DROP TABLE IF EXISTS `respuestas`;
CREATE TABLE IF NOT EXISTS `respuestas` (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `texto` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `pregunta_id` int UNSIGNED DEFAULT NULL,
  `encuesta_id` int UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `respuestas_pregunta_id_foreign` (`pregunta_id`),
  KEY `respuestas_encuesta_id_foreign` (`encuesta_id`)
) ENGINE=InnoDB AUTO_INCREMENT=83 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

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
(82, 'Capacidad de liderazgo', 24, 2, '2023-09-07 23:26:27', '2023-09-07 23:26:27');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `roles`
--

DROP TABLE IF EXISTS `roles`;
CREATE TABLE IF NOT EXISTS `roles` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `guard_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
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
  `nombre` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
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
  `nombre` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
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
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `es_empleado` tinyint DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`, `es_empleado`) VALUES
(1, 'Leo Maldonado', 'lrmaldo@gmail.com', NULL, '$2y$10$5nGv95Rz8LlYuWqZJcLR8uU8.xR0Tammjeaxwn/fPabx7xnwY0mEe', NULL, '2023-09-07 17:44:59', '2023-09-07 17:44:59', NULL),
(6, 'Lissette Rodriguez Najera', 'lissetterodriguezn@gmail.com', NULL, '$2y$10$et44WvvYnFVdY0XFv3tKtuuOaE1vS5pszN/PwlUZMDsFdlZMvoDyS', NULL, '2023-09-08 16:13:23', '2023-09-08 16:13:23', NULL);

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
