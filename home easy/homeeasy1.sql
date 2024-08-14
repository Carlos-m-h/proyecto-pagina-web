-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1:3306
-- Tiempo de generación: 14-08-2024 a las 14:32:46
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
-- Base de datos: `homeeasy1`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `contacto`
--

DROP TABLE IF EXISTS `contacto`;
CREATE TABLE IF NOT EXISTS `contacto` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `asunto` varchar(255) NOT NULL,
  `mensaje` text NOT NULL,
  `fecha_contacto` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `id_usuario` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `id_usuario` (`id_usuario`)
) ENGINE=MyISAM AUTO_INCREMENT=1003 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `contacto`
--

INSERT INTO `contacto` (`id`, `nombre`, `email`, `asunto`, `mensaje`, `fecha_contacto`, `id_usuario`) VALUES
(1002, 'vladimir herrera', 'siberiano79@gmail.com', 'mas información sobre valores', 'Asunto: Cotización de Hormigón para Proyecto de Construcción\r\n\r\nFecha: 10 de marzo de 2023\r\n\r\nDestinatario: Sr. Juan Pérez, Gerente de Construcción\r\n\r\nRemitente: Hormigones S.A., Departamento de Ventas\r\n\r\nEstimado Sr. Pérez,\r\n\r\nLe agradecemos su interés en nuestros productos y servicios de hormigón para su proyecto de construcción en la calle Principal 123, en la ciudad de Buenos Aires. A continuación, le presentamos nuestra cotización detallada para el suministro de hormigón para su proyecto.\r\n\r\nDetalles del Proyecto:\r\n\r\nTipo de hormigón requerido: Hormigón de alta resistencia (H-30)\r\nCantidad requerida: 500 m³\r\nFecha de entrega: 20 de marzo de 2023', '2024-08-13 12:49:55', 12);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cotizacion`
--

DROP TABLE IF EXISTS `cotizacion`;
CREATE TABLE IF NOT EXISTS `cotizacion` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) NOT NULL,
  `direccion` varchar(255) NOT NULL,
  `email` varchar(100) NOT NULL,
  `telefono` varchar(20) DEFAULT NULL,
  `cantidad_m3` decimal(10,2) NOT NULL,
  `precio_m3` decimal(10,2) NOT NULL,
  `total` decimal(10,2) GENERATED ALWAYS AS ((`cantidad_m3` * `precio_m3`)) STORED,
  `id_usuario` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `id_usuario` (`id_usuario`)
) ENGINE=MyISAM AUTO_INCREMENT=1153 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `cotizacion`
--

INSERT INTO `cotizacion` (`id`, `nombre`, `direccion`, `email`, `telefono`, `cantidad_m3`, `precio_m3`, `id_usuario`) VALUES
(1150, 'vladimir herrera', 'marquez 249 departamento 12', 'siberiano7919@gmail.com', '9990887784', '30.00', '129990.00', 12),
(1149, 'carlos muñoz', 'san martin 550 departamento 10', 'siberiano79@gmail.com', '9990887784', '12.00', '149990.00', 12),
(1151, 'vladimir herrera', 'sasasa', 'siberiano79@gmail.com', '9990887784', '122.00', '129990.00', 123),
(1152, 'vladimir herrera', '12344444', 'siberiano79@gmail.com', '9990887784', '30.00', '149990.00', 123);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `registro_inicio`
--

DROP TABLE IF EXISTS `registro_inicio`;
CREATE TABLE IF NOT EXISTS `registro_inicio` (
  `user_id` int NOT NULL AUTO_INCREMENT,
  `user_name` varchar(255) NOT NULL,
  `user_password` varchar(255) NOT NULL,
  `user_email` varchar(255) NOT NULL,
  `user_token` varchar(255) DEFAULT NULL COMMENT 'Token for user account verification or user password reset.',
  `user_status` int NOT NULL DEFAULT '0' COMMENT '0 = OK, 1 = Account verification required, 2 = Password reset requested.',
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `registro_inicio`
--

INSERT INTO `registro_inicio` (`user_id`, `user_name`, `user_password`, `user_email`, `user_token`, `user_status`) VALUES
(8, 'carlos', '5994471abb01112afcc18159f6cc74b4f511b99806da59b3caf5a9c173cacfc5', 'siberiano7919@gmail.com', 'fd6136bedf8108fcebbab5ac49f613b8126297d4', 2),
(9, 'vladimir', '5994471abb01112afcc18159f6cc74b4f511b99806da59b3caf5a9c173cacfc5', 'siberiano79@gmail.com', 'bc943b9cde4dcdcab635d3486e73ec285a028329', 0),
(10, 'matias', '5994471abb01112afcc18159f6cc74b4f511b99806da59b3caf5a9c173cacfc5', 'matias123@gmail.com', 'c4f9bb7ca3b39a43d6fb2ef4e506989101e0bb4c', 0),
(11, 'ZAP', '94f173f4b39c02cbc426a652756eab754b9c2c67bd9c3b4efcbbc90edea005a4', 'zaproxy@example.com', '5a680a57fda8fad653a5b6ba27ce714bc3b0f978', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `stock`
--

DROP TABLE IF EXISTS `stock`;
CREATE TABLE IF NOT EXISTS `stock` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nombre_producto` varchar(100) NOT NULL,
  `cantidad` int NOT NULL,
  `precio_unitario` decimal(10,2) NOT NULL,
  `id_usuario` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `id_usuario` (`id_usuario`)
) ENGINE=MyISAM AUTO_INCREMENT=728 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `stock`
--

INSERT INTO `stock` (`id`, `nombre_producto`, `cantidad`, `precio_unitario`, `id_usuario`) VALUES
(726, 'zac', 20, '32000.00', 12),
(727, 'mack', 15, '32000.00', 12);

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `total_stock`
-- (Véase abajo para la vista actual)
--
DROP VIEW IF EXISTS `total_stock`;
CREATE TABLE IF NOT EXISTS `total_stock` (
`id` int
,`nombre_producto` varchar(100)
,`cantidad` int
,`precio_unitario` decimal(10,2)
,`total_valor` decimal(20,2)
);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

DROP TABLE IF EXISTS `usuarios`;
CREATE TABLE IF NOT EXISTS `usuarios` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `contraseña` char(64) NOT NULL,
  `fecha_registro` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `rol` enum('usuario','admin') NOT NULL DEFAULT 'usuario',
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`)
) ENGINE=MyISAM AUTO_INCREMENT=89 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` (`id`, `nombre`, `email`, `contraseña`, `fecha_registro`, `rol`) VALUES
(30, 'ZAP', '\\WEB-INF\\web.xml', 'ZAP', '1970-01-01 03:00:00', 'usuario'),
(29, 'ZAP', '/WEB-INF/web.xml', 'ZAP', '1970-01-01 03:00:00', 'usuario'),
(28, 'ZAP', 'WEB-INF\\web.xml', 'ZAP', '1970-01-01 03:00:00', 'usuario'),
(27, 'ZAP', 'WEB-INF/web.xml', 'ZAP', '1970-01-01 03:00:00', 'usuario'),
(25, 'ZAP', 'c:/', 'ZAP', '1970-01-01 03:00:00', 'usuario'),
(26, 'ZAP', 'c:\\', 'ZAP', '1970-01-01 03:00:00', 'usuario'),
(23, 'ZAP', '/', 'ZAP', '1970-01-01 03:00:00', 'usuario'),
(24, 'ZAP', '../../../../../../../../../../../../../../../../', 'ZAP', '1970-01-01 03:00:00', 'usuario'),
(22, 'ZAP', '../../../../../../../../../../../../../../../../etc/passwd', 'ZAP', '1970-01-01 03:00:00', 'usuario'),
(21, 'ZAP', '/etc/passwd', 'ZAP', '1970-01-01 03:00:00', 'usuario'),
(20, 'ZAP', '..\\..\\..\\..\\..\\..\\..\\..\\..\\..\\..\\..\\..\\..\\..\\..\\Windows\\system.ini', 'ZAP', '1970-01-01 03:00:00', 'usuario'),
(19, 'ZAP', 'c:\\Windows\\system.ini', 'ZAP', '1970-01-01 03:00:00', 'usuario'),
(18, 'ZAP', '../../../../../../../../../../../../../../../../Windows/system.ini', 'ZAP', '1970-01-01 03:00:00', 'usuario'),
(16, 'ZAP', 'ZAP', 'ZAP', '1970-01-01 03:00:00', 'usuario'),
(17, 'ZAP', 'c:/Windows/system.ini', 'ZAP', '1970-01-01 03:00:00', 'usuario'),
(31, 'ZAP', 'thishouldnotexistandhopefullyitwillnot', 'ZAP', '1970-01-01 03:00:00', 'usuario'),
(32, 'ZAP', 'http://www.google.com/', 'ZAP', '1970-01-01 03:00:00', 'usuario'),
(33, 'ZAP', 'http://www.google.com:80/', 'ZAP', '1970-01-01 03:00:00', 'usuario'),
(34, 'ZAP', 'http://www.google.com', 'ZAP', '1970-01-01 03:00:00', 'usuario'),
(35, 'ZAP', 'http://www.google.com/search?q=ZAP', 'ZAP', '1970-01-01 03:00:00', 'usuario'),
(36, 'ZAP', 'http://www.google.com:80/search?q=ZAP', 'ZAP', '1970-01-01 03:00:00', 'usuario'),
(37, 'ZAP', 'www.google.com/', 'ZAP', '1970-01-01 03:00:00', 'usuario'),
(38, 'ZAP', 'www.google.com:80/', 'ZAP', '1970-01-01 03:00:00', 'usuario'),
(39, 'ZAP', 'www.google.com', 'ZAP', '1970-01-01 03:00:00', 'usuario'),
(40, 'ZAP', 'www.google.com/search?q=ZAP', 'ZAP', '1970-01-01 03:00:00', 'usuario'),
(41, 'ZAP', 'www.google.com:80/search?q=ZAP', 'ZAP', '1970-01-01 03:00:00', 'usuario'),
(42, 'ZAP', '8993936981209869.owasp.org', 'ZAP', '1970-01-01 03:00:00', 'usuario'),
(43, 'ZAP', 'http://8993936981209869.owasp.org', 'ZAP', '1970-01-01 03:00:00', 'usuario'),
(44, 'ZAP', 'https://8993936981209869.owasp.org', 'ZAP', '1970-01-01 03:00:00', 'usuario'),
(45, 'ZAP', 'https://8993936981209869%2eowasp%2eorg', 'ZAP', '1970-01-01 03:00:00', 'usuario'),
(46, 'ZAP', '5;URL=\'https://8993936981209869.owasp.org\'', 'ZAP', '1970-01-01 03:00:00', 'usuario'),
(47, 'ZAP', 'URL=\'http://8993936981209869.owasp.org\'', 'ZAP', '1970-01-01 03:00:00', 'usuario'),
(48, 'ZAP', 'http://\\8993936981209869.owasp.org', 'ZAP', '1970-01-01 03:00:00', 'usuario'),
(49, 'ZAP', 'https://\\8993936981209869.owasp.org', 'ZAP', '1970-01-01 03:00:00', 'usuario'),
(50, 'ZAP', '//8993936981209869.owasp.org', 'ZAP', '1970-01-01 03:00:00', 'usuario'),
(51, 'ZAP', '<!--#EXEC cmd=\"ls /\"-->', 'ZAP', '1970-01-01 03:00:00', 'usuario'),
(52, 'ZAP', '\"><!--#EXEC cmd=\"ls /\"--><', 'ZAP', '1970-01-01 03:00:00', 'usuario'),
(53, 'ZAP', '<!--#EXEC cmd=\"dir \\\"-->', 'ZAP', '1970-01-01 03:00:00', 'usuario'),
(54, 'ZAP', '\"><!--#EXEC cmd=\"dir \\\"--><', 'ZAP', '1970-01-01 03:00:00', 'usuario'),
(55, 'ZAP', '0W45pz4p', 'ZAP', '1970-01-01 03:00:00', 'usuario'),
(56, 'ZAP', '<scrIpt>alert(1);</scRipt>', 'ZAP', '1970-01-01 03:00:00', 'usuario'),
(57, 'ZAP', 'x00<scrIpt>alert(1);</scRipt>', 'ZAP', '1970-01-01 03:00:00', 'usuario'),
(58, 'ZAP', '<img src=x onerror=prompt()>', 'ZAP', '1970-01-01 03:00:00', 'usuario'),
(59, 'ZAP', 'zApPX36sS', 'ZAP', '1970-01-01 03:00:00', 'usuario'),
(60, 'ZAP', '\'', 'ZAP', '1970-01-01 03:00:00', 'usuario'),
(61, 'ZAP', 'ZAP\'', 'ZAP', '1970-01-01 03:00:00', 'usuario'),
(62, 'ZAP', '\"', 'ZAP', '1970-01-01 03:00:00', 'usuario'),
(63, 'ZAP', 'ZAP\"', 'ZAP', '1970-01-01 03:00:00', 'usuario'),
(64, 'ZAP', ';', 'ZAP', '1970-01-01 03:00:00', 'usuario'),
(65, 'ZAP', 'ZAP;', 'ZAP', '1970-01-01 03:00:00', 'usuario'),
(66, 'ZAP', '\'(', 'ZAP', '1970-01-01 03:00:00', 'usuario'),
(67, 'ZAP', 'ZAP\'(', 'ZAP', '1970-01-01 03:00:00', 'usuario'),
(68, 'ZAP', 'ZAP AND 1=1 -- ', 'ZAP', '1970-01-01 03:00:00', 'usuario'),
(69, 'ZAP', 'ZAP\' AND \'1\'=\'1\' -- ', 'ZAP', '1970-01-01 03:00:00', 'usuario'),
(70, 'ZAP', 'ZAP\" AND \"1\"=\"1\" -- ', 'ZAP', '1970-01-01 03:00:00', 'usuario'),
(71, 'ZAP', 'ZAP AND 1=1', 'ZAP', '1970-01-01 03:00:00', 'usuario'),
(72, 'ZAP', 'ZAP\' AND \'1\'=\'1', 'ZAP', '1970-01-01 03:00:00', 'usuario'),
(73, 'ZAP', 'ZAP\" AND \"1\"=\"1', 'ZAP', '1970-01-01 03:00:00', 'usuario'),
(74, 'ZAP', 'ZAP UNION ALL select NULL -- ', 'ZAP', '1970-01-01 03:00:00', 'usuario'),
(75, 'ZAP', 'ZAP\' UNION ALL select NULL -- ', 'ZAP', '1970-01-01 03:00:00', 'usuario'),
(76, 'ZAP', 'ZAP\" UNION ALL select NULL -- ', 'ZAP', '1970-01-01 03:00:00', 'usuario'),
(77, 'ZAP', 'ZAP) UNION ALL select NULL -- ', 'ZAP', '1970-01-01 03:00:00', 'usuario'),
(78, 'ZAP', 'ZAP\') UNION ALL select NULL -- ', 'ZAP', '1970-01-01 03:00:00', 'usuario'),
(79, 'ZAP', 'ZAP / sleep(15) ', 'ZAP', '1970-01-01 03:00:00', 'usuario'),
(80, 'ZAP', 'ZAP\' / sleep(15) / \'', 'ZAP', '1970-01-01 03:00:00', 'usuario'),
(81, 'ZAP', 'ZAP\" / sleep(15) / \"', 'ZAP', '1970-01-01 03:00:00', 'usuario'),
(82, 'ZAP', 'ZAP and 0 in (select sleep(15) ) -- ', 'ZAP', '1970-01-01 03:00:00', 'usuario'),
(83, 'ZAP', 'ZAP\' and 0 in (select sleep(15) ) -- ', 'ZAP', '1970-01-01 03:00:00', 'usuario'),
(84, 'ZAP', 'ZAP\" and 0 in (select sleep(15) ) -- ', 'ZAP', '1970-01-01 03:00:00', 'usuario'),
(85, 'ZAP', 'ZAP where 0 in (select sleep(15) ) -- ', 'ZAP', '1970-01-01 03:00:00', 'usuario'),
(86, 'ZAP', 'ZAP\' where 0 in (select sleep(15) ) -- ', 'ZAP', '1970-01-01 03:00:00', 'usuario'),
(87, 'ZAP', 'ZAP\" where 0 in (select sleep(15) ) -- ', 'ZAP', '1970-01-01 03:00:00', 'usuario'),
(88, 'ZAP', 'ZAP or 0 in (select sleep(15) ) -- ', 'ZAP', '1970-01-01 03:00:00', 'usuario');

-- --------------------------------------------------------

--
-- Estructura para la vista `total_stock`
--
DROP TABLE IF EXISTS `total_stock`;

DROP VIEW IF EXISTS `total_stock`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `total_stock`  AS SELECT `s`.`id` AS `id`, `s`.`nombre_producto` AS `nombre_producto`, `s`.`cantidad` AS `cantidad`, `s`.`precio_unitario` AS `precio_unitario`, (`s`.`cantidad` * `s`.`precio_unitario`) AS `total_valor` FROM `stock` AS `s``s`  ;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
