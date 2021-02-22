-- phpMyAdmin SQL Dump
-- version 5.0.4
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Feb 22, 2021 at 04:55 PM
-- Server version: 10.4.17-MariaDB
-- PHP Version: 8.0.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `melkartvote`
--

-- --------------------------------------------------------

--
-- Table structure for table `question`
--

CREATE TABLE `question` (
  `id` int(11) NOT NULL,
  `ques` varchar(100) NOT NULL,
  `finished` int(11) NOT NULL DEFAULT 0
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `question`
--

INSERT INTO `question` (`id`, `ques`, `finished`) VALUES
(4, 'Adjoint Marketing', 1),
(3, 'Adjoint Projets & Prospections', 1),
(5, 'Adjoint Développement Commercial', 1),
(6, 'Adjoint RH et Formations', 1);

-- --------------------------------------------------------

--
-- Table structure for table `reponse`
--

CREATE TABLE `reponse` (
  `id` int(11) NOT NULL,
  `id_ques` int(11) NOT NULL,
  `reponse` varchar(50) NOT NULL,
  `nbvotes` int(11) NOT NULL DEFAULT 0
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `reponse`
--

INSERT INTO `reponse` (`id`, `id_ques`, `reponse`, `nbvotes`) VALUES
(13, 5, 'Aucun', 1),
(11, 4, 'Chedi Bouzaine', 9),
(12, 4, 'Aucun', 2),
(10, 4, 'Sarra Ben Abbes', 27),
(6, 3, 'Ahmed Aziz Khelifi', 14),
(7, 3, 'Manel Azmi', 19),
(8, 3, 'Mohamed Amin Marzouki', 12),
(9, 3, 'Aucun', 0),
(14, 5, 'Ghofrane Zelfani', 12),
(15, 5, 'Majd Bedoui', 26),
(16, 5, 'Souhaila Bouaicha', 11),
(17, 6, 'Mohamed Chiboub', 37),
(18, 6, 'Ines Krichen', 15),
(19, 6, 'Aucun', 2);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `email` varchar(50) NOT NULL,
  `password` varchar(500) NOT NULL,
  `nom` varchar(50) NOT NULL,
  `prenom` varchar(50) NOT NULL,
  `votant` int(11) NOT NULL DEFAULT 0,
  `role` varchar(1) NOT NULL DEFAULT 'm'
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `email`, `password`, `nom`, `prenom`, `votant`, `role`) VALUES
(1, 'kalcompte1@gmail.com', '$2b$10$ZF2K5m4DZrFX5TJ/bALBw.HhxThqTr6ADZGG2.tt5KKZFZ.S60TRG', 'jendoubi', 'khalil', 1, 'b'),
(11, 'chibani099@gmail.com', '$2b$10$M/tPPBRYrUFYX86hpRGw8eiI0nE9Jt9aYdldl9pMY/cLinO3.etvu', 'Chibani', 'Alia', 1, 'b'),
(12, 'chedlyzouche9999@outlook.com', '$2b$10$fwwnxlSd02oKBDaimkrL0eLMDfkiETRLBvJqLqKRUn0V.GYZW./6y', 'Zouche', 'Chedly', 1, 'b'),
(13, 'feresnefzi18@gmail.com', '$2b$10$i6VeoTvldXhyydP2SXQqfun8za2FBV4Tx/UwsNT8AFuPvlkNk44LK', 'Nefzi', 'Feres', 1, 'b'),
(14, 'amanimettichi@gmail.com', '$2b$10$0v4uiMUnEQvFTFu2.4eHyuA5eOgkD7xuv6ycrz7.lTjBdvi1HuuUe', 'Mettichi', 'Amani', 1, 'b'),
(15, 'chihaoui.eslem@gmail.com', '$2b$10$zhSxbIUoWYcH7gKE/ogCoe1neQuKaxDZc7xyHMsWgmfvc2crtJxUq', 'Chihaoui', 'Eslem', 1, 'b'),
(16, 'ourariran1.8@gmail.com', '$2b$10$DsnS8DKbjKwp1r.eQccVDeONClHNK7nQ5AKSTA0OJNR8h2vE91SMu', 'Ourari', 'Rania', 1, 'b'),
(19, 'chiboubmohamed1999@gmail.com', '$2b$10$2Nf9IEI8sfgAwP2Jlck.pecRGSEuYF/iUcAiacswtPgmGoxJFpGbK', 'Chiboub', 'Mohamed', 1, 'm'),
(18, 'yasminemgarrech@yahoo.com', '$2b$10$cjXMTDtFcDbQqHxEKBJJO.OL9d6JiBkeH7qYTXBG4SNpUzyaAK1rW', 'Mgarrech ', 'Yasmine', 1, 'b'),
(20, 'ahmedazizkhelifi@gmail.com', '$2b$10$DqtOb0OcyvK60z09MhuhOu8zZkCljSmX9qL3GZSrt4szF1HgU9ELa', 'Khelifi', 'Ahmed Aziz', 1, 'm'),
(21, 'ghachemeya12@gmail.com', '$2b$10$7KKiTDUqD7BqKUDLawJKYOMlZejdgdK2dEBZPqfiXb9zMzCukSJGa', 'Ghachem', 'Eya', 1, 'm'),
(22, 'siwarchiha456@gmail.com', '$2b$10$BESt3TUai9U8xb5u0iFTFeSs9WFjz.62zhLwhj9T85rfu6xkdyx5q', 'chiha', 'siwar', 1, 'm'),
(23, 'basarra.professional@gmail.com', '$2b$10$zZLId6ATjTIZV7/NPRT6NO4b1MjtNxOAF6L2eMmJp5Cfew5gBHbmC', 'BEN ABBES', 'Sarra', 1, 'm'),
(24, 'ghofrane.lahmar1@gmail.com', '$2b$10$2qNX24h4onzI8hzrL/VZmOm7xNEGsp5BouPOKO/.4lIjmLGPXz462', 'Ghofrane', 'Lahmar', 1, 'm'),
(25, 'syrinehammami84@gmail.com', '$2b$10$MiP33XbJ7lIPcDH9U9EOm.CfnlJNnMVXbLae098AtmVjhnaM9/vXK', 'Hammami', 'Syrine', 1, 'm'),
(26, 'amna.hdhili@gmail.com', '$2b$10$m9jzpXTBaa9aXzX9yu5I.uzb6iTGdd1pgZmz02jIYkB6.mbxlb.mq', 'hedhili', 'amna', 1, 'm'),
(27, 'bedouimajd@gmail.com', '$2b$10$Usvw/15SrUUQLhw4NLLmVeoVe66jF9dAYquER7vOxCgaFcDinPpsK', 'Bedoui ', 'Majd', 1, 'm'),
(28, 'zelfanig@gmail.com', '$2b$10$NBjDsFLvc6qDJ9GwyrUF8u.1Rq9uVEurmuEWqSklTBRgAUBj1wOje', 'zelfani', 'ghofrane', 1, 'm'),
(29, 'ilyessaskri10@gmail.com', '$2b$10$63J7m1fr4aZtddT7oYsS8.Q5yp8/aHH/tLZ5T5ZOUtVKl2KkabS7S', 'askri', 'ilyes', 1, 'm'),
(30, 'tchtourou21@gmail.com', '$2b$10$xVj3uetyr0lTGjura.wpGOnfciKJ0XjE9LrVGD6kVJrBA10hhcPe6', 'Chtourou', 'Khaldoun', 1, 'm'),
(31, 'azmimanel777@gmail.com', '$2b$10$pdZr9e4p8vCfxrSXYjJt2uRi/2rsbr6akp8WYvgtBRhaeJi3bd3cG', 'azmi', 'manel', 1, 'm'),
(32, 'turkieya99@gmail.com', '$2b$10$2LOkWHmGbvjX9JmGdaR1ceZtCYJWRqSfSEY7lNnH8X42l4Y.8nN6.', 'turki', 'eya', 1, 'm'),
(33, 'chadi.bouzaine@gmail.com', '$2b$10$UYz8is1f27Y1HEYM9dhYZ.RzhjsuYikT6Cn7.dft6vYMikxlSYpxu', 'bouzaine', 'chadi', 1, 'm'),
(34, 'molkamettalienicar@gmail.com', '$2b$10$cmsap4oKvzGI9NmmE0yPw.iv4XK2Zp3qtDkyYVt.kfoZSuvneNrBa', 'Mettali', 'Molka', 1, 'm'),
(35, 'mouwahed66@gmail.com', '$2b$10$GJZSdiKC7D.RR.RXmYqx6OCnbVt72ElkjXG1zfi6.MIrKcGk.7R9O', 'mhadhbi', 'mouwahed', 1, 'm'),
(36, 'khalifasaidi97@gmail.com', '$2b$10$.ZhVjFH4EFiSgTnNPqED6e4Q8t8gNSqjK.IMV8ZBa1SwuCTaHbaai', 'Saidi', 'Khalifa', 1, 'm'),
(37, 'Daliabelaid@gmail.com', '$2b$10$dE9kSi8VJY2CUcsL4.UIfeVTJS1rqXaHQ7ShNw/LzIyn6wFnhRB/i', 'Belaid ', 'Dalia', 1, 'm'),
(38, 'boughattas.yessine@gmail.com', '$2b$10$uFzQCjenBIhsTV.TabRxdOECSiwn8fGA01A5MnlOAke6mz3wvh0Ky', 'Boughattas', 'Med Yessine', 1, 'm'),
(39, 'kelkor664455@gmail.com', '$2b$10$ARU8pNkhIOx0Jy3d2GWYWev5go1US/9Hmofih/CGhirba3BolIomu', 'BEN MANSOUR', 'mahdi', 1, 'm'),
(40, 'ghabinadhmi22@gmail.com', '$2b$10$vzKoAZVFtghne6DiT29D1Oq2oLjDUUaCFyo5n08QTLjGbwgxCKlyK', 'ghabi', 'nadhmi', 1, 'm'),
(41, 'akrem008.benjamie@gmail.com', '$2b$10$f4eB4vNWn3iBbVTCns9IgeuLTTfqpLAT3tySbH2JIlyQjmGFC0S.2', 'Ben Jemia ', 'Mohamed Akrem', 1, 'm'),
(42, 'Khorchefi.ghaith@gmail.com', '$2b$10$tXoM6TcbJJe4mT9YIPM7V.YCfHdtxGJRFqXV2EjdfgUHNFCgWbNUq', 'Khorchfi ', 'Ghaith ', 1, 'm'),
(43, 'aminmarzouki.med@gmail.com', '$2b$10$N.8TKDxv5cjTnPdyqXCDG.vIwCSytc0FL8UHL6CXyFjogTRlChqNO', 'Marzouki', 'Mohamed Amin', 1, 'm'),
(44, 'ineskrichene87@gmail.com', '$2b$10$zcmDxVpiEwjxLwOJWgDD/uXgKnexOZj72PzfAubDNznclSF6rX0Hq', 'Krichen', 'Ines', 1, 'm'),
(45, 'mounaaredissi@gmail.com', '$2b$10$KkiK88biEAjwGWfBhHXH5usaCzIhZall2JxeRhPejl/wEojjMeKEy', 'redissi', 'mouna', 1, 'm'),
(46, 'melek.dammak@gmail.com', '$2b$10$O6hmyLnARBCwSh9WXMc.necbUzpYfcW.142hh.txWjoBo6gyf2Uha', 'Damak', 'Melek', 1, 'm'),
(47, 'medoni13@gmail.com', '$2b$10$i41CC9/Jssz0G0LFpUNiWOoivD.BwlOaChHmH0MdK2r1GxoiFD9XW', 'Med', 'Ouni', 1, 'm'),
(48, 'aymanwali98@yahoo.com', '$2b$10$URvGlhgd0ei7W6B7u8aef.NS0KMpa5YoW5p/No4urVOUbQkybCFCK', 'Wali', 'Ayman', 0, 'm'),
(49, 'walhaezer99@gmail.com', '$2b$10$elAchpIg6IGaBu.I2vi2qeHynHul.zZwY3UyVI4emUbf0nojaeSJa', 'Walha', 'Ezer', 1, 'm'),
(50, 'bouaicha.souheila@gmail.com', '$2b$10$aZ0Bd7s3Ny1jrvnaAaGA0ugoRoQS8d.jyKGSWrbcj75U6TdU7C6bK', 'bouaicha', 'souheila', 1, 'm'),
(51, 'fkiriobeb@gmail.com', '$2b$10$aL44c1.DCmV7IyJEt/Uq8OilsssoaF4U7yiG1hxkxI/5N5E6WprEO', 'Fkiri', 'Obeb', 1, 'm'),
(52, 'chaimamezgar@gmail.com', '$2b$10$YuG.d123S0JO.W5LRKWnB.X.2dFAc8zTXVvoRsZkkA9UwnYMBJCkO', 'MEZGAR', 'Chaima', 1, 'm'),
(53, 'soltanisarra12@gmail.com ', '$2b$10$PLMAHvzL1s4vy4a6fQ2so.lnSbGEwwukLiUCQFlsywl1Ib0aE3Y1u', 'Soltani ', 'Sarra', 1, 'm'),
(54, 'khiari.nader.j3@gmail.com', '$2b$10$E9eQFunMBf6kHHJdtsffgOauOfLxldjXIoCndTl797V4atFkDbRXW', 'Khiari', 'Nader', 1, 'm'),
(55, 'noourhayder21@gmail.com', '$2b$10$CvR82QyjjPzf3/tGWiFO8uW1D3kbHVLG8vBt7UZKsCtgWcNKKtInG', 'Hayder', 'Nour', 1, 'm'),
(56, '', '$2b$10$V3HQX31jug3ZFofkR5pf9u3AxwP31.3D.CFo2ULN0Y7pztg8iposu', '', '', 0, 'm'),
(57, 'yahyaouichaima39@gmail.com', '$2b$10$9O5MfdW8dkNdzwlBklkHB.bQgwqXdyIBqNdk3xkOb4sao.hUWfRvm', 'yahyaoui', 'chaima', 1, 'm'),
(58, 'aladinhidri93@gmail.com', '$2b$10$2kl1LO2twPhUhvtjLZQf.O0JPAXpY2bnW70DfeWDHndTul8sm1I2S', 'Hidri', 'Alaeddine', 1, 'm'),
(59, 'haroun1707@gmail.com', '$2b$10$aHXmp0XCzRW3/nq773UNouvwpz4nIAJJcO8m1KZq3mstN2bpB7K0m', 'Mhadhbi', 'Haroun', 1, 'm'),
(60, 'aymanwali07@gmail.com', '$2b$10$I7i/hCpzbGb.Dq71DdkLXenE7Nv.ZFmWaTOLVOLxqHZ9HyYxdfksK', 'Wali', 'Ayman', 1, 'm'),
(61, 'salhitaheni01@gmail.com', '$2b$10$s.jBzAb31NybxvqyLPoIueqSaHzMRefOwImxMhHKG84ycmOjpf2uW', 'Salhi', 'Taheni', 1, 'm'),
(62, 'Dorrarouis6@gmail.com ', '$2b$10$9MY6I/ma5L.3E9p6UiJQFe8pdvgBmUWqchrziqZSOQyyH0N80yNc6', 'Rouis ', 'Dorra', 0, 'm');

-- --------------------------------------------------------

--
-- Table structure for table `vota`
--

CREATE TABLE `vota` (
  `id_membre` int(11) NOT NULL,
  `id_ques` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `vota`
--

INSERT INTO `vota` (`id_membre`, `id_ques`) VALUES
(44, 6),
(51, 6),
(45, 6),
(1, 6),
(31, 6),
(19, 6),
(21, 6),
(35, 6),
(33, 6),
(13, 6),
(23, 6),
(27, 6),
(22, 6),
(46, 6),
(43, 6),
(15, 6),
(39, 6),
(38, 6),
(26, 6),
(14, 6),
(11, 6),
(34, 6),
(28, 6),
(42, 6),
(30, 6),
(12, 6),
(50, 6),
(18, 6),
(61, 6),
(24, 6),
(47, 6),
(52, 6),
(54, 6),
(40, 6),
(25, 6),
(55, 6),
(32, 6),
(41, 6),
(37, 6),
(16, 6),
(58, 6),
(49, 6),
(20, 6),
(60, 6),
(36, 6),
(53, 6),
(27, 5),
(50, 5),
(23, 5),
(1, 5),
(19, 5),
(33, 5),
(51, 5),
(46, 5),
(24, 5),
(31, 5),
(49, 5),
(43, 5),
(61, 5),
(40, 5),
(22, 5),
(21, 5),
(29, 5),
(13, 5),
(52, 5),
(20, 5),
(12, 5),
(37, 5),
(55, 5),
(41, 5),
(26, 5),
(36, 5),
(32, 5),
(44, 5),
(30, 5),
(47, 5),
(11, 5),
(54, 5),
(18, 5),
(35, 5),
(45, 5),
(15, 5),
(16, 5),
(14, 5),
(42, 5),
(60, 5),
(60, 5),
(53, 5),
(27, 3),
(20, 3),
(15, 3),
(35, 3),
(41, 3),
(1, 3),
(11, 3),
(23, 3),
(31, 3),
(33, 3),
(49, 3),
(30, 3),
(52, 3),
(12, 3),
(38, 3),
(51, 3),
(26, 3),
(43, 3),
(54, 3),
(40, 3),
(28, 3),
(18, 3),
(46, 3),
(14, 3),
(37, 3),
(44, 3),
(21, 3),
(25, 3),
(53, 3),
(22, 3),
(42, 3),
(16, 3),
(24, 3),
(50, 3),
(32, 3),
(13, 3),
(60, 3),
(27, 4),
(35, 4),
(30, 4),
(41, 4),
(26, 4),
(33, 4),
(31, 4),
(1, 4),
(37, 4),
(38, 4),
(28, 4),
(50, 4),
(18, 4),
(12, 4),
(57, 4),
(49, 4),
(14, 4),
(11, 4),
(23, 4),
(42, 4),
(44, 4),
(15, 4),
(52, 4),
(46, 4),
(16, 4),
(51, 4),
(60, 4),
(13, 4),
(20, 4),
(40, 4);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `question`
--
ALTER TABLE `question`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `reponse`
--
ALTER TABLE `reponse`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `question`
--
ALTER TABLE `question`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `reponse`
--
ALTER TABLE `reponse`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=63;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
