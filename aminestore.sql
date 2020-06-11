-- phpMyAdmin SQL Dump
-- version 4.8.3
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1
-- Généré le :  mar. 26 mai 2020 à 14:16
-- Version du serveur :  10.1.36-MariaDB
-- Version de PHP :  7.2.11

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données :  `aminestore`
--

-- --------------------------------------------------------

--
-- Structure de la table `administracion`
--

CREATE TABLE `administracion` (
  `id` int(11) NOT NULL,
  `nombre` varchar(30) NOT NULL,
  `apellido` varchar(30) NOT NULL,
  `email` varchar(30) NOT NULL,
  `clave` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `administracion`
--

INSERT INTO `administracion` (`id`, `nombre`, `apellido`, `email`, `clave`) VALUES
(1, 'admin', 'admin', 'admin@gmail.com', 'admin'),
(2, 'amine', 'adm', 'amineadmin@gmail.com', 'amine');

-- --------------------------------------------------------

--
-- Structure de la table `categorias`
--

CREATE TABLE `categorias` (
  `id` int(11) NOT NULL,
  `nombre` varchar(20) COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Déchargement des données de la table `categorias`
--

INSERT INTO `categorias` (`id`, `nombre`) VALUES
(1, 'general'),
(2, 'moviles'),
(3, 'componentes');

-- --------------------------------------------------------

--
-- Structure de la table `contacto`
--

CREATE TABLE `contacto` (
  `nombre` text NOT NULL,
  `email` text NOT NULL,
  `mensaje` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `contacto`
--

INSERT INTO `contacto` (`nombre`, `email`, `mensaje`) VALUES
('amine', 'amine@gmail.com', 'test');

-- --------------------------------------------------------

--
-- Structure de la table `estado_pedido`
--

CREATE TABLE `estado_pedido` (
  `id` int(11) NOT NULL,
  `nombre` varchar(24) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `estado_pedido`
--

INSERT INTO `estado_pedido` (`id`, `nombre`) VALUES
(1, 'Pending'),
(2, 'Delivered'),
(3, 'Sent'),
(4, 'Cancelled');

-- --------------------------------------------------------

--
-- Structure de la table `pedidos`
--

CREATE TABLE `pedidos` (
  `id` int(11) NOT NULL,
  `uid` int(11) NOT NULL,
  `direccion` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `telefono` int(9) NOT NULL,
  `tarjeta` varchar(16) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `cantidad` double NOT NULL,
  `estado_pedido` int(11) NOT NULL,
  `fech` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `pedidos`
--

INSERT INTO `pedidos` (`id`, `uid`, `direccion`, `telefono`, `tarjeta`, `cantidad`, `estado_pedido`, `fech`) VALUES
(1, 1, 'Burjassot 1958', 123456781, '2244567891234567', 3950, 4, '2020-05-26'),
(2, 1, 'Burjassot 195', 123456781, '2244567891234567', 200, 1, '2020-05-26'),
(3, 5, 'valencia 530', 123456789, '1234567887654321', 1000, 1, '2020-05-26'),
(4, 5, 'valencia 530', 123456789, '1234567887654321', 1000, 1, '2020-05-26'),
(5, 6, 'burja', 123456789, '1234567887654321', 3750, 1, '2020-05-26');

-- --------------------------------------------------------

--
-- Structure de la table `pedido_producto`
--

CREATE TABLE `pedido_producto` (
  `id_pedido` int(11) NOT NULL,
  `id_producto` int(11) NOT NULL,
  `cantidad` int(11) NOT NULL,
  `precio` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `pedido_producto`
--

INSERT INTO `pedido_producto` (`id_pedido`, `id_producto`, `cantidad`, `precio`) VALUES
(1, 7, 5, 3750),
(1, 8, 2, 200),
(2, 8, 2, 200),
(3, 4, 1, 100),
(3, 2, 1, 900),
(4, 9, 2, 100),
(4, 2, 1, 900),
(5, 7, 5, 3750);

-- --------------------------------------------------------

--
-- Structure de la table `productos`
--

CREATE TABLE `productos` (
  `id` int(11) NOT NULL,
  `nombre` varchar(20) COLLATE utf8_bin NOT NULL,
  `descripcion` varchar(50) COLLATE utf8_bin NOT NULL,
  `precio` int(11) NOT NULL,
  `existencias` int(11) NOT NULL,
  `marca` varchar(20) COLLATE utf8_bin NOT NULL,
  `urlimagen` varchar(50) COLLATE utf8_bin NOT NULL,
  `idcategoria` int(11) NOT NULL,
  `destacado` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Déchargement des données de la table `productos`
--

INSERT INTO `productos` (`id`, `nombre`, `descripcion`, `precio`, `existencias`, `marca`, `urlimagen`, `idcategoria`, `destacado`) VALUES
(1, 'Phone 1', 'Description...', 100, 500, 'apple', 'img/movil1.jpg', 2, 1),
(2, 'Laptop', 'Descriptionn...', 900, 101, 'lenovo', 'img/pc.png', 1, 0),
(3, 'Phone 4', 'Description...', 100, 500, 'apple', 'img/movil4.jpg', 2, 1),
(4, 'Phone 2', 'Description...', 100, 500, 'apple', 'img/movil2.jpg', 2, 1),
(5, 'Phone 3', 'Description...', 100, 500, 'apple', 'img/movil3.jpg', 2, 1),
(7, 'TV', 'Description...', 750, 5, 'samsung', 'img/telev.jpg', 1, 0),
(8, 'SDD', 'Description...', 100, 10, 'lenovo', 'img/ssd.png', 3, 0),
(9, 'RAM', 'Description...', 50, 500, 'HP', 'img/ram.jpg', 3, 0);

-- --------------------------------------------------------

--
-- Structure de la table `usuario`
--

CREATE TABLE `usuario` (
  `id` int(11) NOT NULL,
  `nombre` varchar(100) COLLATE utf8_bin NOT NULL,
  `login` varchar(20) COLLATE utf8_bin NOT NULL,
  `password` varchar(10) COLLATE utf8_bin NOT NULL,
  `email` varchar(100) COLLATE utf8_bin NOT NULL,
  `direccion` varchar(100) COLLATE utf8_bin NOT NULL,
  `telefono` int(9) NOT NULL,
  `tarjeta` varchar(16) COLLATE utf8_bin NOT NULL,
  `activo` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Déchargement des données de la table `usuario`
--

INSERT INTO `usuario` (`id`, `nombre`, `login`, `password`, `email`, `direccion`, `telefono`, `tarjeta`, `activo`) VALUES
(1, 'Amine', 'amine', 'amine', 'aminehrm@gmail.com', 'Burjassot 195', 123456781, '2244567891234567', 1),
(5, 'user', 'userinfo', 'user', 'user@user.com', 'valencia 530', 123456789, '1234567887654321', 1),
(6, 'yassine', 'yassinox', 'yassine', 'yassine@gmail.com', 'burja', 123456789, '1234567887654321', 1);

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `administracion`
--
ALTER TABLE `administracion`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `categorias`
--
ALTER TABLE `categorias`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `estado_pedido`
--
ALTER TABLE `estado_pedido`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `pedidos`
--
ALTER TABLE `pedidos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK_PEDIDO_ESTADO_PEDIDO` (`estado_pedido`),
  ADD KEY `FK_PEDIDO_USUARIO` (`uid`);

--
-- Index pour la table `pedido_producto`
--
ALTER TABLE `pedido_producto`
  ADD KEY `FK_PEDIDOPRODUCTO_PRODUCTO` (`id_producto`),
  ADD KEY `FK_PEDIDOPRODUCTO_PEDIDOS` (`id_pedido`);

--
-- Index pour la table `productos`
--
ALTER TABLE `productos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK_IDCATEGORIA_CATEGORIA` (`idcategoria`);

--
-- Index pour la table `usuario`
--
ALTER TABLE `usuario`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `administracion`
--
ALTER TABLE `administracion`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT pour la table `categorias`
--
ALTER TABLE `categorias`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT pour la table `estado_pedido`
--
ALTER TABLE `estado_pedido`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT pour la table `productos`
--
ALTER TABLE `productos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT pour la table `usuario`
--
ALTER TABLE `usuario`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `pedidos`
--
ALTER TABLE `pedidos`
  ADD CONSTRAINT `FK_PEDIDO_ESTADO_PEDIDO` FOREIGN KEY (`estado_pedido`) REFERENCES `estado_pedido` (`id`),
  ADD CONSTRAINT `FK_PEDIDO_USUARIO` FOREIGN KEY (`uid`) REFERENCES `usuario` (`id`);

--
-- Contraintes pour la table `pedido_producto`
--
ALTER TABLE `pedido_producto`
  ADD CONSTRAINT `FK_PEDIDOPRODUCTO_PEDIDOS` FOREIGN KEY (`id_pedido`) REFERENCES `pedidos` (`id`),
  ADD CONSTRAINT `FK_PEDIDOPRODUCTO_PRODUCTO` FOREIGN KEY (`id_producto`) REFERENCES `productos` (`id`);

--
-- Contraintes pour la table `productos`
--
ALTER TABLE `productos`
  ADD CONSTRAINT `FK_IDCATEGORIA_CATEGORIA` FOREIGN KEY (`idcategoria`) REFERENCES `categorias` (`id`) ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
