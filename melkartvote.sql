-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3306
-- Généré le : ven. 12 fév. 2021 à 14:51
-- Version du serveur :  5.7.31
-- Version de PHP : 7.3.21

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `melkartvote`
--

-- --------------------------------------------------------

--
-- Structure de la table `question`
--

DROP TABLE IF EXISTS `question`;
CREATE TABLE IF NOT EXISTS `question` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ques` varchar(100) NOT NULL,
  `finished` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=15 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `question`
--

INSERT INTO `question` (`id`, `ques`, `finished`) VALUES
(1, 'pole projets', 1),
(2, 'pole marketing hachek', 0),
(3, 'pole devco hachek', 1),
(4, 'farrousty', 1),
(5, 'hriga', 0),
(6, 'hriga', 0),
(7, 'hriiiga', 0),
(8, 'aa', 0),
(9, 'bb', 0),
(10, 'bb', 0),
(11, 'hachek', 0),
(12, 'ahla', 0),
(13, 'feres farrouset chkoon', 1),
(14, 'chedly fo9ma', 1);

-- --------------------------------------------------------

--
-- Structure de la table `reponse`
--

DROP TABLE IF EXISTS `reponse`;
CREATE TABLE IF NOT EXISTS `reponse` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_ques` int(11) NOT NULL,
  `reponse` varchar(50) NOT NULL,
  `nbvotes` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=21 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `reponse`
--

INSERT INTO `reponse` (`id`, `id_ques`, `reponse`, `nbvotes`) VALUES
(1, 1, 'khalil', 7),
(2, 1, 'mouahed', 6),
(3, 12, 'wasahla', 0),
(4, 12, 'yafo9ma', 3),
(5, 12, 'mouuu', 0),
(6, 1, 'amin', -6),
(7, 1, 'lob', 1),
(8, 1, 'dob', 1),
(9, 1, 'far', 1),
(10, 1, 'hmar', 1),
(11, 1, 'aa', 1),
(12, 13, 'khalil', 2),
(13, 13, 'khalil', 0),
(14, 13, 'khalil', 0),
(15, 13, 'farah', 0),
(16, 14, 'oui', 2),
(17, 14, 'oui', 0),
(18, 14, 'oui', 0),
(19, 14, 'oui', 0),
(20, 14, 'non', 0);

-- --------------------------------------------------------

--
-- Structure de la table `users`
--

DROP TABLE IF EXISTS `users`;
CREATE TABLE IF NOT EXISTS `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `email` varchar(50) NOT NULL,
  `password` varchar(500) NOT NULL,
  `nom` varchar(50) NOT NULL,
  `prenom` varchar(50) NOT NULL,
  `votant` int(11) NOT NULL DEFAULT '0',
  `role` varchar(1) NOT NULL DEFAULT 'm',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `users`
--

INSERT INTO `users` (`id`, `email`, `password`, `nom`, `prenom`, `votant`, `role`) VALUES
(1, 'kalcompte1@gmail.com', '$2b$10$puVYBvE2GZZwNwFoCJ43SO4oFHvsNGxOgL3q1vm14KXNL1HvrjSWm', '', '', 1, 'b'),
(2, 'kalaide46@gmail.com', '$2b$10$K1iARmkG/sv3Lj.L3GT7FeorRiq8bt40V4Muc8/6r31PD3.bZluRm', 'hriga', 'mafamesh', 0, 'm'),
(3, 'kalcompte2@gmail.com', '$2b$10$jy8Xe85e5ct4CSOk4bY3jOkUbYUqe8LzEcVi2D440znk.1RwHTKlS', 'jendoubi', 'mohamed', 1, 'm'),
(4, 'tchoutou21@gmail.com', '$2b$10$puVYBvE2GZZwNwFoCJ43SO4oFHvsNGxOgL3q1vm14KXNL1HvrjSWm', 'chtourou', 'khaldoun', 1, 'm'),
(5, 'kal00079@hotmail.fr', '$2b$10$qJtuLriMApjrE8wSrwaAbufj.SJF5YQc3KMrAQT1uP9neKepNFP/W', 'jendoubi', 'Mohamed', 1, 'm');

-- --------------------------------------------------------

--
-- Structure de la table `vota`
--

DROP TABLE IF EXISTS `vota`;
CREATE TABLE IF NOT EXISTS `vota` (
  `id_membre` int(11) NOT NULL,
  `id_ques` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `vota`
--

INSERT INTO `vota` (`id_membre`, `id_ques`) VALUES
(1, 1),
(1, 12),
(1, 13),
(3, 12),
(1, 14);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
