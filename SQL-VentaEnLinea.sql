-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 30-06-2023 a las 23:32:12
-- Versión del servidor: 10.4.28-MariaDB
-- Versión de PHP: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `ventaproductosonline`
--
CREATE DATABASE IF NOT EXISTS `ventaproductosonline` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `ventaproductosonline`;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `calle`
--

DROP TABLE IF EXISTS `calle`;
CREATE TABLE `calle` (
  `id_calle` int(11) NOT NULL,
  `nombre` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `calle`
--

INSERT INTO `calle` (`id_calle`, `nombre`) VALUES
(1, 'Bauness'),
(2, 'San Martín'),
(3, 'Avenida cabildo'),
(4, 'Juramento'),
(5, 'Mendoza'),
(6, 'Gorriti'),
(7, 'Ceretti'),
(8, 'Altolaguirre'),
(9, 'Avenida Córdoba'),
(10, 'Alvarez Thomas');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `categorias`
--

DROP TABLE IF EXISTS `categorias`;
CREATE TABLE `categorias` (
  `id_categoria` int(11) NOT NULL,
  `nombre` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `categorias`
--

INSERT INTO `categorias` (`id_categoria`, `nombre`) VALUES
(1, 'Electrónica'),
(2, 'Hogar'),
(3, 'Indumentaria'),
(4, 'Electrodomésticos'),
(5, 'Juguetes');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `clientes`
--

DROP TABLE IF EXISTS `clientes`;
CREATE TABLE `clientes` (
  `id_cliente` int(11) NOT NULL,
  `nombre` varchar(50) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `telefono` varchar(20) DEFAULT NULL,
  `fecha_registro` date DEFAULT NULL,
  `id_calle` int(11) DEFAULT NULL,
  `altura` int(11) DEFAULT NULL,
  `piso` int(11) DEFAULT NULL,
  `departamento` varchar(10) DEFAULT NULL,
  `codigo_postal` varchar(10) DEFAULT NULL,
  `id_origen` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `clientes`
--

INSERT INTO `clientes` (`id_cliente`, `nombre`, `email`, `telefono`, `fecha_registro`, `id_calle`, `altura`, `piso`, `departamento`, `codigo_postal`, `id_origen`) VALUES
(1, 'Juan Pérez', 'juan@hotmail.com', '123456789', '2023-06-01', 1, 123, 2, 'A', '1234', 1),
(2, 'María López', 'maria@gmail.com', '987654321', '2023-06-02', 2, 456, 3, 'B', '5678', 2),
(3, 'Carlos Gómez', 'carlos@gmail.com', '555555555', '2023-06-03', 3, 789, 4, 'C', '9012', 2),
(4, 'Laura Rodríguez', 'laura@hotmail.com', '111111111', '2023-06-04', 4, 321, 5, 'D', '3456', 2),
(5, 'Andrés González', 'andres@gmail.com', '999999999', '2023-06-05', 5, 654, 6, 'E', '7890', 2),
(6, 'Ana Martínez', 'ana@gmail.com', '222222222', '2023-06-06', 5, 987, 7, 'F', '1234', 1),
(7, 'Luis Fernández', 'luis@hotmail.com', '888888888', '2023-06-07', 6, 654, 8, 'G', '5678', 2),
(8, 'Carolina Castro', 'carolina@gmail.com', '333333333', '2023-06-08', 6, 321, 9, 'H', '9012', 2),
(9, 'Federico Ramírez', 'federico@gmail.com', '777777777', '2023-06-09', 7, 789, 10, 'I', '3456', 1),
(10, 'Mariana Silva', 'mariana@gmail.com', '444444444', '2023-06-10', 8, 123, 11, 'J', '7890', 2);

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `control_stock`
-- (Véase abajo para la vista actual)
--
DROP VIEW IF EXISTS `control_stock`;
CREATE TABLE `control_stock` (
`id_producto` int(11)
,`nombre` varchar(50)
,`stock` int(11)
,`vendidas` decimal(32,0)
,`disponible` decimal(33,0)
);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `detalles_pedido`
--

DROP TABLE IF EXISTS `detalles_pedido`;
CREATE TABLE `detalles_pedido` (
  `id_detalles_pedido` int(11) NOT NULL,
  `id_producto` int(11) DEFAULT NULL,
  `numero_ticket` int(11) DEFAULT NULL,
  `cantidad` int(11) DEFAULT NULL,
  `precio_a_la_fecha` decimal(10,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `detalles_pedido`
--

INSERT INTO `detalles_pedido` (`id_detalles_pedido`, `id_producto`, `numero_ticket`, `cantidad`, `precio_a_la_fecha`) VALUES
(1, 1, 1, 2, 39000.00),
(2, 1, 2, 1, 40000.00),
(3, 2, 2, 6, 78000.00),
(4, 2, 2, 2, 78000.00),
(5, 3, 3, 8, 2000.00),
(6, 3, 4, 3, 2000.00),
(7, 3, 5, 3, 2000.00),
(8, 10, 5, 3, 25000.00),
(9, 4, 5, 6, 1000.00),
(10, 5, 6, 20, 8000.00),
(11, 3, 7, 5, 2000.00),
(12, 10, 7, 3, 25000.00),
(13, 8, 8, 5, 2000.00),
(14, 7, 9, 1, 65000.00),
(15, 6, 10, 1, 85000.00);

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `detalle_ventas`
-- (Véase abajo para la vista actual)
--
DROP VIEW IF EXISTS `detalle_ventas`;
CREATE TABLE `detalle_ventas` (
`numero_ticket` int(11)
,`nombre` varchar(50)
,`id_producto` int(11)
,`cantidad` int(11)
,`precio_producto` decimal(10,2)
,`precio_a_la_fecha` decimal(10,2)
,`venta_por_producto` decimal(42,2)
,`ventas_por_ticket_cliente` decimal(42,2)
,`total_ventas` decimal(42,2)
);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `estado_pedido`
--

DROP TABLE IF EXISTS `estado_pedido`;
CREATE TABLE `estado_pedido` (
  `id_estado_pedido` int(11) NOT NULL,
  `nombre` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `estado_pedido`
--

INSERT INTO `estado_pedido` (`id_estado_pedido`, `nombre`) VALUES
(1, 'En envío'),
(2, 'En preparación'),
(3, 'Entregado'),
(4, 'Cancelado'),
(5, 'Entrega fallida');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `metodo_envio`
--

DROP TABLE IF EXISTS `metodo_envio`;
CREATE TABLE `metodo_envio` (
  `id_metodo_envio` int(11) NOT NULL,
  `nombre` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `metodo_envio`
--

INSERT INTO `metodo_envio` (`id_metodo_envio`, `nombre`) VALUES
(1, 'Miniflete'),
(2, 'Flete'),
(3, 'Moto');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `origen`
--

DROP TABLE IF EXISTS `origen`;
CREATE TABLE `origen` (
  `id_origen` int(11) NOT NULL,
  `nombre_origen` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `origen`
--

INSERT INTO `origen` (`id_origen`, `nombre_origen`) VALUES
(1, 'Facebook'),
(2, 'Instagram');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pedidos`
--

DROP TABLE IF EXISTS `pedidos`;
CREATE TABLE `pedidos` (
  `numero_ticket` int(11) NOT NULL,
  `id_cliente` int(11) NOT NULL,
  `fecha_pedido` date NOT NULL,
  `id_metodo_envio` int(11) NOT NULL,
  `id_estado_pedido` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `pedidos`
--

INSERT INTO `pedidos` (`numero_ticket`, `id_cliente`, `fecha_pedido`, `id_metodo_envio`, `id_estado_pedido`) VALUES
(1, 1, '2023-06-20', 1, 1),
(2, 2, '2023-06-21', 1, 1),
(3, 2, '2023-06-22', 1, 2),
(4, 3, '2023-06-22', 1, 2),
(5, 3, '2023-06-22', 1, 3),
(6, 4, '2023-06-22', 1, 3),
(7, 5, '2023-06-22', 1, 4),
(8, 6, '2023-06-22', 1, 4),
(9, 7, '2023-06-22', 1, 5),
(10, 8, '2023-06-22', 1, 5);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `productos`
--

DROP TABLE IF EXISTS `productos`;
CREATE TABLE `productos` (
  `id_producto` int(11) NOT NULL,
  `nombre` varchar(50) NOT NULL,
  `descripcion` varchar(200) DEFAULT NULL,
  `precio` decimal(10,2) NOT NULL,
  `id_categoria` int(11) NOT NULL,
  `unidades` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `productos`
--

INSERT INTO `productos` (`id_producto`, `nombre`, `descripcion`, `precio`, `id_categoria`, `unidades`) VALUES
(1, 'Televisor', 'Televisor LED de 50 pulgadas', 20000.00, 1, 30),
(2, 'Lavadora', 'Lavadora de carga frontal de 10 kg', 78000.00, 4, 34),
(3, 'Vestido', 'Vestido rojo con volados', 2000.00, 3, 43),
(4, 'Camiseta', 'Camiseta de algodón', 1000.00, 3, 34),
(5, 'Zapatillas', 'Zapatillas deportivas', 8000.00, 3, 15),
(6, 'Refrigerador', 'Refrigerador de dos puertas', 85000.00, 4, 50),
(7, 'Sofá', 'Sofá de tres plazas', 65000.00, 2, 20),
(8, 'Rompecabezas', 'Rompecabezas de 1000 piezas', 2000.00, 5, 100),
(9, 'Colchón Princesa', 'Colchón 2 plazas', 30000.00, 2, 50),
(10, 'zapato', 'Taco aguja negro', 25000.00, 3, 50);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tarjetas`
--

DROP TABLE IF EXISTS `tarjetas`;
CREATE TABLE `tarjetas` (
  `id_cliente` int(11) NOT NULL,
  `tipo_tarjeta` varchar(10) NOT NULL,
  `marca` varchar(10) NOT NULL,
  `numero_tarjeta` varchar(20) NOT NULL,
  `fecha_vencimiento` date NOT NULL,
  `clave_seguridad` varchar(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `tarjetas`
--

INSERT INTO `tarjetas` (`id_cliente`, `tipo_tarjeta`, `marca`, `numero_tarjeta`, `fecha_vencimiento`, `clave_seguridad`) VALUES
(3, 'C', 'M', '1111222233334444', '2025-12-31', '123'),
(1, 'C', 'V', '222233334444323', '2024-06-30', '456'),
(4, 'C', 'V', '2222333344445555', '2024-06-30', '456'),
(2, 'C', 'M', '3333444455226666', '2026-03-15', '789'),
(5, 'C', 'M', '3333444455556666', '2026-03-15', '789'),
(5, 'D', 'V', '4444555566667777', '2023-09-01', '012'),
(6, 'C', 'M', '5555666677778888', '2025-02-28', '345'),
(6, 'D', 'V', '6666777788889999', '2024-11-30', '678'),
(7, 'C', 'M', '7777888899990000', '2026-07-31', '901'),
(7, 'D', 'V', '8888999900001111', '2023-12-31', '234');

-- --------------------------------------------------------

--
-- Estructura para la vista `control_stock`
--
DROP TABLE IF EXISTS `control_stock`;

DROP VIEW IF EXISTS `control_stock`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `control_stock`  AS SELECT `p`.`id_producto` AS `id_producto`, `p`.`nombre` AS `nombre`, `p`.`unidades` AS `stock`, coalesce(sum(`d`.`cantidad`),0) AS `vendidas`, `p`.`unidades`- coalesce(sum(`d`.`cantidad`),0) AS `disponible` FROM (`productos` `p` left join `detalles_pedido` `d` on(`p`.`id_producto` = `d`.`id_producto`)) GROUP BY `p`.`id_producto` ;

-- --------------------------------------------------------

--
-- Estructura para la vista `detalle_ventas`
--
DROP TABLE IF EXISTS `detalle_ventas`;

DROP VIEW IF EXISTS `detalle_ventas`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `detalle_ventas`  AS SELECT `t`.`numero_ticket` AS `numero_ticket`, `c`.`nombre` AS `nombre`, `dp`.`id_producto` AS `id_producto`, `dp`.`cantidad` AS `cantidad`, `p`.`precio` AS `precio_producto`, `dp`.`precio_a_la_fecha` AS `precio_a_la_fecha`, sum(`dp`.`cantidad` * `dp`.`precio_a_la_fecha`) AS `venta_por_producto`, sum(`dp`.`cantidad` * `dp`.`precio_a_la_fecha`) over ( partition by `c`.`id_cliente`) AS `ventas_por_ticket_cliente`, sum(`dp`.`cantidad` * `dp`.`precio_a_la_fecha`) over () AS `total_ventas` FROM (((`detalles_pedido` `dp` join `pedidos` `t` on(`dp`.`numero_ticket` = `t`.`numero_ticket`)) join `clientes` `c` on(`t`.`id_cliente` = `c`.`id_cliente`)) join `productos` `p` on(`dp`.`id_producto` = `p`.`id_producto`)) GROUP BY `t`.`numero_ticket`, `c`.`nombre`, `dp`.`id_producto`, `dp`.`cantidad`, `p`.`precio`, `dp`.`precio_a_la_fecha` ;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `calle`
--
ALTER TABLE `calle`
  ADD PRIMARY KEY (`id_calle`);

--
-- Indices de la tabla `categorias`
--
ALTER TABLE `categorias`
  ADD PRIMARY KEY (`id_categoria`);

--
-- Indices de la tabla `clientes`
--
ALTER TABLE `clientes`
  ADD PRIMARY KEY (`id_cliente`),
  ADD KEY `id_calle` (`id_calle`),
  ADD KEY `id_origen` (`id_origen`);

--
-- Indices de la tabla `detalles_pedido`
--
ALTER TABLE `detalles_pedido`
  ADD PRIMARY KEY (`id_detalles_pedido`),
  ADD KEY `id_producto` (`id_producto`),
  ADD KEY `numero_ticket` (`numero_ticket`);

--
-- Indices de la tabla `estado_pedido`
--
ALTER TABLE `estado_pedido`
  ADD PRIMARY KEY (`id_estado_pedido`);

--
-- Indices de la tabla `metodo_envio`
--
ALTER TABLE `metodo_envio`
  ADD PRIMARY KEY (`id_metodo_envio`);

--
-- Indices de la tabla `origen`
--
ALTER TABLE `origen`
  ADD PRIMARY KEY (`id_origen`);

--
-- Indices de la tabla `pedidos`
--
ALTER TABLE `pedidos`
  ADD PRIMARY KEY (`numero_ticket`),
  ADD KEY `id_cliente` (`id_cliente`),
  ADD KEY `id_metodo_envio` (`id_metodo_envio`),
  ADD KEY `id_estado_pedido` (`id_estado_pedido`);

--
-- Indices de la tabla `productos`
--
ALTER TABLE `productos`
  ADD PRIMARY KEY (`id_producto`),
  ADD KEY `id_categoria` (`id_categoria`);

--
-- Indices de la tabla `tarjetas`
--
ALTER TABLE `tarjetas`
  ADD PRIMARY KEY (`numero_tarjeta`),
  ADD KEY `id_cliente` (`id_cliente`);

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `clientes`
--
ALTER TABLE `clientes`
  ADD CONSTRAINT `clientes_ibfk_1` FOREIGN KEY (`id_calle`) REFERENCES `calle` (`id_calle`),
  ADD CONSTRAINT `clientes_ibfk_2` FOREIGN KEY (`id_origen`) REFERENCES `origen` (`id_origen`);

--
-- Filtros para la tabla `detalles_pedido`
--
ALTER TABLE `detalles_pedido`
  ADD CONSTRAINT `detalles_pedido_ibfk_1` FOREIGN KEY (`id_producto`) REFERENCES `productos` (`id_producto`),
  ADD CONSTRAINT `detalles_pedido_ibfk_2` FOREIGN KEY (`numero_ticket`) REFERENCES `pedidos` (`numero_ticket`);

--
-- Filtros para la tabla `pedidos`
--
ALTER TABLE `pedidos`
  ADD CONSTRAINT `pedidos_ibfk_1` FOREIGN KEY (`id_cliente`) REFERENCES `clientes` (`id_cliente`),
  ADD CONSTRAINT `pedidos_ibfk_2` FOREIGN KEY (`id_metodo_envio`) REFERENCES `metodosenvio` (`id_metodo_envio`),
  ADD CONSTRAINT `pedidos_ibfk_3` FOREIGN KEY (`id_estado_pedido`) REFERENCES `estadospedido` (`id_estado_pedido`);

--
-- Filtros para la tabla `productos`
--
ALTER TABLE `productos`
  ADD CONSTRAINT `productos_ibfk_1` FOREIGN KEY (`id_categoria`) REFERENCES `categorias` (`id_categoria`);

--
-- Filtros para la tabla `tarjetas`
--
ALTER TABLE `tarjetas`
  ADD CONSTRAINT `tarjetas_ibfk_1` FOREIGN KEY (`id_cliente`) REFERENCES `clientes` (`id_cliente`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
