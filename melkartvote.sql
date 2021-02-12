-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3306
-- Généré le : ven. 12 fév. 2021 à 11:38
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
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `question`
--

INSERT INTO `question` (`id`, `ques`, `finished`) VALUES
(1, 'pole projets', 0),
(2, 'pole marketing hachek', 0),
(3, 'pole devco hachek', 0),
(4, 'farrousty', 0);

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
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `reponse`
--

INSERT INTO `reponse` (`id`, `id_ques`, `reponse`, `nbvotes`) VALUES
(1, 1, 'khalil', 11),
(2, 1, 'mouahed', 6);

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
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `users`
--

INSERT INTO `users` (`id`, `email`, `password`, `nom`, `prenom`, `votant`, `role`) VALUES
(1, 'kalcompte1@gmail.com', '$2b$10$puVYBvE2GZZwNwFoCJ43SO4oFHvsNGxOgL3q1vm14KXNL1HvrjSWm', '', '', 1, 'b'),
(2, 'kalaide46@gmail.com', '$2b$10$K1iARmkG/sv3Lj.L3GT7FeorRiq8bt40V4Muc8/6r31PD3.bZluRm', '', '', 0, 'm'),
(3, 'kalcompte2@gmail.com', '$2b$10$jy8Xe85e5ct4CSOk4bY3jOkUbYUqe8LzEcVi2D440znk.1RwHTKlS', 'jendoubi', 'mohamed', 0, 'm');

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
(1, 1);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
