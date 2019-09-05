-- phpMyAdmin SQL Dump
-- version 4.6.4
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: May 01, 2019 at 11:12 AM
-- Server version: 10.1.26-MariaDB-0+deb9u1
-- PHP Version: 7.0.31-1~dotdeb+8.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `D00196117`
--

-- --------------------------------------------------------

--
-- Table structure for table `events`
--

CREATE TABLE `events` (
  `id` int(11) NOT NULL,
  `event` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `events`
--

INSERT INTO `events` (`id`, `event`) VALUES
(3, 'Goal'),
(4, 'Yellow card'),
(5, 'Red Card'),
(6, 'Own Goal'),
(7, 'Penalty'),
(8, 'Off-side');

-- --------------------------------------------------------

--
-- Table structure for table `matches`
--

CREATE TABLE `matches` (
  `id` int(11) NOT NULL,
  `match_date_time` datetime NOT NULL,
  `match_location` varchar(1000) DEFAULT NULL,
  `match_elapsed_time` varchar(10) DEFAULT '0',
  `competition` varchar(500) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `matches`
--

INSERT INTO `matches` (`id`, `match_date_time`, `match_location`, `match_elapsed_time`, `competition`) VALUES
(1, '2019-03-13 20:00:00', 'Allianz Arena', '24:43', 'Champions League'),
(2, '2019-04-09 20:00:00', 'Anfield', 'fin', 'Champions League'),
(3, '2019-04-09 20:00:00', 'Tottenham Hotspur Stadium', '00:00', 'Champions League'),
(4, '2019-04-24 20:00:00', 'Old Trafford', 'fin', 'Premier League'),
(5, '2019-05-01 20:00:00', 'Camp Nou', 'preGame', 'Champions League');

-- --------------------------------------------------------

--
-- Table structure for table `matches_events`
--

CREATE TABLE `matches_events` (
  `id` int(11) NOT NULL,
  `match_id` int(11) NOT NULL,
  `event_id` int(11) NOT NULL,
  `player_id` int(11) NOT NULL,
  `team_id` int(11) NOT NULL,
  `time` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `matches_events`
--

INSERT INTO `matches_events` (`id`, `match_id`, `event_id`, `player_id`, `team_id`, `time`) VALUES
(69, 4, 4, 154, 7, '2019-04-24'),
(70, 4, 4, 186, 8, '2019-04-24'),
(71, 4, 4, 157, 7, '2019-04-24'),
(72, 4, 3, 151, 7, '2019-04-24'),
(73, 4, 8, 162, 7, '2019-04-24'),
(74, 4, 3, 162, 7, '2019-04-24'),
(75, 4, 4, 193, 8, '2019-04-24');

-- --------------------------------------------------------

--
-- Table structure for table `matches_players`
--

CREATE TABLE `matches_players` (
  `match_id` int(11) NOT NULL,
  `player_id` int(11) NOT NULL,
  `team_id` int(11) NOT NULL,
  `position` int(2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `matches_players`
--

INSERT INTO `matches_players` (`match_id`, `player_id`, `team_id`, `position`) VALUES
(4, 141, 7, 0),
(4, 142, 7, 1),
(4, 143, 7, 3),
(4, 144, 7, -1),
(4, 145, 7, -2),
(4, 146, 7, -1),
(4, 147, 7, -1),
(4, 148, 7, -2),
(4, 149, 7, 8),
(4, 150, 7, -1),
(4, 151, 7, 10),
(4, 152, 7, -1),
(4, 153, 7, -2),
(4, 154, 7, 2),
(4, 155, 7, -2),
(4, 156, 7, -2),
(4, 157, 7, 4),
(4, 158, 7, 5),
(4, 159, 7, -1),
(4, 160, 7, -2),
(4, 161, 7, 7),
(4, 162, 7, 6),
(4, 163, 7, -1),
(4, 164, 7, 9),
(4, 165, 8, 0),
(4, 166, 8, 8),
(4, 167, 8, 3),
(4, 168, 8, 2),
(4, 169, 8, -2),
(4, 170, 8, -1),
(4, 171, 8, 7),
(4, 172, 8, -1),
(4, 173, 8, 9),
(4, 174, 8, 10),
(4, 175, 8, -1),
(4, 176, 8, -2),
(4, 177, 8, -2),
(4, 178, 8, -2),
(4, 179, 8, -2),
(4, 180, 8, -1),
(4, 181, 8, -1),
(4, 182, 8, -2),
(4, 183, 8, 5),
(4, 184, 8, -2),
(4, 185, 8, -1),
(4, 186, 8, -1),
(4, 187, 8, 1),
(4, 188, 8, 6),
(4, 189, 8, -2),
(4, 190, 8, -2),
(4, 191, 8, -2),
(4, 192, 8, -2),
(4, 193, 8, 4);

-- --------------------------------------------------------

--
-- Table structure for table `matches_teams`
--

CREATE TABLE `matches_teams` (
  `match_id` int(11) NOT NULL,
  `team_id` int(11) NOT NULL,
  `formation` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `matches_teams`
--

INSERT INTO `matches_teams` (`match_id`, `team_id`, `formation`) VALUES
(1, 3, NULL),
(1, 4, NULL),
(2, 4, NULL),
(2, 5, NULL),
(3, 6, NULL),
(3, 7, NULL),
(4, 7, NULL),
(4, 8, NULL),
(5, 4, NULL),
(5, 9, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `players`
--

CREATE TABLE `players` (
  `id` int(11) NOT NULL,
  `player_name` varchar(500) NOT NULL,
  `player_no` int(2) NOT NULL,
  `player_role` varchar(40) DEFAULT 'N/A',
  `player_image` varchar(150) DEFAULT 'N/A',
  `team_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `players`
--

INSERT INTO `players` (`id`, `player_name`, `player_no`, `player_role`, `player_image`, `team_id`) VALUES
(47, 'Neuer', 1, 'Goalkeeper', 'http://mysql02.comp.dkit.ie/D00196117/player_images/Neuer.jpg', 3),
(48, 'Rafinha', 13, 'N/A', 'http://mysql02.comp.dkit.ie/D00196117/player_images/Rafinha.jpg', 3),
(49, 'Sule', 4, 'N/A', 'http://mysql02.comp.dkit.ie/D00196117/player_images/Sule.jpg', 3),
(50, 'Hummels', 5, 'N/A', 'http://mysql02.comp.dkit.ie/D00196117/player_images/Hummels.jpg', 3),
(51, 'Alaba', 27, 'N/A', 'http://mysql02.comp.dkit.ie/D00196117/player_images/Alaba.jpg', 3),
(52, 'Thiago', 6, 'N/A', 'http://mysql02.comp.dkit.ie/D00196117/player_images/Thiago.jpg', 3),
(53, 'Rodriguez', 11, 'N/A', 'http://mysql02.comp.dkit.ie/D00196117/player_images/Rodriquez.jpg', 3),
(54, 'Martinez', 8, 'N/A', 'http://mysql02.comp.dkit.ie/D00196117/player_images/Martinez.jpg', 3),
(55, 'Gnabry', 22, 'N/A', 'http://mysql02.comp.dkit.ie/D00196117/player_images/Gnabry.jpg', 3),
(56, 'Lewand-owski', 9, 'N/A', 'http://mysql02.comp.dkit.ie/D00196117/player_images/Lewandowski.jpg', 3),
(57, 'Coman', 29, 'N/A', 'http://mysql02.comp.dkit.ie/D00196117/player_images/Coman.jpg', 3),
(58, 'Ulreich', 26, 'N/A', 'http://mysql02.comp.dkit.ie/D00196117/player_images/Ulreich.jpg', 3),
(59, 'Mai', 33, 'N/A', 'http://mysql02.comp.dkit.ie/D00196117/player_images/Mai.jpg', 3),
(60, 'Boateng', 17, 'N/A', 'http://mysql02.comp.dkit.ie/D00196117/player_images/Boateng.jpg', 3),
(61, 'Shabani', 37, 'N/A', 'http://mysql02.comp.dkit.ie/D00196117/player_images/Shabani.jpg', 3),
(62, 'Sanches', 35, 'N/A', 'http://mysql02.comp.dkit.ie/D00196117/player_images/Sanches.jpg', 3),
(63, 'Tolisso', 24, 'N/A', 'http://mysql02.comp.dkit.ie/D00196117/player_images/Tolisso.jpg', 3),
(64, 'Goretzka', 18, 'N/A', 'http://mysql02.comp.dkit.ie/D00196117/player_images/Goretzka.jpg', 3),
(65, 'Muller', 25, 'N/A', 'http://mysql02.comp.dkit.ie/D00196117/player_images/Muller.jpg', 3),
(66, 'Davies', 19, 'N/A', 'http://mysql02.comp.dkit.ie/D00196117/player_images/Davies.jpg', 3),
(67, 'Robben', 10, 'N/A', 'http://mysql02.comp.dkit.ie/D00196117/player_images/Robben.jpg', 3),
(68, 'Ribery', 7, 'N/A', 'http://mysql02.comp.dkit.ie/D00196117/player_images/Ribbery.jpg', 3),
(69, 'Alisson', 13, 'Goalkeeper', 'http://mysql02.comp.dkit.ie/D00196117/player_images/Alisson.jpg', 4),
(70, 'Alex-Arnold', 66, 'Defender', 'http://mysql02.comp.dkit.ie/D00196117/player_images/Alexander-Arnold.jpg', 4),
(71, 'Matip', 32, 'Defender', 'http://mysql02.comp.dkit.ie/D00196117/player_images/Matip.jpg', 4),
(72, 'Van Dikj', 5, 'Defender', 'http://mysql02.comp.dkit.ie/D00196117/player_images/Van Dikj.jpg', 4),
(73, 'Robertson', 26, 'Defender', 'http://mysql02.comp.dkit.ie/D00196117/player_images/Robertson.jpg', 4),
(74, 'Wijnaldum', 5, 'Mid-Fielder', 'http://mysql02.comp.dkit.ie/D00196117/player_images/Wijnaldum.jpg', 4),
(75, 'Henderson', 14, 'Mid-Fielder', 'http://mysql02.comp.dkit.ie/D00196117/player_images/Henderson.jpg', 4),
(76, 'Keita', 8, 'Mid-Fielder', 'http://mysql02.comp.dkit.ie/D00196117/player_images/Keita.jpg', 4),
(77, 'Salah', 11, 'Forward', 'http://mysql02.comp.dkit.ie/D00196117/player_images/Salah.jpg', 4),
(78, 'Firmino', 9, 'Forward', 'http://mysql02.comp.dkit.ie/D00196117/player_images/Firmino.jpg', 4),
(79, 'Mane', 10, 'Forward', 'http://mysql02.comp.dkit.ie/D00196117/player_images/Mane.jpg', 4),
(80, 'Mignolet', 22, 'Goalkeeper', 'http://mysql02.comp.dkit.ie/D00196117/player_images/Mignolet.jpg', 4),
(81, 'Lovren', 6, 'Defender', 'http://mysql02.comp.dkit.ie/D00196117/player_images/Lovren.jpg', 4),
(82, 'Gomez', 12, 'Defender', 'http://mysql02.comp.dkit.ie/D00196117/player_images/Gomez.jpg', 4),
(83, 'Moreno', 18, 'Defender', 'http://mysql02.comp.dkit.ie/D00196117/player_images/Moreno.jpg', 4),
(84, 'Milner', 7, 'Mid-Fielder', 'http://mysql02.comp.dkit.ie/D00196117/player_images/Milner.jpg', 4),
(85, 'Lallana', 20, 'Mid-Fielder', 'http://mysql02.comp.dkit.ie/D00196117/player_images/Lallana.jpg', 4),
(86, 'Fabinho', 3, 'Mid-Fielder', 'http://mysql02.comp.dkit.ie/D00196117/player_images/Fabinho.jpg', 4),
(87, 'Oxlade-Chamberlain', 21, 'Mid-Fielder', 'http://mysql02.comp.dkit.ie/D00196117/player_images/Oxlade-Chamberlain.jpg', 4),
(88, 'Shaqiri', 23, 'Mid-Fielder', 'http://mysql02.comp.dkit.ie/D00196117/player_images/Shaqiri.jpg', 4),
(89, 'Sturridge', 15, 'Forward', 'http://mysql02.comp.dkit.ie/D00196117/player_images/Sturridge.jpg', 4),
(90, 'Origi', 27, 'Forward', 'http://mysql02.comp.dkit.ie/D00196117/player_images/Origi.jpg', 4),
(91, 'Casillas', 1, 'Goalkeeper', 'http://mysql02.comp.dkit.ie/D00196117/player_images/casillas.jpg', 5),
(92, 'Militao', 3, 'Defender', 'http://mysql02.comp.dkit.ie/D00196117/player_images/Militao.jpg', 5),
(95, 'Pepe', 33, 'Defender', 'http://mysql02.comp.dkit.ie/D00196117/player_images/Pepe.jpg', 5),
(96, 'Felipe', 28, 'Defender', 'http://mysql02.comp.dkit.ie/D00196117/player_images/Felipe.jpg', 5),
(97, 'Telles', 13, 'Defender', 'http://mysql02.comp.dkit.ie/D00196117/player_images/Telles.jpg', 5),
(98, 'Otavio', 25, 'Mid-Field', 'http://mysql02.comp.dkit.ie/D00196117/player_images/Otavio.jpg', 5),
(99, 'Herrera', 16, 'Mid-Field', 'http://mysql02.comp.dkit.ie/D00196117/player_images/Herrera.jpg', 5),
(100, 'D.Pereira', 22, 'Mid-Field', 'http://mysql02.comp.dkit.ie/D00196117/player_images/D.Periera', 5),
(101, 'Corona', 17, 'Forward', 'http://mysql02.comp.dkit.ie/D00196117/player_images/Corona.jpg', 5),
(102, 'Soares', 29, 'Forward', 'http://mysql02.comp.dkit.ie/D00196117/player_images/Soares.jpg', 5),
(103, 'Marega', 11, 'Forward', 'http://mysql02.comp.dkit.ie/D00196117/player_images/Marega.jpg', 5),
(104, 'Vana', 26, 'Goalkeeper', 'http://mysql02.comp.dkit.ie/D00196117/player_images/Vana.jpg', 5),
(105, 'M.Pereira', 2, 'Defender', 'http://mysql02.comp.dkit.ie/D00196117/player_images/M.Pereira.jpg', 5),
(106, 'Mbemba', 19, 'Defender', 'http://mysql02.comp.dkit.ie/D00196117/player_images/Mbemba.jpg', 5),
(107, 'Leite', 4, 'Defender', 'http://mysql02.comp.dkit.ie/D00196117/player_images/Leite.jpg', 5),
(108, 'Pedro', 23, 'Defender', 'http://mysql02.comp.dkit.ie/D00196117/player_images/Pedro.jpg', 5),
(109, 'Manafa', 12, 'Defender', 'http://mysql02.comp.dkit.ie/D00196117/player_images/Manafa.jpg', 5),
(110, 'Torres', 10, 'Mid-Field', 'http://mysql02.comp.dkit.ie/D00196117/player_images/Torres.jpg', 5),
(111, 'Brahimi', 8, 'Mid-Field', 'http://mysql02.comp.dkit.ie/D00196117/player_images/Brahimi.jpg', 5),
(112, 'N\'Diaye', 15, 'Mid-Field', 'http://mysql02.comp.dkit.ie/D00196117/player_images/N\'Diaye.jpg', 5),
(113, 'Lopez', 20, 'Mid-Field', 'http://mysql02.comp.dkit.ie/D00196117/player_images/Lopez.jpg', 5),
(114, 'Costa', 6, 'Mid-Field', 'http://mysql02.comp.dkit.ie/D00196117/player_images/Costa.jpg', 5),
(115, 'Hernani', 7, 'Mid-Field', 'http://mysql02.comp.dkit.ie/D00196117/player_images/Hernani.jpg', 5),
(116, 'A.Pereira', 21, 'Forward', 'http://mysql02.comp.dkit.ie/D00196117/player_images/A.Pereira.jpg', 5),
(117, 'Fernando', 37, 'Forward', 'http://mysql02.comp.dkit.ie/D00196117/player_images/Fernando.jpg', 5),
(118, 'Lloris', 1, 'Goalkeeper', 'http://mysql02.comp.dkit.ie/D00196117/player_images/Lloris.jpg', 6),
(119, 'Trippier', 2, 'Defender', 'http://mysql02.comp.dkit.ie/D00196117/player_images/Trippier.jpg', 6),
(120, 'Alderweireld', 4, 'Defender', 'http://mysql02.comp.dkit.ie/D00196117/player_images/Alderweireld.jpg', 6),
(121, 'Vertoghen', 5, 'Defender', 'http://mysql02.comp.dkit.ie/D00196117/player_images/Vertoghen.jpg', 6),
(122, 'Rose', 3, 'Defender', 'http://mysql02.comp.dkit.ie/D00196117/player_images/Rose.jpg', 6),
(123, 'Sissoko', 17, 'Mid-Field', 'http://mysql02.comp.dkit.ie/D00196117/player_images/Sissoko.jpg', 6),
(124, 'Sanchez', 6, 'Mid-Field', 'http://mysql02.comp.dkit.ie/D00196117/player_images/Sanchez.jpg', 6),
(125, 'Alli', 20, 'Mid-Field', 'http://mysql02.comp.dkit.ie/D00196117/player_images/Alli.jpg', 6),
(126, 'Son', 7, 'Forward', 'http://mysql02.comp.dkit.ie/D00196117/player_images/Son.jpg', 6),
(127, 'Kane', 10, 'Forward', 'http://mysql02.comp.dkit.ie/D00196117/player_images/Kane.jpg', 6),
(128, 'Eriksen', 23, 'Forward', 'http://mysql02.comp.dkit.ie/D00196117/player_images/Eriksen.jpg', 6),
(129, 'Gazzaniga', 22, 'Goalkeeper', 'http://mysql02.comp.dkit.ie/D00196117/player_images/Gazzaniga.jpg', 6),
(130, 'Foyth', 21, 'Defender', 'http://mysql02.comp.dkit.ie/D00196117/player_images/Foyth.jpg', 6),
(131, 'Davies', 19, 'Defender', 'http://mysql02.comp.dkit.ie/D00196117/player_images/TDavies.jpg', 6),
(132, 'Aurier', 24, 'Defender', 'http://mysql02.comp.dkit.ie/D00196117/player_images/Aurier.jpg', 6),
(133, 'Walker-Peters', 16, 'Defender', 'http://mysql02.comp.dkit.ie/D00196117/player_images/Walker-Peters.jpg', 6),
(134, 'Dier', 15, 'Mid-Field', 'http://mysql02.comp.dkit.ie/D00196117/player_images/Dier.jpg', 6),
(135, 'Wanyama', 12, 'Mid-Field', 'http://mysql02.comp.dkit.ie/D00196117/player_images/Wanyama.jpg', 6),
(136, 'Skipp', 52, 'Mid-Field', 'http://mysql02.comp.dkit.ie/D00196117/player_images/Skipp.jpg', 6),
(137, 'Winks', 8, 'Mid-Field', 'http://mysql02.comp.dkit.ie/D00196117/player_images/Winks.jpg', 6),
(138, 'Moura', 27, 'Forward', 'http://mysql02.comp.dkit.ie/D00196117/player_images/Moura.jpg', 6),
(139, 'Lamela', 11, 'Forward', 'http://mysql02.comp.dkit.ie/D00196117/player_images/Lamela.jpg', 6),
(140, 'Llorente', 18, 'Forward', 'http://mysql02.comp.dkit.ie/D00196117/player_images/Llorente.jpg', 6),
(141, 'Ederson', 31, 'Goalkeeper', 'http://mysql02.comp.dkit.ie/D00196117/player_images/Ederson.jpg', 7),
(142, 'Walker', 2, 'Defender', 'http://mysql02.comp.dkit.ie/D00196117/player_images/Walker.jpg', 7),
(143, 'Laporte', 14, 'Defender', 'http://mysql02.comp.dkit.ie/D00196117/player_images/Laporte.jpg', 7),
(144, 'Otamendi', 30, 'Defender', 'http://mysql02.comp.dkit.ie/D00196117/player_images/Otamendi.jpg', 7),
(145, 'Mendy', 22, 'Defender', 'http://mysql02.comp.dkit.ie/D00196117/player_images/Mendy.jpg', 7),
(146, 'Gundogan', 8, 'Mid-Field', 'http://mysql02.comp.dkit.ie/D00196117/player_images/Gundogan.jpg', 7),
(147, 'Fernandinho', 25, 'Mid-Field', 'http://mysql02.comp.dkit.ie/D00196117/player_images/Fernandinho.jpg', 7),
(148, 'De Bruyne', 17, 'Mid-Field', 'http://mysql02.comp.dkit.ie/D00196117/player_images/De Bruyne.jpg', 7),
(149, 'Sterling', 7, 'Forward', 'http://mysql02.comp.dkit.ie/D00196117/player_images/Sterling.jpg', 7),
(150, 'Aguero', 10, 'Forward', 'http://mysql02.comp.dkit.ie/D00196117/player_images/Aguero.jpg', 7),
(151, 'B.Silva', 20, 'Forward', 'http://mysql02.comp.dkit.ie/D00196117/player_images/B.Silva.jpg', 7),
(152, 'Muric', 49, 'Goalkeeper', 'http://mysql02.comp.dkit.ie/D00196117/player_images/Muric.jpg', 7),
(153, 'Stones', 5, 'Defender', 'http://mysql02.comp.dkit.ie/D00196117/player_images/Stones.jpg', 7),
(154, 'Kompany', 4, 'Defender', 'http://mysql02.comp.dkit.ie/D00196117/player_images/Kompany.jpg', 7),
(155, 'Mangala', 15, 'Defender', 'http://mysql02.comp.dkit.ie/D00196117/player_images/Mangala.jpg', 7),
(156, 'Sandler', 34, 'Defender', 'http://mysql02.comp.dkit.ie/D00196117/player_images/Sandler.jpg', 7),
(157, 'Zinchenko', 35, 'Defender', 'http://mysql02.comp.dkit.ie/D00196117/player_images/Zinchenko.jpg', 7),
(158, 'Danilo', 3, 'Defender', 'http://mysql02.comp.dkit.ie/D00196117/player_images/Danilo.jpg', 7),
(159, 'Foden', 47, 'Mid-Field', 'http://mysql02.comp.dkit.ie/D00196117/player_images/Foden.jpg', 7),
(160, 'Delph', 18, 'Mid-Field', 'http://mysql02.comp.dkit.ie/D00196117/player_images/Delph.jpg', 7),
(161, 'D.Silva', 21, 'Mid-Field', 'http://mysql02.comp.dkit.ie/D00196117/player_images/D.Silva.jpg', 7),
(162, 'Sane', 19, 'Forward', 'http://mysql02.comp.dkit.ie/D00196117/player_images/Sane.jpg', 7),
(163, 'Mahrez', 26, 'Forward', 'http://mysql02.comp.dkit.ie/D00196117/player_images/Mahrez.jpg', 7),
(164, 'Jesus', 33, 'Forward', 'http://mysql02.comp.dkit.ie/D00196117/player_images/Jesus.jpg', 7),
(165, 'De Gea', 1, 'Goalkeeper', 'http://mysql02.comp.dkit.ie/D00196117/player_images/De Gea.jpg', 8),
(166, 'Young', 18, 'Defender', 'http://mysql02.comp.dkit.ie/D00196117/player_images/Young.jpg', 8),
(167, 'Lindelöf', 2, 'Defender', 'http://mysql02.comp.dkit.ie/D00196117/player_images/Lindelof.jpg', 8),
(168, 'Smalling', 12, 'Defender', 'http://mysql02.comp.dkit.ie/D00196117/player_images/Smalling.jpg', 8),
(169, 'Herrera', 21, 'Mid-Field', 'http://mysql02.comp.dkit.ie/D00196117/player_images/Herrera.jpg', 8),
(170, 'Matic', 31, 'Mid-Field', 'http://mysql02.comp.dkit.ie/D00196117/player_images/Matic.jpg', 8),
(171, 'Pogba', 6, 'Mid-Field', 'http://mysql02.comp.dkit.ie/D00196117/player_images/Pogba.jpg', 8),
(172, 'Lingard', 14, 'Mid-Field', 'http://mysql02.comp.dkit.ie/D00196117/player_images/Lingard.jpg', 8),
(173, 'Rashford', 10, 'Forward', 'http://mysql02.comp.dkit.ie/D00196117/player_images/Rashford.jpg', 8),
(174, 'Martial', 11, 'Forward', 'http://mysql02.comp.dkit.ie/D00196117/player_images/Martial.jpg', 8),
(175, 'Romero', 22, 'Goalkeeper', 'http://mysql02.comp.dkit.ie/D00196117/player_images/Romero.jpg', 8),
(176, 'Grant', 13, 'Goalkeeper', 'http://mysql02.comp.dkit.ie/D00196117/player_images/Grant.jpg', 8),
(177, 'Bailly', 3, 'Defender', 'http://mysql02.comp.dkit.ie/D00196117/player_images/Bailly.jpg', 8),
(178, 'Jones', 4, 'Defender', 'http://mysql02.comp.dkit.ie/D00196117/player_images/Jones.jpg', 8),
(179, 'Rojo', 16, 'Defender', 'http://mysql02.comp.dkit.ie/D00196117/player_images/Rojo.jpg', 8),
(180, 'Dalot', 20, 'Defender', 'http://mysql02.comp.dkit.ie/D00196117/player_images/Dalot.jpg', 8),
(181, 'Darmian', 36, 'Defender', 'http://mysql02.comp.dkit.ie/D00196117/player_images/Darmian.jpg', 8),
(182, 'Valencia ', 25, 'Defender', 'http://mysql02.comp.dkit.ie/D00196117/player_images/Valencia.jpg', 8),
(183, 'Fred', 17, 'Mid-Field', 'http://mysql02.comp.dkit.ie/D00196117/player_images/Fred.jpg', 8),
(184, 'McTominay', 39, 'Mid-Field', 'http://mysql02.comp.dkit.ie/D00196117/player_images/McTominay.jpg', 8),
(185, 'Mata', 8, 'Mid-Field', 'http://mysql02.comp.dkit.ie/D00196117/player_images/Mata.jpg', 8),
(186, 'Pereira', 15, 'Mid-Field', 'http://mysql02.comp.dkit.ie/D00196117/player_images/Pereira.jpg', 8),
(187, 'Sanchez', 7, 'Forward', 'http://mysql02.comp.dkit.ie/D00196117/player_images/Sanchez.jpg', 8),
(188, 'Lukaku', 9, 'Forward', 'http://mysql02.comp.dkit.ie/D00196117/player_images/Lukaku.jpg', 8),
(189, 'Greenwood', 54, 'Mid-Field', 'http://mysql02.comp.dkit.ie/D00196117/player_images/Greenwood.jpg', 8),
(190, 'Gomes', 47, 'Mid-Field', 'http://mysql02.comp.dkit.ie/D00196117/player_images/Gomes.jpg', 8),
(191, 'Garner', 37, 'Mid-Field', 'http://mysql02.comp.dkit.ie/D00196117/player_images/Garner.jpg', 8),
(192, 'Chong', 44, 'Forward', 'http://mysql02.comp.dkit.ie/D00196117/player_images/Chong.jpg', 8),
(193, 'Shaw', 23, 'Defender', 'http://mysql02.comp.dkit.ie/D00196117/player_images/Shaw.jpg', 8);

-- --------------------------------------------------------

--
-- Table structure for table `ratings`
--

CREATE TABLE `ratings` (
  `match_id` int(11) NOT NULL,
  `player_id` int(11) NOT NULL,
  `username` varchar(50) NOT NULL,
  `rating` int(2) NOT NULL,
  `date_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Triggers `ratings`
--
DELIMITER $$
CREATE TRIGGER `ratings_history_management` BEFORE DELETE ON `ratings` FOR EACH ROW BEGIN
INSERT INTO ratings_history VALUES (null, old.match_id, old.player_id, old.rating, old.username, old.date_time);
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `ratings_history`
--

CREATE TABLE `ratings_history` (
  `id` int(11) NOT NULL,
  `match_id` int(11) NOT NULL,
  `player_id` int(11) NOT NULL,
  `rating` int(2) NOT NULL,
  `username` varchar(50) DEFAULT NULL,
  `date_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `ratings_history`
--

INSERT INTO `ratings_history` (`id`, `match_id`, `player_id`, `rating`, `username`, `date_time`) VALUES
(1583, 4, 150, 4, 'Mick#0', '2019-04-24 19:02:31'),
(1584, 4, 154, 5, 'Jasmine#0', '2019-04-24 19:05:33'),
(1585, 4, 166, 6, 'Laney#0', '2019-04-24 19:03:33'),
(1586, 4, 173, 6, 'Jimmy#0', '2019-04-24 19:02:19'),
(1587, 4, 149, 6, 'Tavballzz#0', '2019-04-24 19:02:45'),
(1588, 4, 157, 6, 'Laney#0', '2019-04-24 19:04:58'),
(1589, 4, 157, 1, 'Jim#1', '2019-04-24 19:07:31'),
(1590, 4, 147, 5, 'Mick#0', '2019-04-24 19:07:46'),
(1591, 4, 141, 5, 'Laney#0', '2019-04-24 19:08:22'),
(1592, 4, 154, 7, 'Kevmc#0', '2019-04-24 19:02:51'),
(1593, 4, 154, 5, 'Laney#0', '2019-04-24 19:04:03'),
(1594, 4, 154, 5, 'Kevmc#0', '2019-04-24 19:08:39'),
(1595, 4, 147, 4, 'Tavballzz#0', '2019-04-24 19:10:32'),
(1596, 4, 186, 4, 'Kevmc#0', '2019-04-24 19:04:49'),
(1597, 4, 168, 5, 'Laney#0', '2019-04-24 19:06:23'),
(1598, 4, 157, 10, 'Joshwalker#0', '2019-04-24 19:10:48'),
(1599, 4, 146, 10, 'Joshwalker#0', '2019-04-24 19:11:26'),
(1600, 4, 186, 6, 'Tavballzz#0', '2019-04-24 19:02:07'),
(1601, 4, 168, 1, 'Joshwalker#0', '2019-04-24 19:10:42'),
(1602, 4, 141, 5, 'Paddy#0', '2019-04-24 19:04:40'),
(1603, 4, 183, 1, 'Joshwalker#0', '2019-04-24 19:10:37'),
(1604, 4, 151, 6, 'Kevmc#0', '2019-04-24 19:07:20'),
(1605, 4, 147, 7, 'Mick#0', '2019-04-24 19:08:22'),
(1606, 4, 171, 10, 'Adam#0', '2019-04-24 19:15:31'),
(1607, 4, 171, 5, 'Laney#0', '2019-04-24 19:04:36'),
(1608, 4, 165, 7, 'Jasmine#0', '2019-04-24 19:07:37'),
(1609, 4, 172, 1, 'Adam#0', '2019-04-24 19:15:41'),
(1610, 4, 165, 6, 'Paddy#0', '2019-04-24 19:07:41'),
(1611, 4, 172, 10, 'Adam#0', '2019-04-24 19:15:50'),
(1612, 4, 181, 10, 'Adam#0', '2019-04-24 19:16:00'),
(1613, 4, 151, 4, 'Mick#0', '2019-04-24 19:07:29'),
(1614, 4, 154, 5, 'Jimmy#0', '2019-04-24 19:04:26'),
(1615, 4, 150, 10, 'Adam#0', '2019-04-24 19:16:13'),
(1616, 4, 150, 6, 'Mick#0', '2019-04-24 19:02:38'),
(1617, 4, 183, 7, 'Laney#0', '2019-04-24 19:16:11'),
(1618, 4, 167, 6, 'Tavballzz#0', '2019-04-24 19:18:17'),
(1619, 4, 141, 4, 'Kevmc#0', '2019-04-24 19:08:47'),
(1620, 4, 165, 5, 'Kevmc#0', '2019-04-24 19:07:35'),
(1621, 4, 165, 6, 'Tavballzz#0', '2019-04-24 19:03:14'),
(1622, 4, 151, 7, 'Kevmc#0', '2019-04-24 19:13:16'),
(1623, 4, 165, 7, 'Tavballzz#0', '2019-04-24 19:19:01'),
(1624, 4, 165, 5, 'Laney#0', '2019-04-24 19:14:31'),
(1625, 4, 146, 6, 'Jimmy#0', '2019-04-24 19:17:29'),
(1626, 4, 141, 6, 'Tavballzz#0', '2019-04-24 19:03:31'),
(1627, 4, 151, 4, 'Jimmy#0', '2019-04-24 19:08:17'),
(1628, 4, 149, 7, 'Jhill13#0', '2019-04-24 19:14:15'),
(1629, 4, 141, 4, 'Jimmy#0', '2019-04-24 19:15:30'),
(1630, 4, 172, 5, 'Tavballzz#0', '2019-04-24 19:03:22'),
(1631, 4, 141, 7, 'Jasmine#0', '2019-04-24 19:12:16'),
(1632, 4, 141, 8, 'Paddy#0', '2019-04-24 19:12:12'),
(1633, 4, 168, 4, 'Miami93#0', '2019-04-24 19:14:48'),
(1634, 4, 181, 6, 'Adam#0', '2019-04-24 19:16:05'),
(1635, 4, 173, 7, 'Kevmc#0', '2019-04-24 19:21:38'),
(1636, 4, 173, 7, 'Jasmine#0', '2019-04-24 19:19:55'),
(1637, 4, 173, 6, 'Adam#0', '2019-04-24 19:20:51'),
(1638, 4, 186, 6, 'Kevmc#0', '2019-04-24 19:10:53'),
(1639, 4, 151, 7, 'Adam#0', '2019-04-24 19:20:40'),
(1640, 4, 150, 7, 'Mick#0', '2019-04-24 19:17:36'),
(1641, 4, 157, 6, 'Tavballzz#0', '2019-04-24 19:02:49'),
(1642, 4, 173, 7, 'Tavballzz#0', '2019-04-24 19:19:48'),
(1643, 4, 166, 7, 'Adam#0', '2019-04-24 19:28:44'),
(1644, 4, 186, 6, 'Adam#0', '2019-04-24 19:15:25'),
(1645, 4, 186, 5, 'Laney#0', '2019-04-24 19:13:28'),
(1646, 4, 149, 6, 'Adam#0', '2019-04-24 19:17:23'),
(1647, 4, 186, 6, 'Paddy#0', '2019-04-24 19:02:08'),
(1648, 4, 186, 7, 'Jasmine#0', '2019-04-24 19:07:11'),
(1649, 4, 171, 7, 'Mick#0', '2019-04-24 19:11:56'),
(1650, 4, 146, 6, 'Jimmy#0', '2019-04-24 19:19:37'),
(1651, 4, 157, 7, 'Jasmine#0', '2019-04-24 19:05:05'),
(1652, 4, 186, 5, 'Paddy#0', '2019-04-24 19:29:51'),
(1653, 4, 186, 6, 'Paddy#0', '2019-04-24 19:30:27'),
(1654, 4, 143, 5, 'Laney#0', '2019-04-24 19:08:16'),
(1655, 4, 186, 5, 'Jasmine#0', '2019-04-24 19:29:56'),
(1656, 4, 165, 6, 'Jimmy#0', '2019-04-24 19:24:45'),
(1657, 4, 149, 5, 'Mick#0', '2019-04-24 19:26:42'),
(1658, 4, 151, 5, 'Laney#0', '2019-04-24 19:13:04'),
(1659, 4, 147, 7, 'Adam#0', '2019-04-24 19:28:49'),
(1660, 4, 150, 6, 'Adam#0', '2019-04-24 19:16:27'),
(1661, 4, 143, 6, 'Tavballzz#0', '2019-04-24 19:02:55'),
(1662, 4, 172, 4, 'Adam#0', '2019-04-24 19:15:55'),
(1663, 4, 151, 8, 'Adam#0', '2019-04-24 19:26:33'),
(1664, 4, 141, 7, 'Adam#0', '2019-04-24 19:24:24'),
(1665, 4, 193, 6, 'Laney#0', '2019-04-24 19:05:34'),
(1666, 4, 149, 6, 'Laney#0', '2019-04-24 19:17:16'),
(1667, 4, 157, 5, 'Laney#0', '2019-04-24 19:07:17'),
(1668, 4, 149, 4, 'Adam#0', '2019-04-24 19:29:51'),
(1669, 4, 149, 6, 'Adam#0', '2019-04-24 19:34:32'),
(1670, 4, 147, 7, 'Miami93#0', '2019-04-24 19:28:46'),
(1671, 4, 141, 8, 'Jasmine#0', '2019-04-24 19:19:59'),
(1672, 4, 167, 4, 'Paddy#0', '2019-04-24 19:15:58'),
(1673, 4, 181, 5, 'Adam#0', '2019-04-24 19:22:26'),
(1674, 4, 186, 7, 'bigdickinit#0', '2019-04-24 19:36:28'),
(1675, 4, 186, 4, 'Adam#0', '2019-04-24 19:29:28'),
(1676, 4, 150, 5, 'Tomthewise1#0', '2019-04-24 19:38:02'),
(1677, 4, 186, 8, 'Paddy#0', '2019-04-24 19:30:32'),
(1678, 4, 143, 7, 'Tomthewise1#0', '2019-04-24 19:37:49'),
(1679, 4, 186, 9, 'Paddy#0', '2019-04-24 19:38:12'),
(1680, 4, 186, 1, 'Adam#0', '2019-04-24 19:38:03'),
(1681, 4, 150, 7, 'Adam#0', '2019-04-24 19:31:40'),
(1682, 4, 183, 5, 'Laney#0', '2019-04-24 19:18:17'),
(1683, 4, 183, 3, 'Miami93#0', '2019-04-24 19:15:32'),
(1684, 4, 183, 2, 'Miami93#0', '2019-04-24 19:41:00'),
(1685, 4, 154, 5, 'Adam#0', '2019-04-24 19:32:44'),
(1686, 4, 165, 6, 'Laney#0', '2019-04-24 19:19:30'),
(1687, 4, 146, 5, '#40', '2019-04-24 19:43:13'),
(1688, 4, 171, 5, 'Adam#0', '2019-04-24 19:15:36'),
(1689, 4, 181, 4, 'Adam#0', '2019-04-24 19:36:25'),
(1690, 4, 181, 3, 'Adam#0', '2019-04-24 19:43:59'),
(1691, 4, 149, 5, 'Laney#0', '2019-04-24 19:33:32'),
(1692, 4, 149, 7, 'Adam#0', '2019-04-24 19:34:41'),
(1693, 4, 161, 7, 'Adam#0', '2019-04-24 19:34:55'),
(1694, 4, 151, 7, 'Adam#0', '2019-04-24 19:32:26'),
(1695, 4, 165, 8, 'Tavballzz#1', '2019-04-24 19:45:12'),
(1696, 4, 165, 7, 'Polite#1', '2019-04-24 19:43:17'),
(1697, 4, 146, 4, 'Laney#0', '2019-04-24 19:32:34'),
(1698, 4, 165, 8, 'Tavballzz#1', '2019-04-24 19:45:14'),
(1699, 4, 146, 7, 'Jasmine#0', '2019-04-24 19:22:51'),
(1700, 4, 165, 7, 'Paddy#0', '2019-04-24 19:15:53'),
(1701, 4, 165, 7, 'Mick#0', '2019-04-24 19:18:47'),
(1702, 4, 165, 7, 'Jimmy#0', '2019-04-24 19:30:51'),
(1703, 4, 146, 7, 'Jimmy#0', '2019-04-24 19:30:10'),
(1704, 4, 146, 7, 'Mick#0', '2019-04-24 19:04:30'),
(1705, 4, 146, 5, 'Paddy#0', '2019-04-24 19:22:46'),
(1706, 4, 146, 6, 'bigdickinit#0', '2019-04-24 19:37:13'),
(1707, 4, 165, 9, 'bigdickinit#0', '2019-04-24 19:36:58'),
(1708, 4, 173, 6, 'Jasmine#0', '2019-04-24 19:23:10'),
(1709, 4, 166, 6, 'Krazymuthafuka#0', '2019-04-24 19:51:15'),
(1710, 4, 151, 8, 'Krazymuthafuka#0', '2019-04-24 19:50:09'),
(1711, 4, 150, 6, 'bigdickinit#0', '2019-04-24 19:37:07'),
(1712, 4, 141, 5, 'bigdickinit#0', '2019-04-24 19:37:37'),
(1713, 4, 157, 5, 'Kevmc#0', '2019-04-24 19:07:14'),
(1714, 4, 165, 8, 'bigdickinit#0', '2019-04-24 19:47:57'),
(1715, 4, 149, 6, 'bigdickinit#0', '2019-04-24 19:37:04'),
(1716, 4, 149, 7, 'Krazymuthafuka#0', '2019-04-24 19:52:43'),
(1717, 4, 150, 8, 'bigdickinit#0', '2019-04-24 19:52:27'),
(1718, 4, 146, 8, 'Paddy#0', '2019-04-24 19:47:26'),
(1719, 4, 173, 8, 'Gareth#0', '2019-04-24 19:53:56'),
(1720, 4, 147, 6, 'bigdickinit#0', '2019-04-24 19:37:16'),
(1721, 4, 146, 8, 'bigdickinit#0', '2019-04-24 19:47:50'),
(1722, 4, 161, 6, 'bigdickinit#0', '2019-04-24 19:37:19'),
(1723, 4, 142, 5, 'bigdickinit#0', '2019-04-24 19:37:23'),
(1724, 4, 154, 5, 'bigdickinit#0', '2019-04-24 19:37:27'),
(1725, 4, 143, 5, 'bigdickinit#0', '2019-04-24 19:37:31'),
(1726, 4, 141, 8, 'bigdickinit#0', '2019-04-24 19:52:33'),
(1727, 4, 157, 5, 'bigdickinit#0', '2019-04-24 19:37:34'),
(1728, 4, 186, 9, 'bigdickinit#0', '2019-04-24 19:37:45'),
(1729, 4, 172, 9, 'bigdickinit#0', '2019-04-24 19:36:35'),
(1730, 4, 173, 9, 'bigdickinit#0', '2019-04-24 19:36:38'),
(1731, 4, 166, 9, 'bigdickinit#0', '2019-04-24 19:36:41'),
(1732, 4, 193, 9, 'bigdickinit#0', '2019-04-24 19:36:32'),
(1733, 4, 168, 9, 'bigdickinit#0', '2019-04-24 19:36:51'),
(1734, 4, 181, 9, 'bigdickinit#0', '2019-04-24 19:36:55'),
(1735, 4, 165, 9, 'bigdickinit#0', '2019-04-24 19:52:38'),
(1736, 4, 151, 7, 'Jimmy#0', '2019-04-24 19:19:42'),
(1737, 4, 143, 8, 'Mick#0', '2019-04-24 19:04:46'),
(1738, 4, 172, 5, 'Jasmine#0', '2019-04-24 19:23:20'),
(1739, 4, 147, 5, 'Paddy#0', '2019-04-24 19:02:23'),
(1740, 4, 141, 7, 'Paddy#0', '2019-04-24 19:20:09'),
(1741, 4, 166, 4, 'Miami93#0', '2019-04-24 19:12:41'),
(1742, 4, 141, 8, 'Adam#0', '2019-04-24 19:32:49'),
(1743, 4, 141, 4, 'Adam#0', '2019-04-24 20:07:29'),
(1744, 4, 168, 5, 'Adam#0', '2019-04-24 19:15:09'),
(1745, 4, 142, 6, 'Jimmy#0', '2019-04-24 19:22:26'),
(1746, 4, 183, 6, 'Mick#0', '2019-04-24 19:10:17'),
(1747, 4, 171, 6, 'Jasmine#0', '2019-04-24 19:35:21'),
(1748, 4, 171, 2, 'Paddy#0', '2019-04-24 19:31:08'),
(1749, 4, 150, 5, 'Luke#0', '2019-04-24 20:08:16'),
(1750, 4, 173, 7, 'Paddy#0', '2019-04-24 19:20:05'),
(1751, 4, 147, 6, 'Jimmy#0', '2019-04-24 19:07:51'),
(1752, 4, 147, 6, 'Mick#0', '2019-04-24 19:14:37'),
(1753, 4, 173, 6, 'Luke#0', '2019-04-24 20:08:34'),
(1754, 4, 154, 4, 'Jasmine#0', '2019-04-24 19:05:39'),
(1755, 4, 150, 5, 'Luke#0', '2019-04-24 20:08:28'),
(1756, 4, 186, 6, 'Luke#0', '2019-04-24 20:08:04'),
(1757, 4, 147, 5, 'bigdickinit#0', '2019-04-24 19:55:25'),
(1758, 4, 172, 7, 'bigdickinit#0', '2019-04-24 19:56:06'),
(1759, 4, 173, 1, 'Polite#1', '2019-04-24 20:09:20'),
(1760, 4, 162, 1, 'Luke#0', '2019-04-24 20:10:54'),
(1761, 4, 151, 6, 'Miami93#0', '2019-04-24 19:32:57'),
(1762, 4, 151, 6, 'Jasmine#0', '2019-04-24 19:02:28'),
(1763, 4, 151, 7, '#40', '2019-04-24 19:20:34'),
(1764, 4, 146, 5, '#40', '2019-04-24 19:43:23'),
(1765, 4, 150, 5, 'Kevmc#0', '2019-04-24 19:04:00'),
(1766, 4, 151, 7, 'Kevmc#0', '2019-04-24 19:19:23'),
(1767, 4, 165, 6, 'Kevmc#0', '2019-04-24 19:18:46'),
(1768, 4, 165, 8, 'Jasmine#0', '2019-04-24 19:15:49'),
(1769, 4, 151, 7, 'Mick#0', '2019-04-24 19:16:09'),
(1770, 4, 150, 6, 'Mick#0', '2019-04-24 19:26:38'),
(1771, 4, 151, 6, 'Paddy#0', '2019-04-24 19:51:44'),
(1772, 4, 165, 5, 'Paddy#0', '2019-04-24 19:47:08'),
(1773, 4, 165, 6, 'Jimmy#0', '2019-04-24 19:47:15'),
(1774, 4, 172, 7, 'Jasmine#0', '2019-04-24 20:03:32'),
(1775, 4, 157, 6, 'Jasmine#0', '2019-04-24 19:30:17'),
(1776, 4, 157, 6, 'Paddy#0', '2019-04-24 19:15:16'),
(1777, 4, 166, 8, 'Jasmine#0', '2019-04-24 19:12:06'),
(1778, 4, 166, 7, 'Mick#0', '2019-04-24 19:22:22'),
(1779, 4, 151, 6, 'bigdickinit#0', '2019-04-24 19:37:10'),
(1780, 4, 151, 6, 'bigdickinit#0', '2019-04-24 20:17:24'),
(1781, 4, 165, 8, 'bigdickinit#0', '2019-04-24 19:56:34'),
(1782, 4, 166, 7, 'bigdickinit#0', '2019-04-24 19:56:14'),
(1783, 4, 141, 9, 'bigdickinit#0', '2019-04-24 19:55:50'),
(1784, 4, 146, 7, 'bigdickinit#0', '2019-04-24 19:55:28'),
(1785, 4, 173, 8, 'levins98#0', '2019-04-24 20:21:41'),
(1786, 4, 151, 7, 'Jasmine#0', '2019-04-24 20:13:33'),
(1787, 4, 151, 8, 'Adam#0', '2019-04-24 19:44:45'),
(1788, 4, 151, 8, 'Mick#0', '2019-04-24 20:16:21'),
(1789, 4, 166, 5, 'Miami93#0', '2019-04-24 20:04:59'),
(1790, 4, 146, 6, 'bigdickinit#0', '2019-04-24 20:20:18'),
(1791, 4, 171, 9, 'bigdickinit#0', '2019-04-24 19:36:45'),
(1792, 4, 171, 9, 'Jasmine#0', '2019-04-24 20:08:00'),
(1793, 4, 161, 7, '#40', '2019-04-24 20:23:43'),
(1794, 4, 171, 7, 'Jasmine#0', '2019-04-24 20:23:46'),
(1795, 4, 171, 8, 'Mick#0', '2019-04-24 19:30:06'),
(1796, 4, 166, 3, 'The Rater#0', '2019-04-24 19:27:12'),
(1797, 4, 171, 7, 'bigdickinit#0', '2019-04-24 20:23:37'),
(1798, 4, 166, 5, 'bigdickinit#0', '2019-04-24 20:17:37'),
(1799, 4, 166, 5, 'Jasmine#0', '2019-04-24 20:17:13'),
(1800, 4, 143, 6, 'David#0', '2019-04-24 20:24:51'),
(1801, 4, 183, 2, 'Miami93#0', '2019-04-24 19:41:02'),
(1802, 4, 162, 6, 'Tavballzz#1', '2019-04-24 20:11:28'),
(1803, 4, 165, 7, 'Miami93#0', '2019-04-24 19:43:27'),
(1804, 4, 165, 6, 'Caz#0', '2019-04-24 19:43:21'),
(1805, 4, 167, 6, 'Miami93#0', '2019-04-24 20:11:53'),
(1806, 4, 162, 7, 'Jimmy#0', '2019-04-24 20:13:15'),
(1807, 4, 162, 4, 'Mick#0', '2019-04-24 20:13:12'),
(1808, 4, 162, 6, 'Jasmine#0', '2019-04-24 20:13:08'),
(1809, 4, 162, 7, 'Adam#0', '2019-04-24 20:18:46'),
(1810, 4, 154, 6, '#40', '2019-04-24 20:28:13'),
(1811, 4, 165, 7, '#40', '2019-04-24 19:45:39'),
(1812, 4, 165, 3, 'Jimmy#0', '2019-04-24 20:16:44'),
(1813, 4, 165, 6, 'Mick#0', '2019-04-24 19:47:13'),
(1814, 4, 165, 4, 'Jasmine#0', '2019-04-24 20:16:13'),
(1815, 4, 165, 4, 'Paddy#0', '2019-04-24 20:16:39'),
(1816, 4, 186, 5, 'Paddy#0', '2019-04-24 19:38:24'),
(1817, 4, 165, 9, 'Tavballzz#1', '2019-04-24 19:46:49'),
(1818, 4, 165, 4, 'Tavballzz#1', '2019-04-24 20:29:04'),
(1819, 4, 186, 6, 'bigdickinit#0', '2019-04-24 19:56:01'),
(1820, 4, 165, 4, 'Tavballzz#1', '2019-04-24 20:29:06'),
(1821, 4, 165, 5, 'bigdickinit#0', '2019-04-24 20:17:33'),
(1822, 4, 154, 4, 'Adam#0', '2019-04-24 19:42:46'),
(1823, 4, 165, 5, 'Greek Freek#0', '2019-04-24 19:59:58'),
(1824, 4, 186, 9, 'bigdickinit#0', '2019-04-24 20:29:07'),
(1825, 4, 154, 6, 'bigdickinit#0', '2019-04-24 19:55:40'),
(1826, 4, 165, 8, 'Gareth#0', '2019-04-24 19:54:02'),
(1827, 4, 165, 4, 'Gareth#0', '2019-04-24 20:31:54'),
(1828, 4, 181, 6, 'Gareth#0', '2019-04-24 19:54:08'),
(1829, 4, 165, 8, 'Polite#1', '2019-04-24 19:45:25'),
(1830, 4, 172, 5, 'Miami93#0', '2019-04-24 20:15:40'),
(1831, 4, 141, 8, 'bigdickinit#0', '2019-04-24 20:17:40'),
(1832, 4, 188, 5, 'bigdickinit#0', '2019-04-24 20:34:52'),
(1833, 4, 162, 6, 'bigdickinit#0', '2019-04-24 20:23:32'),
(1834, 4, 141, 7, 'bigdickinit#0', '2019-04-24 20:35:00'),
(1835, 4, 165, 7, 'Laney#0', '2019-04-24 19:43:17'),
(1836, 4, 151, 4, 'Laney#0', '2019-04-24 19:31:28'),
(1837, 4, 173, 7, 'Adam#0', '2019-04-24 19:23:44'),
(1838, 4, 172, 5, 'Adam#0', '2019-04-24 19:31:54'),
(1839, 4, 188, 6, 'Adam#0', '2019-04-24 20:39:03'),
(1840, 4, 168, 4, 'Laney#0', '2019-04-24 19:11:17'),
(1841, 4, 193, 5, 'Jasmine#0', '2019-04-24 19:02:11'),
(1842, 4, 193, 7, 'Mick#0', '2019-04-24 19:24:21'),
(1843, 4, 193, 5, 'Jimmy#0', '2019-04-24 19:24:28'),
(1844, 4, 149, 7, 'Mick#0', '2019-04-24 19:30:56'),
(1845, 4, 149, 4, 'Jimmy#0', '2019-04-24 19:58:48'),
(1846, 4, 149, 6, 'Laney#0', '2019-04-24 19:44:23'),
(1847, 4, 141, 4, 'Laney#0', '2019-04-24 19:08:37'),
(1848, 4, 173, 7, 'Mick#0', '2019-04-24 19:19:47'),
(1849, 4, 154, 6, '#40', '2019-04-24 20:28:15'),
(1850, 4, 151, 6, 'Krazymuthafuka#0', '2019-04-24 19:51:47'),
(1851, 4, 154, 6, 'Jasmine#0', '2019-04-24 20:08:47'),
(1852, 4, 174, 6, 'Adam#0', '2019-04-24 20:50:55'),
(1853, 4, 193, 5, 'Adam#0', '2019-04-24 19:15:04'),
(1854, 4, 158, 5, 'Adam#0', '2019-04-24 20:51:27'),
(1855, 4, 141, 5, 'Adam#0', '2019-04-24 20:07:34'),
(1856, 4, 157, 4, 'Adam#0', '2019-04-24 19:27:29'),
(1857, 4, 161, 8, 'Adam#0', '2019-04-24 19:44:42'),
(1858, 4, 187, 7, 'Adam#0', '2019-04-24 20:51:06'),
(1859, 4, 187, 4, 'bigdickinit#0', '2019-04-24 20:50:32'),
(1860, 4, 165, 6, 'Adam#0', '2019-04-24 19:20:18'),
(1861, 4, 188, 4, 'Adam#0', '2019-04-24 20:39:08'),
(1862, 4, 149, 7, 'David#0', '2019-04-24 20:25:32'),
(1863, 4, 162, 5, 'David#0', '2019-04-24 20:22:55'),
(1864, 4, 165, 3, 'Paddy#0', '2019-04-24 20:28:50'),
(1865, 4, 151, 8, 'Paddy#0', '2019-04-24 20:16:35'),
(1866, 4, 151, 7, 'bigdickinit#0', '2019-04-24 20:17:28'),
(1867, 4, 165, 1, 'bigdickinit#0', '2019-04-24 20:29:16'),
(1868, 4, 174, 4, '#40', '2019-04-24 20:55:56'),
(1869, 4, 141, 7, '#40', '2019-04-24 19:32:52'),
(1870, 4, 141, 6, 'Adam#0', '2019-04-24 20:52:08'),
(1871, 4, 141, 7, 'Alice Hoey#0', '2019-04-24 20:19:43'),
(1872, 4, 141, 8, 'bigdickinit#0', '2019-04-24 20:37:58'),
(1873, 4, 141, 6, 'David#0', '2019-04-24 20:23:18'),
(1874, 4, 141, 6, 'DonalIsHere#0', '2019-04-24 20:25:33'),
(1875, 4, 141, 6, 'Gareth#0', '2019-04-24 19:56:03'),
(1876, 4, 141, 5, 'Jasmine#0', '2019-04-24 19:35:39'),
(1877, 4, 141, 8, 'Jhill13#0', '2019-04-24 19:20:47'),
(1878, 4, 141, 7, 'Jimmy#0', '2019-04-24 19:19:50'),
(1879, 4, 141, 4, 'Josh#1', '2019-04-24 20:13:48'),
(1880, 4, 141, 10, 'Joshwalker#0', '2019-04-24 19:11:45'),
(1881, 4, 141, 7, 'Kevmc#0', '2019-04-24 19:18:38'),
(1882, 4, 141, 7, 'Krazymuthafuka#0', '2019-04-24 19:50:28'),
(1883, 4, 141, 5, 'Laney#0', '2019-04-24 20:44:14'),
(1884, 4, 141, 5, 'Luke#0', '2019-04-24 20:10:06'),
(1885, 4, 141, 7, 'Miami93#0', '2019-04-24 19:18:38'),
(1886, 4, 141, 5, 'Mick#0', '2019-04-24 19:24:56'),
(1887, 4, 141, 6, 'Nhla SN#0', '2019-04-24 20:51:42'),
(1888, 4, 141, 4, 'Paddy#0', '2019-04-24 20:03:44'),
(1889, 4, 141, 7, 'Polite#1', '2019-04-24 20:46:10'),
(1890, 4, 141, 7, 'Tavballzz#0', '2019-04-24 19:19:40'),
(1891, 4, 141, 6, 'Tavballzz#1', '2019-04-24 19:50:46'),
(1892, 4, 141, 8, 'ThaRealOne#0', '2019-04-24 19:37:38'),
(1893, 4, 141, 7, 'The Rater#0', '2019-04-24 20:01:27'),
(1894, 4, 141, 7, 'Tomthewise1#0', '2019-04-24 19:38:27'),
(1895, 4, 142, 6, '#40', '2019-04-24 20:55:49'),
(1896, 4, 142, 7, 'Adam#0', '2019-04-24 19:46:55'),
(1897, 4, 142, 6, 'Alice Hoey#0', '2019-04-24 20:19:38'),
(1898, 4, 142, 7, 'bigdickinit#0', '2019-04-24 19:55:36'),
(1899, 4, 142, 2, 'Caz#0', '2019-04-24 20:15:27'),
(1900, 4, 142, 5, 'Gareth#0', '2019-04-24 19:55:58'),
(1901, 4, 142, 3, 'GaryMc#0', '2019-04-24 19:50:16'),
(1902, 4, 142, 5, 'Jasmine#0', '2019-04-24 19:22:36'),
(1903, 4, 142, 7, 'Jhill13#0', '2019-04-24 19:19:49'),
(1904, 4, 142, 1, 'Jim#1', '2019-04-24 19:08:59'),
(1905, 4, 142, 7, 'Jimmy#0', '2019-04-24 20:07:53'),
(1906, 4, 142, 10, 'Joshwalker#0', '2019-04-24 19:10:31'),
(1907, 4, 142, 5, 'Kevmc#0', '2019-04-24 19:51:05'),
(1908, 4, 142, 6, 'Laney#0', '2019-04-24 19:40:06'),
(1909, 4, 142, 5, 'Luke#0', '2019-04-24 20:09:23'),
(1910, 4, 142, 5, 'Mick#0', '2019-04-24 19:55:06'),
(1911, 4, 142, 5, 'Nhla SN#0', '2019-04-24 20:51:38'),
(1912, 4, 142, 7, 'Paddy#0', '2019-04-24 19:22:41'),
(1913, 4, 142, 5, 'Polite#1', '2019-04-24 20:51:53'),
(1914, 4, 142, 6, 'Tavballzz#0', '2019-04-24 19:03:28'),
(1915, 4, 142, 7, 'ThaRealOne#0', '2019-04-24 19:37:23'),
(1916, 4, 142, 6, 'Tomthewise1#0', '2019-04-24 19:38:23'),
(1917, 4, 143, 7, 'Adam#0', '2019-04-24 19:31:46'),
(1918, 4, 143, 6, 'Alice Hoey#0', '2019-04-24 20:19:28'),
(1919, 4, 143, 7, 'bigdickinit#0', '2019-04-24 19:55:45'),
(1920, 4, 143, 6, 'David#0', '2019-04-24 20:24:53'),
(1921, 4, 143, 8, 'Gareth#0', '2019-04-24 19:55:48'),
(1922, 4, 143, 8, 'GaryMc#0', '2019-04-24 19:50:07'),
(1923, 4, 143, 5, 'Jasmine#0', '2019-04-24 19:26:35'),
(1924, 4, 143, 7, 'Jhill13#0', '2019-04-24 19:19:54'),
(1925, 4, 143, 3, 'Jim#1', '2019-04-24 19:06:30'),
(1926, 4, 143, 5, 'Jimmy#0', '2019-04-24 19:24:52'),
(1927, 4, 143, 10, 'Joshwalker#0', '2019-04-24 19:11:34'),
(1928, 4, 143, 6, 'Kevmc#0', '2019-04-24 19:19:07'),
(1929, 4, 143, 8, 'Krazymuthafuka#0', '2019-04-24 19:50:13'),
(1930, 4, 143, 6, 'Laney#0', '2019-04-24 19:30:37'),
(1931, 4, 143, 8, 'liambarnacle#0', '2019-04-24 19:44:21'),
(1932, 4, 143, 5, 'Luke#0', '2019-04-24 20:09:11'),
(1933, 4, 143, 6, 'Mick#0', '2019-04-24 19:59:07'),
(1934, 4, 143, 6, 'Nhla SN#0', '2019-04-24 20:51:30'),
(1935, 4, 143, 6, 'Paddy#0', '2019-04-24 19:26:29'),
(1936, 4, 143, 6, 'Polite#1', '2019-04-24 20:53:30'),
(1937, 4, 143, 7, 'Tavballzz#0', '2019-04-24 19:31:49'),
(1938, 4, 143, 6, 'ThaRealOne#0', '2019-04-24 19:37:04'),
(1939, 4, 143, 7, 'Tomthewise1#0', '2019-04-24 19:38:20'),
(1940, 4, 146, 7, '#40', '2019-04-24 20:14:30'),
(1941, 4, 146, 6, 'Adam#0', '2019-04-24 19:36:14'),
(1942, 4, 146, 6, 'Alice Hoey#0', '2019-04-24 20:19:16'),
(1943, 4, 146, 7, 'bigdickinit#0', '2019-04-24 20:23:27'),
(1944, 4, 146, 6, 'David#0', '2019-04-24 20:25:21'),
(1945, 4, 146, 7, 'Gareth#0', '2019-04-24 19:55:39'),
(1946, 4, 146, 5, 'Jasmine#0', '2019-04-24 19:47:05'),
(1947, 4, 146, 6, 'Jhill13#0', '2019-04-24 19:20:22'),
(1948, 4, 146, 1, 'Jim#1', '2019-04-24 19:07:43'),
(1949, 4, 146, 8, 'Jimmy#0', '2019-04-24 19:47:18'),
(1950, 4, 146, 10, 'Joshwalker#0', '2019-04-24 19:11:39'),
(1951, 4, 146, 4, 'Kevmc#0', '2019-04-24 19:50:59'),
(1952, 4, 146, 5, 'Krazymuthafuka#0', '2019-04-24 19:52:00'),
(1953, 4, 146, 6, 'Laney#0', '2019-04-24 19:46:04'),
(1954, 4, 146, 5, 'Luke#0', '2019-04-24 20:09:39'),
(1955, 4, 146, 4, 'Miami93#0', '2019-04-24 19:39:41'),
(1956, 4, 146, 7, 'Mick#0', '2019-04-24 19:47:22'),
(1957, 4, 146, 5, 'Paddy#0', '2019-04-24 19:54:42'),
(1958, 4, 146, 6, 'Tavballzz#0', '2019-04-24 19:02:33'),
(1959, 4, 146, 6, 'ThaRealOne#0', '2019-04-24 19:36:28'),
(1960, 4, 146, 6, 'Tomthewise1#0', '2019-04-24 19:38:34'),
(1961, 4, 147, 7, '#40', '2019-04-24 19:29:09'),
(1962, 4, 147, 8, 'Adam#0', '2019-04-24 19:31:30'),
(1963, 4, 147, 7, 'bigdickinit#0', '2019-04-24 20:09:03'),
(1964, 4, 147, 5, 'Gareth#0', '2019-04-24 19:55:35'),
(1965, 4, 147, 5, 'GaryMc#0', '2019-04-24 19:50:04'),
(1966, 4, 147, 7, 'Greek Freek#0', '2019-04-24 20:00:27'),
(1967, 4, 147, 7, 'Jhill13#0', '2019-04-24 19:20:09'),
(1968, 4, 147, 1, 'Jim#1', '2019-04-24 19:07:39'),
(1969, 4, 147, 7, 'Jimmy#0', '2019-04-24 20:08:39'),
(1970, 4, 147, 10, 'Joshwalker#0', '2019-04-24 19:11:22'),
(1971, 4, 147, 8, 'Kevmc#0', '2019-04-24 19:44:28'),
(1972, 4, 147, 5, 'Krazymuthafuka#0', '2019-04-24 19:51:56'),
(1973, 4, 147, 5, 'Laney#0', '2019-04-24 19:30:23'),
(1974, 4, 147, 8, 'liambarnacle#0', '2019-04-24 19:30:08'),
(1975, 4, 147, 8, 'Luke#0', '2019-04-24 20:09:06'),
(1976, 4, 147, 8, 'Miami93#0', '2019-04-24 19:35:39'),
(1977, 4, 147, 7, 'Mick#0', '2019-04-24 20:08:41'),
(1978, 4, 147, 9, 'Paddy#0', '2019-04-24 20:03:39'),
(1979, 4, 147, 5, 'Tavballzz#0', '2019-04-24 19:10:46'),
(1980, 4, 147, 8, 'Tavballzz#1', '2019-04-24 20:08:39'),
(1981, 4, 147, 7, 'ThaRealOne#0', '2019-04-24 19:36:19'),
(1982, 4, 147, 9, 'Tomthewise1#0', '2019-04-24 19:38:30'),
(1983, 4, 149, 7, '#40', '2019-04-24 20:27:14'),
(1984, 4, 149, 7, 'Adam#0', '2019-04-24 19:44:33'),
(1985, 4, 149, 6, 'Alice Hoey#0', '2019-04-24 20:18:57'),
(1986, 4, 149, 8, 'bigdickinit#0', '2019-04-24 19:52:43'),
(1987, 4, 149, 8, 'David#0', '2019-04-24 20:54:55'),
(1988, 4, 149, 7, 'Gareth#0', '2019-04-24 19:55:19'),
(1989, 4, 149, 8, 'Greek Freek#0', '2019-04-24 20:30:20'),
(1990, 4, 149, 7, 'Jasmine#0', '2019-04-24 19:26:47'),
(1991, 4, 149, 8, 'Jhill13#0', '2019-04-24 19:19:42'),
(1992, 4, 149, 1, 'Jim#1', '2019-04-24 19:07:56'),
(1993, 4, 149, 4, 'Jimmy#0', '2019-04-24 20:41:33'),
(1994, 4, 149, 10, 'Joshwalker#0', '2019-04-24 19:10:24'),
(1995, 4, 149, 6, 'Kevmc#0', '2019-04-24 19:11:29'),
(1996, 4, 149, 7, 'Krazymuthafuka#0', '2019-04-24 19:52:45'),
(1997, 4, 149, 5, 'Laney#0', '2019-04-24 20:42:50'),
(1998, 4, 149, 4, 'liambarnacle#0', '2019-04-24 19:23:30'),
(1999, 4, 149, 4, 'Luke#0', '2019-04-24 20:09:58'),
(2000, 4, 149, 4, 'Mick#0', '2019-04-24 20:41:30'),
(2001, 4, 149, 9, 'Mojo#0', '2019-04-24 19:46:32'),
(2002, 4, 149, 7, 'Nhla SN#0', '2019-04-24 20:49:06'),
(2003, 4, 149, 6, 'Paddy#0', '2019-04-24 19:51:35'),
(2004, 4, 149, 8, 'Polite#1', '2019-04-24 19:45:14'),
(2005, 4, 149, 5, 'Tavballzz#0', '2019-04-24 19:06:23'),
(2006, 4, 149, 10, 'ThaRealOne#0', '2019-04-24 19:35:57'),
(2007, 4, 149, 8, 'Tomthewise1#0', '2019-04-24 19:37:38'),
(2008, 4, 150, 8, 'Adam#0', '2019-04-24 19:39:40'),
(2009, 4, 150, 5, 'Alice Hoey#0', '2019-04-24 20:18:51'),
(2010, 4, 150, 7, 'bigdickinit#0', '2019-04-24 19:52:48'),
(2011, 4, 150, 7, 'David#0', '2019-04-24 20:25:36'),
(2012, 4, 150, 8, 'Gareth#0', '2019-04-24 19:55:12'),
(2013, 4, 150, 3, 'GaryMc#0', '2019-04-24 19:50:28'),
(2014, 4, 150, 7, 'Jasmine#0', '2019-04-24 19:04:35'),
(2015, 4, 150, 8, 'Jhill13#0', '2019-04-24 19:19:19'),
(2016, 4, 150, 1, 'Jim#1', '2019-04-24 19:07:52'),
(2017, 4, 150, 6, 'Jimmy#0', '2019-04-24 19:14:43'),
(2018, 4, 150, 10, 'Joshwalker#0', '2019-04-24 19:11:10'),
(2019, 4, 150, 8, 'Kevmc#0', '2019-04-24 20:15:36'),
(2020, 4, 150, 5, 'Krazymuthafuka#0', '2019-04-24 19:51:29'),
(2021, 4, 150, 5, 'Laney#0', '2019-04-24 19:34:02'),
(2022, 4, 150, 9, 'liambarnacle#0', '2019-04-24 19:27:09'),
(2023, 4, 150, 5, 'Luke#0', '2019-04-24 20:08:49'),
(2024, 4, 150, 6, 'Mick#0', '2019-04-24 20:16:25'),
(2025, 4, 150, 5, 'Paddy#0', '2019-04-24 19:51:39'),
(2026, 4, 150, 5, 'Tavballzz#1', '2019-04-24 19:46:30'),
(2027, 4, 150, 10, 'ThaRealOne#0', '2019-04-24 19:35:52'),
(2028, 4, 150, 5, 'Tomthewise1#0', '2019-04-24 19:38:04'),
(2029, 4, 151, 8, '#40', '2019-04-24 20:14:06'),
(2030, 4, 151, 7, 'Adam#0', '2019-04-24 20:22:51'),
(2031, 4, 151, 4, 'Alice Hoey#0', '2019-04-24 20:18:45'),
(2032, 4, 151, 9, 'bigdickinit#0', '2019-04-24 20:55:40'),
(2033, 4, 151, 8, 'David#0', '2019-04-24 20:23:09'),
(2034, 4, 151, 5, 'DonalIsHere#0', '2019-04-24 20:25:24'),
(2035, 4, 151, 7, 'Gareth#0', '2019-04-24 19:55:05'),
(2036, 4, 151, 7, 'GaryMc#0', '2019-04-24 19:50:00'),
(2037, 4, 151, 6, 'h#17', '2019-04-24 20:22:47'),
(2038, 4, 151, 6, 'Jasmine#0', '2019-04-24 20:22:40'),
(2039, 4, 151, 9, 'Jhill13#0', '2019-04-24 19:19:09'),
(2040, 4, 151, 1, 'Jim#1', '2019-04-24 19:07:48'),
(2041, 4, 151, 5, 'Jimmy#0', '2019-04-24 19:58:52'),
(2042, 4, 151, 10, 'Joshwalker#0', '2019-04-24 19:12:41'),
(2043, 4, 151, 8, 'Kevmc#0', '2019-04-24 20:15:42'),
(2044, 4, 151, 7, 'Krazymuthafuka#0', '2019-04-24 20:49:11'),
(2045, 4, 151, 8, 'Laney#0', '2019-04-24 20:38:47'),
(2046, 4, 151, 8, 'liambarnacle#0', '2019-04-24 19:22:56'),
(2047, 4, 151, 6, 'Luke#0', '2019-04-24 20:09:50'),
(2048, 4, 151, 8, 'Miami93#0', '2019-04-24 20:13:16'),
(2049, 4, 151, 7, 'Mick#0', '2019-04-24 20:22:52'),
(2050, 4, 151, 7, 'Nhla SN#0', '2019-04-24 20:49:24'),
(2051, 4, 151, 9, 'Paddy#0', '2019-04-24 20:55:32'),
(2052, 4, 151, 7, 'Polite#1', '2019-04-24 20:53:43'),
(2053, 4, 151, 4, 'Tavballzz#0', '2019-04-24 19:32:50'),
(2054, 4, 151, 9, 'Tavballzz#1', '2019-04-24 20:13:03'),
(2055, 4, 151, 9, 'ThaRealOne#0', '2019-04-24 19:35:45'),
(2056, 4, 151, 7, 'The Rater#0', '2019-04-24 20:14:55'),
(2057, 4, 151, 8, 'Tomthewise1#0', '2019-04-24 19:38:42'),
(2058, 4, 154, 7, '#40', '2019-04-24 20:47:00'),
(2059, 4, 154, 5, 'Adam#0', '2019-04-24 20:29:43'),
(2060, 4, 154, 6, 'Alice Hoey#0', '2019-04-24 20:19:33'),
(2061, 4, 154, 7, 'bigdickinit#0', '2019-04-24 20:30:45'),
(2062, 4, 154, 7, 'David#0', '2019-04-24 20:23:22'),
(2063, 4, 154, 6, 'DonalIsHere#0', '2019-04-24 20:25:57'),
(2064, 4, 154, 5, 'Gareth#0', '2019-04-24 19:55:53'),
(2065, 4, 154, 3, 'GaryMc#0', '2019-04-24 19:50:11'),
(2066, 4, 154, 10, 'Hillb#0', '2019-04-24 19:12:17'),
(2067, 4, 154, 4, 'Jasmine#0', '2019-04-24 20:49:58'),
(2068, 4, 154, 6, 'Jhill13#0', '2019-04-24 19:19:32'),
(2069, 4, 154, 1, 'Jim#1', '2019-04-24 19:06:42'),
(2070, 4, 154, 6, 'Jimmy#0', '2019-04-24 19:16:18'),
(2071, 4, 154, 10, 'Joshwalker#0', '2019-04-24 19:11:50'),
(2072, 4, 154, 4, 'Kevmc#0', '2019-04-24 19:09:46'),
(2073, 4, 154, 6, 'Krazymuthafuka#0', '2019-04-24 19:50:21'),
(2074, 4, 154, 4, 'Laney#0', '2019-04-24 19:09:34'),
(2075, 4, 154, 4, 'Luke#0', '2019-04-24 20:09:16'),
(2076, 4, 154, 4, 'Miami93#0', '2019-04-24 19:41:12'),
(2077, 4, 154, 4, 'Mick#0', '2019-04-24 19:05:43'),
(2078, 4, 154, 5, 'Nhla SN#0', '2019-04-24 20:51:34'),
(2079, 4, 154, 7, 'Paddy#0', '2019-04-24 19:04:21'),
(2080, 4, 154, 6, 'Polite#1', '2019-04-24 20:18:50'),
(2081, 4, 154, 4, 'Tavballzz#0', '2019-04-24 19:09:46'),
(2082, 4, 154, 7, 'ThaRealOne#0', '2019-04-24 19:37:15'),
(2083, 4, 157, 6, '#40', '2019-04-24 20:55:54'),
(2084, 4, 157, 5, 'Adam#0', '2019-04-24 20:52:17'),
(2085, 4, 157, 6, 'Alice Hoey#0', '2019-04-24 20:19:23'),
(2086, 4, 157, 4, 'bigdickinit#0', '2019-04-24 19:55:55'),
(2087, 4, 157, 5, 'David#0', '2019-04-24 20:24:41'),
(2088, 4, 157, 7, 'Gareth#0', '2019-04-24 19:55:44'),
(2089, 4, 157, 5, 'GaryMc#0', '2019-04-24 19:50:22'),
(2090, 4, 157, 4, 'Hillb#0', '2019-04-24 19:28:46'),
(2091, 4, 157, 5, 'Jasmine#0', '2019-04-24 20:17:05'),
(2092, 4, 157, 7, 'Jhill13#0', '2019-04-24 19:20:03'),
(2093, 4, 157, 1, 'Jim#1', '2019-04-24 19:08:08'),
(2094, 4, 157, 7, 'Jimmy#0', '2019-04-24 19:04:50'),
(2095, 4, 157, 10, 'Joshwalker#0', '2019-04-24 19:11:30'),
(2096, 4, 157, 7, 'Kevmc#0', '2019-04-24 19:52:37'),
(2097, 4, 157, 6, 'Krazymuthafuka#0', '2019-04-24 19:52:05'),
(2098, 4, 157, 6, 'Laney#0', '2019-04-24 19:33:51'),
(2099, 4, 157, 4, 'Luke#0', '2019-04-24 20:09:29'),
(2100, 4, 157, 6, 'Mick#0', '2019-04-24 19:15:09'),
(2101, 4, 157, 5, 'Nhla SN#0', '2019-04-24 20:51:26'),
(2102, 4, 157, 5, 'Paddy#0', '2019-04-24 20:17:09'),
(2103, 4, 157, 6, 'Polite#1', '2019-04-24 20:53:35'),
(2104, 4, 157, 5, 'Tavballzz#0', '2019-04-24 19:26:58'),
(2105, 4, 157, 6, 'ThaRealOne#0', '2019-04-24 19:36:50'),
(2106, 4, 157, 6, 'Tomthewise1#0', '2019-04-24 19:38:15'),
(2107, 4, 158, 5, 'Adam#0', '2019-04-24 20:51:28'),
(2108, 4, 158, 5, 'bigdickinit#0', '2019-04-24 20:50:26'),
(2109, 4, 158, 7, 'David#0', '2019-04-24 20:50:02'),
(2110, 4, 158, 7, 'Krazymuthafuka#0', '2019-04-24 20:49:17'),
(2111, 4, 158, 6, 'Nhla SN#0', '2019-04-24 20:51:20'),
(2112, 4, 158, 6, 'Polite#1', '2019-04-24 20:53:57'),
(2113, 4, 158, 4, 'Tavballzz#1', '2019-04-24 20:50:09'),
(2114, 4, 161, 7, '#40', '2019-04-24 20:23:49'),
(2115, 4, 161, 7, 'Adam#0', '2019-04-24 20:52:24'),
(2116, 4, 161, 6, 'Alice Hoey#0', '2019-04-24 20:19:02'),
(2117, 4, 161, 4, 'bigdickinit#0', '2019-04-24 19:55:32'),
(2118, 4, 161, 6, 'Caz#0', '2019-04-24 19:43:30'),
(2119, 4, 161, 6, 'David#0', '2019-04-24 20:25:28'),
(2120, 4, 161, 5, 'Gareth#0', '2019-04-24 19:55:28'),
(2121, 4, 161, 6, 'Jasmine#0', '2019-04-24 19:26:54'),
(2122, 4, 161, 6, 'Jhill13#0', '2019-04-24 19:20:14'),
(2123, 4, 161, 1, 'Jim#1', '2019-04-24 19:07:35'),
(2124, 4, 161, 4, 'Jimmy#0', '2019-04-24 19:58:57'),
(2125, 4, 161, 10, 'Joshwalker#0', '2019-04-24 19:11:18'),
(2126, 4, 161, 5, 'Kevmc#0', '2019-04-24 19:05:54'),
(2127, 4, 161, 8, 'Krazymuthafuka#0', '2019-04-24 19:51:50'),
(2128, 4, 161, 6, 'Laney#0', '2019-04-24 19:05:57'),
(2129, 4, 161, 7, 'Luke#0', '2019-04-24 20:09:45'),
(2130, 4, 161, 4, 'Mantiya#0', '2019-04-24 20:10:52'),
(2131, 4, 161, 6, 'Nhla SN#0', '2019-04-24 20:51:14'),
(2132, 4, 161, 8, 'Paddy#0', '2019-04-24 19:26:59'),
(2133, 4, 161, 8, 'Polite#1', '2019-04-24 19:45:08'),
(2134, 4, 161, 6, 'Tavballzz#0', '2019-04-24 19:02:41'),
(2135, 4, 161, 7, 'Tavballzz#1', '2019-04-24 19:45:33'),
(2136, 4, 161, 7, 'ThaRealOne#0', '2019-04-24 19:36:09'),
(2137, 4, 161, 7, 'Tomthewise1#0', '2019-04-24 19:38:38'),
(2138, 4, 162, 7, '#40', '2019-04-24 20:21:27'),
(2139, 4, 162, 8, 'Adam#0', '2019-04-24 20:26:14'),
(2140, 4, 162, 6, 'Alice Hoey#0', '2019-04-24 20:19:08'),
(2141, 4, 162, 6, 'bigdickinit#0', '2019-04-24 20:37:52'),
(2142, 4, 162, 8, 'David#0', '2019-04-24 20:55:05'),
(2143, 4, 162, 8, 'Greek Freek#0', '2019-04-24 20:29:42'),
(2144, 4, 162, 5, 'Hillb#0', '2019-04-24 20:43:17'),
(2145, 4, 162, 7, 'Jasmine#0', '2019-04-24 20:25:48'),
(2146, 4, 162, 8, 'Jimmy#0', '2019-04-24 20:25:39'),
(2147, 4, 162, 8, 'Kevmc#0', '2019-04-24 20:25:09'),
(2148, 4, 162, 6, 'Krazymuthafuka#0', '2019-04-24 20:48:54'),
(2149, 4, 162, 6, 'Laney#0', '2019-04-24 20:38:39'),
(2150, 4, 162, 2, 'Luke#0', '2019-04-24 20:12:07'),
(2151, 4, 162, 8, 'Mick#0', '2019-04-24 20:25:43'),
(2152, 4, 162, 6, 'Nhla SN#0', '2019-04-24 20:49:32'),
(2153, 4, 162, 7, 'Paddy#0', '2019-04-24 20:13:20'),
(2154, 4, 162, 6, 'Polite#1', '2019-04-24 20:19:06'),
(2155, 4, 162, 7, 'Tavballzz#1', '2019-04-24 20:25:02'),
(2156, 4, 164, 6, '#40', '2019-04-24 20:55:14'),
(2157, 4, 164, 6, 'Adam#0', '2019-04-24 20:51:34'),
(2158, 4, 164, 5, 'bigdickinit#0', '2019-04-24 20:50:23'),
(2159, 4, 164, 7, 'David#0', '2019-04-24 20:50:08'),
(2160, 4, 164, 5, 'Jimmy#0', '2019-04-24 20:50:01'),
(2161, 4, 164, 4, 'Mick#0', '2019-04-24 20:50:03'),
(2162, 4, 164, 5, 'Nhla SN#0', '2019-04-24 20:51:09'),
(2163, 4, 164, 5, 'Paddy#0', '2019-04-24 20:50:16'),
(2164, 4, 164, 6, 'Polite#1', '2019-04-24 20:53:51'),
(2165, 4, 165, 6, '#40', '2019-04-24 20:28:22'),
(2166, 4, 165, 4, 'Adam#0', '2019-04-24 20:53:01'),
(2167, 4, 165, 5, 'Alice Hoey#0', '2019-04-24 20:17:13'),
(2168, 4, 165, 1, 'bigdickinit#0', '2019-04-24 20:55:45'),
(2169, 4, 165, 2, 'Caz#0', '2019-04-24 20:25:21'),
(2170, 4, 165, 7, 'David#0', '2019-04-24 20:26:34'),
(2171, 4, 165, 4, 'DonalIsHere#0', '2019-04-24 20:26:07'),
(2172, 4, 165, 5, 'Gareth#0', '2019-04-24 20:31:58'),
(2173, 4, 165, 8, 'GaryMc#0', '2019-04-24 19:49:17'),
(2174, 4, 165, 3, 'Greek Freek#0', '2019-04-24 20:30:31'),
(2175, 4, 165, 1, 'Hillb#0', '2019-04-24 20:43:38'),
(2176, 4, 165, 2, 'Jasmine#0', '2019-04-24 20:28:46'),
(2177, 4, 165, 1, 'Jhill13#0', '2019-04-24 19:12:25'),
(2178, 4, 165, 2, 'Jimmy#0', '2019-04-24 20:28:37'),
(2179, 4, 165, 1, 'Joshwalker#0', '2019-04-24 19:11:56'),
(2180, 4, 165, 8, 'Justjason#0', '2019-04-24 19:56:19'),
(2181, 4, 165, 2, 'Kevmc#0', '2019-04-24 20:15:51'),
(2182, 4, 165, 7, 'Krazymuthafuka#0', '2019-04-24 19:49:45'),
(2183, 4, 165, 4, 'Laney#0', '2019-04-24 20:38:26'),
(2184, 4, 165, 9, 'liambarnacle#0', '2019-04-24 19:45:07'),
(2185, 4, 165, 7, 'Luke#0', '2019-04-24 20:07:16'),
(2186, 4, 165, 3, 'Miami93#0', '2019-04-24 20:25:09'),
(2187, 4, 165, 2, 'Mick#0', '2019-04-24 20:28:40'),
(2188, 4, 165, 4, 'Nhla SN#0', '2019-04-24 20:48:52'),
(2189, 4, 165, 1, 'Paddy#0', '2019-04-24 20:55:28'),
(2190, 4, 165, 5, 'Polite#1', '2019-04-24 20:32:33'),
(2191, 4, 165, 8, 'Tavballzz#0', '2019-04-24 19:19:29'),
(2192, 4, 165, 3, 'Tavballzz#1', '2019-04-24 20:29:13'),
(2193, 4, 165, 7, 'ThaRealOne#0', '2019-04-24 19:33:44'),
(2194, 4, 165, 3, 'The Rater#0', '2019-04-24 20:48:34'),
(2195, 4, 165, 5, 'Tomthewise1#0', '2019-04-24 19:39:14'),
(2196, 4, 166, 5, '#40', '2019-04-24 20:56:00'),
(2197, 4, 166, 7, 'Adam#0', '2019-04-24 19:28:45'),
(2198, 4, 166, 3, 'Alice Hoey#0', '2019-04-24 20:18:23'),
(2199, 4, 166, 6, 'bigdickinit#0', '2019-04-24 20:24:21'),
(2200, 4, 166, 4, 'David#0', '2019-04-24 20:25:52'),
(2201, 4, 166, 6, 'Gareth#0', '2019-04-24 19:54:48'),
(2202, 4, 166, 6, 'GaryMc#0', '2019-04-24 19:49:44'),
(2203, 4, 166, 4, 'Jasmine#0', '2019-04-24 20:24:26'),
(2204, 4, 166, 1, 'Jim#1', '2019-04-24 19:06:55'),
(2205, 4, 166, 7, 'Jimmy#0', '2019-04-24 19:12:01'),
(2206, 4, 166, 1, 'Joshwalker#0', '2019-04-24 19:12:30'),
(2207, 4, 166, 6, 'Justjason#0', '2019-04-24 19:57:07'),
(2208, 4, 166, 7, 'Kevmc#0', '2019-04-24 19:11:03'),
(2209, 4, 166, 7, 'Krazymuthafuka#0', '2019-04-24 19:51:21'),
(2210, 4, 166, 7, 'Laney#0', '2019-04-24 19:05:47'),
(2211, 4, 166, 7, 'Luke#0', '2019-04-24 20:08:22'),
(2212, 4, 166, 7, 'Mantiya#0', '2019-04-24 20:10:23'),
(2213, 4, 166, 3, 'Miami93#0', '2019-04-24 20:22:58'),
(2214, 4, 166, 5, 'Mick#0', '2019-04-24 20:17:16'),
(2215, 4, 166, 5, 'Nhla SN#0', '2019-04-24 20:50:13'),
(2216, 4, 166, 7, 'Paddy#0', '2019-04-24 19:55:14'),
(2217, 4, 166, 5, 'Polite#1', '2019-04-24 20:51:17'),
(2218, 4, 166, 5, 'Tavballzz#0', '2019-04-24 19:03:18'),
(2219, 4, 166, 8, 'ThaRealOne#0', '2019-04-24 19:35:12'),
(2220, 4, 166, 2, 'The Rater#0', '2019-04-24 20:24:15'),
(2221, 4, 166, 7, 'Tomthewise1#0', '2019-04-24 19:38:49'),
(2222, 4, 167, 6, 'Adam#0', '2019-04-24 19:43:51'),
(2223, 4, 167, 3, 'Alice Hoey#0', '2019-04-24 20:17:40'),
(2224, 4, 167, 6, 'bigdickinit#0', '2019-04-24 19:36:24'),
(2225, 4, 167, 6, 'David#0', '2019-04-24 20:26:14'),
(2226, 4, 167, 6, 'Gareth#0', '2019-04-24 19:54:17'),
(2227, 4, 167, 7, 'Jasmine#0', '2019-04-24 19:35:52'),
(2228, 4, 167, 7, 'Jimmy#0', '2019-04-24 19:02:12'),
(2229, 4, 167, 1, 'Joshwalker#0', '2019-04-24 19:12:10'),
(2230, 4, 167, 6, 'Justjason#0', '2019-04-24 19:56:43'),
(2231, 4, 167, 5, 'Kevmc#0', '2019-04-24 19:51:22'),
(2232, 4, 167, 5, 'Laney#0', '2019-04-24 19:33:01'),
(2233, 4, 167, 7, 'liambarnacle#0', '2019-04-24 19:44:06'),
(2234, 4, 167, 7, 'Luke#0', '2019-04-24 20:07:35'),
(2235, 4, 167, 3, 'Miami93#0', '2019-04-24 20:25:32'),
(2236, 4, 167, 5, 'Mick#0', '2019-04-24 19:02:14'),
(2237, 4, 167, 6, 'Nhla SN#0', '2019-04-24 20:50:51'),
(2238, 4, 167, 9, 'Paddy#0', '2019-04-24 19:36:01'),
(2239, 4, 167, 5, 'Polite#1', '2019-04-24 20:54:30'),
(2240, 4, 167, 7, 'Tavballzz#0', '2019-04-24 19:18:25'),
(2241, 4, 167, 4, 'ThaRealOne#0', '2019-04-24 19:34:24'),
(2242, 4, 167, 5, 'Tomthewise1#0', '2019-04-24 19:39:05'),
(2243, 4, 168, 4, 'Adam#0', '2019-04-24 20:07:50'),
(2244, 4, 168, 5, 'Alice Hoey#0', '2019-04-24 20:17:32'),
(2245, 4, 168, 4, 'bigdickinit#0', '2019-04-24 19:56:25'),
(2246, 4, 168, 6, 'Caz#0', '2019-04-24 19:14:40'),
(2247, 4, 168, 5, 'David#0', '2019-04-24 20:26:22'),
(2248, 4, 168, 6, 'Gareth#0', '2019-04-24 19:54:13'),
(2249, 4, 168, 4, 'Greek Freek#0', '2019-04-24 20:31:04'),
(2250, 4, 168, 10, 'h#17', '2019-04-24 20:22:56'),
(2251, 4, 168, 8, 'Jasmine#0', '2019-04-24 19:15:45'),
(2252, 4, 168, 8, 'Jimmy#0', '2019-04-24 19:24:33'),
(2253, 4, 168, 1, 'Joshwalker#0', '2019-04-24 19:12:06'),
(2254, 4, 168, 7, 'Justjason#0', '2019-04-24 19:56:36'),
(2255, 4, 168, 8, 'Kevmc#0', '2019-04-24 19:03:20'),
(2256, 4, 168, 6, 'Krazymuthafuka#0', '2019-04-24 19:49:50'),
(2257, 4, 168, 5, 'Laney#0', '2019-04-24 20:39:44'),
(2258, 4, 168, 4, 'liambarnacle#0', '2019-04-24 19:23:58'),
(2259, 4, 168, 7, 'Luke#0', '2019-04-24 20:07:29'),
(2260, 4, 168, 3, 'Miami93#0', '2019-04-24 19:22:04'),
(2261, 4, 168, 7, 'Mick#0', '2019-04-24 19:16:02'),
(2262, 4, 168, 1, 'Muzi#0', '2019-04-24 19:36:45'),
(2263, 4, 168, 5, 'Nhla SN#0', '2019-04-24 20:50:33'),
(2264, 4, 168, 5, 'Paddy#0', '2019-04-24 19:11:39'),
(2265, 4, 168, 5, 'Polite#1', '2019-04-24 20:54:35'),
(2266, 4, 168, 6, 'Tavballzz#0', '2019-04-24 19:03:05'),
(2267, 4, 168, 8, 'ThaRealOne#0', '2019-04-24 19:34:12'),
(2268, 4, 168, 6, 'Tomthewise1#0', '2019-04-24 19:39:21'),
(2269, 4, 171, 5, '#40', '2019-04-24 20:56:02'),
(2270, 4, 171, 7, 'Adam#0', '2019-04-24 19:43:41'),
(2271, 4, 171, 3, 'Alice Hoey#0', '2019-04-24 20:18:17'),
(2272, 4, 171, 4, 'Archie#0', '2019-04-24 19:27:40'),
(2273, 4, 171, 4, 'bigdickinit#0', '2019-04-24 20:24:16'),
(2274, 4, 171, 3, 'Caz#0', '2019-04-24 19:41:38'),
(2275, 4, 171, 5, 'David#0', '2019-04-24 20:25:57'),
(2276, 4, 171, 7, 'Gareth#0', '2019-04-24 19:54:44'),
(2277, 4, 171, 3, 'GaryMc#0', '2019-04-24 19:49:38'),
(2278, 4, 171, 2, 'Hillb#0', '2019-04-24 20:20:59'),
(2279, 4, 171, 4, 'Jasmine#0', '2019-04-24 20:23:58'),
(2280, 4, 171, 7, 'Jimmy#0', '2019-04-24 19:30:03'),
(2281, 4, 171, 1, 'Joshwalker#0', '2019-04-24 19:12:26'),
(2282, 4, 171, 6, 'Justjason#0', '2019-04-24 19:57:29'),
(2283, 4, 171, 7, 'Kevmc#0', '2019-04-24 19:15:50'),
(2284, 4, 171, 7, 'Krazymuthafuka#0', '2019-04-24 19:49:39'),
(2285, 4, 171, 6, 'Laney#0', '2019-04-24 19:15:48'),
(2286, 4, 171, 5, 'liambarnacle#0', '2019-04-24 19:44:13'),
(2287, 4, 171, 6, 'Luke#0', '2019-04-24 20:07:51'),
(2288, 4, 171, 4, 'Mick#0', '2019-04-24 20:24:03'),
(2289, 4, 171, 5, 'Nhla SN#0', '2019-04-24 20:51:03'),
(2290, 4, 171, 8, 'Paddy#0', '2019-04-24 20:08:05'),
(2291, 4, 171, 5, 'Polite#1', '2019-04-24 20:53:12'),
(2292, 4, 171, 6, 'Tavballzz#0', '2019-04-24 19:01:53'),
(2293, 4, 171, 7, 'ThaRealOne#0', '2019-04-24 19:35:04'),
(2294, 4, 171, 6, 'Tomthewise1#0', '2019-04-24 19:38:56'),
(2295, 4, 172, 4, 'Adam#0', '2019-04-24 20:38:58'),
(2296, 4, 172, 4, 'Alice Hoey#0', '2019-04-24 20:18:34'),
(2297, 4, 172, 5, 'Archie#0', '2019-04-24 19:28:12'),
(2298, 4, 172, 6, 'bigdickinit#0', '2019-04-24 20:09:10'),
(2299, 4, 172, 4, 'David#0', '2019-04-24 20:25:42'),
(2300, 4, 172, 6, 'Gareth#0', '2019-04-24 19:54:59'),
(2301, 4, 172, 5, 'GaryMc#0', '2019-04-24 19:49:49'),
(2302, 4, 172, 8, 'Jasmine#0', '2019-04-24 20:16:57'),
(2303, 4, 172, 8, 'Jimmy#0', '2019-04-24 19:17:05'),
(2304, 4, 172, 1, 'Joshwalker#0', '2019-04-24 19:12:35'),
(2305, 4, 172, 8, 'Justjason#0', '2019-04-24 19:56:55'),
(2306, 4, 172, 6, 'Kevmc#0', '2019-04-24 19:15:40'),
(2307, 4, 172, 7, 'Krazymuthafuka#0', '2019-04-24 19:49:32'),
(2308, 4, 172, 6, 'Laney#0', '2019-04-24 19:08:55'),
(2309, 4, 172, 6, 'Luke#0', '2019-04-24 20:08:38'),
(2310, 4, 172, 6, 'Mantiya#0', '2019-04-24 20:10:16'),
(2311, 4, 172, 2, 'Miami93#0', '2019-04-24 20:33:43'),
(2312, 4, 172, 7, 'Mick#0', '2019-04-24 19:17:08'),
(2313, 4, 172, 8, 'Paddy#0', '2019-04-24 19:23:26'),
(2314, 4, 172, 6, 'Tavballzz#0', '2019-04-24 19:19:53'),
(2315, 4, 172, 4, 'Tavballzz#1', '2019-04-24 20:16:03'),
(2316, 4, 172, 9, 'ThaRealOne#0', '2019-04-24 19:35:29'),
(2317, 4, 172, 7, 'Tomthewise1#0', '2019-04-24 19:38:53'),
(2318, 4, 173, 8, '#40', '2019-04-24 19:24:06'),
(2319, 4, 173, 8, 'Adam#0', '2019-04-24 20:38:52'),
(2320, 4, 173, 4, 'Alice Hoey#0', '2019-04-24 20:18:28'),
(2321, 4, 173, 5, 'bigdickinit#0', '2019-04-24 19:56:10'),
(2322, 4, 173, 4, 'David#0', '2019-04-24 20:25:47'),
(2323, 4, 173, 7, 'Gareth#0', '2019-04-24 19:54:52'),
(2324, 4, 173, 4, 'GaryMc#0', '2019-04-24 19:49:54'),
(2325, 4, 173, 3, 'Hillb#0', '2019-04-24 19:28:30'),
(2326, 4, 173, 5, 'Jasmine#0', '2019-04-24 19:48:31'),
(2327, 4, 173, 10, 'Jim#1', '2019-04-24 19:07:18'),
(2328, 4, 173, 7, 'Jimmy#0', '2019-04-24 19:05:48'),
(2329, 4, 173, 8, 'Josh#1', '2019-04-24 20:14:01'),
(2330, 4, 173, 1, 'Joshwalker#0', '2019-04-24 19:10:17'),
(2331, 4, 173, 5, 'Justjason#0', '2019-04-24 19:57:02'),
(2332, 4, 173, 8, 'Kevmc#0', '2019-04-24 19:22:32'),
(2333, 4, 173, 6, 'Krazymuthafuka#0', '2019-04-24 19:49:56'),
(2334, 4, 173, 7, 'Laney#0', '2019-04-24 19:03:06'),
(2335, 4, 173, 10, 'levins98#0', '2019-04-24 20:21:52'),
(2336, 4, 173, 8, 'liambarnacle#0', '2019-04-24 19:23:36'),
(2337, 4, 173, 7, 'Luke#0', '2019-04-24 20:08:43'),
(2338, 4, 173, 7, 'Mantiya#0', '2019-04-24 20:10:09'),
(2339, 4, 173, 6, 'Miami93#0', '2019-04-24 19:27:38'),
(2340, 4, 173, 4, 'Mick#0', '2019-04-24 20:45:31'),
(2341, 4, 173, 6, 'Muzi#0', '2019-04-24 19:36:29'),
(2342, 4, 173, 6, 'Nhla SN#0', '2019-04-24 20:50:19'),
(2343, 4, 173, 8, 'Paddy#0', '2019-04-24 20:08:34'),
(2344, 4, 173, 7, 'Polite#1', '2019-04-24 20:09:34'),
(2345, 4, 173, 8, 'Tavballzz#0', '2019-04-24 19:27:20'),
(2346, 4, 173, 8, 'ThaRealOne#0', '2019-04-24 19:35:21'),
(2347, 4, 173, 8, 'Tomthewise1#0', '2019-04-24 19:37:54'),
(2348, 4, 174, 4, '#40', '2019-04-24 20:55:58'),
(2349, 4, 174, 5, 'Adam#0', '2019-04-24 20:50:59'),
(2350, 4, 174, 4, 'David#0', '2019-04-24 20:50:29'),
(2351, 4, 174, 6, 'Jimmy#0', '2019-04-24 20:45:26'),
(2352, 4, 174, 5, 'Krazymuthafuka#0', '2019-04-24 20:48:40'),
(2353, 4, 174, 5, 'Laney#0', '2019-04-24 20:43:36'),
(2354, 4, 174, 6, 'Mick#0', '2019-04-24 20:45:35'),
(2355, 4, 174, 5, 'Nhla SN#0', '2019-04-24 20:50:26'),
(2356, 4, 174, 5, 'Paddy#0', '2019-04-24 20:50:07'),
(2357, 4, 174, 6, 'Polite#1', '2019-04-24 20:54:17'),
(2358, 4, 181, 4, 'Adam#0', '2019-04-24 19:44:03'),
(2359, 4, 181, 4, 'Alice Hoey#0', '2019-04-24 20:17:24'),
(2360, 4, 181, 5, 'bigdickinit#0', '2019-04-24 19:56:29'),
(2361, 4, 181, 4, 'David#0', '2019-04-24 20:26:29'),
(2362, 4, 181, 4, 'Gareth#0', '2019-04-24 20:32:03'),
(2363, 4, 181, 1, 'Hillb#0', '2019-04-24 20:42:44'),
(2364, 4, 181, 7, 'Jasmine#0', '2019-04-24 19:54:50'),
(2365, 4, 181, 1, 'Joshwalker#0', '2019-04-24 19:12:02'),
(2366, 4, 181, 5, 'Justjason#0', '2019-04-24 19:56:28'),
(2367, 4, 181, 5, 'Krazymuthafuka#0', '2019-04-24 19:51:07'),
(2368, 4, 181, 6, 'Laney#0', '2019-04-24 19:06:11'),
(2369, 4, 181, 6, 'Luke#0', '2019-04-24 20:07:23'),
(2370, 4, 181, 6, 'Mantiya#0', '2019-04-24 20:10:31'),
(2371, 4, 181, 5, 'Mick#0', '2019-04-24 19:24:38'),
(2372, 4, 181, 6, 'Tavballzz#0', '2019-04-24 19:03:10'),
(2373, 4, 181, 5, 'ThaRealOne#0', '2019-04-24 19:33:58'),
(2374, 4, 181, 5, 'Tomthewise1#0', '2019-04-24 19:39:25'),
(2375, 4, 183, 5, '#40', '2019-04-24 20:56:03'),
(2376, 4, 183, 5, 'Adam#0', '2019-04-24 19:37:28'),
(2377, 4, 183, 4, 'Alice Hoey#0', '2019-04-24 20:18:00'),
(2378, 4, 183, 6, 'Archie#0', '2019-04-24 19:28:00'),
(2379, 4, 183, 9, 'bigdickinit#0', '2019-04-24 19:36:48'),
(2380, 4, 183, 6, 'David#0', '2019-04-24 20:26:08'),
(2381, 4, 183, 7, 'Gareth#0', '2019-04-24 19:54:32'),
(2382, 4, 183, 3, 'GaryMc#0', '2019-04-24 19:49:25'),
(2383, 4, 183, 10, 'Jim#1', '2019-04-24 19:08:45'),
(2384, 4, 183, 6, 'Jimmy#0', '2019-04-24 19:54:59'),
(2385, 4, 183, 1, 'Joshwalker#0', '2019-04-24 19:12:19'),
(2386, 4, 183, 6, 'Justjason#0', '2019-04-24 19:57:14'),
(2387, 4, 183, 6, 'Kevmc#0', '2019-04-24 19:15:13'),
(2388, 4, 183, 5, 'Krazymuthafuka#0', '2019-04-24 19:50:58'),
(2389, 4, 183, 4, 'Laney#0', '2019-04-24 19:40:35'),
(2390, 4, 183, 7, 'Luke#0', '2019-04-24 20:08:09'),
(2391, 4, 183, 1, 'Miami93#0', '2019-04-24 20:24:57'),
(2392, 4, 183, 7, 'Mick#0', '2019-04-24 20:07:56'),
(2393, 4, 183, 6, 'Nhla SN#0', '2019-04-24 20:50:06'),
(2394, 4, 183, 5, 'Paddy#0', '2019-04-24 19:10:12'),
(2395, 4, 183, 6, 'Polite#1', '2019-04-24 20:54:23'),
(2396, 4, 183, 6, 'Tavballzz#0', '2019-04-24 19:02:23'),
(2397, 4, 183, 5, 'ThaRealOne#0', '2019-04-24 19:34:44'),
(2398, 4, 183, 5, 'Tomthewise1#0', '2019-04-24 19:39:00'),
(2399, 4, 186, 4, 'Adam#0', '2019-04-24 19:38:31'),
(2400, 4, 186, 3, 'Alice Hoey#0', '2019-04-24 20:18:08'),
(2401, 4, 186, 7, 'bigdickinit#0', '2019-04-24 20:30:34'),
(2402, 4, 186, 5, 'David#0', '2019-04-24 20:26:01'),
(2403, 4, 186, 5, 'Gareth#0', '2019-04-24 19:54:36'),
(2404, 4, 186, 4, 'GaryMc#0', '2019-04-24 19:49:32'),
(2405, 4, 186, 3, 'h#17', '2019-04-24 20:23:01'),
(2406, 4, 186, 8, 'Jasmine#0', '2019-04-24 19:30:38'),
(2407, 4, 186, 6, 'Jimmy#0', '2019-04-24 19:54:55'),
(2408, 4, 186, 1, 'Joshwalker#0', '2019-04-24 19:12:47'),
(2409, 4, 186, 4, 'Justjason#0', '2019-04-24 19:57:20'),
(2410, 4, 186, 5, 'Kevmc#0', '2019-04-24 19:23:51'),
(2411, 4, 186, 4, 'Krazymuthafuka#0', '2019-04-24 19:50:45'),
(2412, 4, 186, 4, 'Laney#0', '2019-04-24 19:29:38'),
(2413, 4, 186, 2, 'liambarnacle#0', '2019-04-24 19:25:50'),
(2414, 4, 186, 6, 'Luke#0', '2019-04-24 20:08:55'),
(2415, 4, 186, 2, 'Miami93#0', '2019-04-24 19:28:20'),
(2416, 4, 186, 8, 'Mick#0', '2019-04-24 19:35:28'),
(2417, 4, 186, 5, 'Nhla SN#0', '2019-04-24 20:08:16'),
(2418, 4, 186, 3, 'Paddy#0', '2019-04-24 20:28:57'),
(2419, 4, 186, 7, 'Tavballzz#0', '2019-04-24 19:12:04'),
(2420, 4, 186, 6, 'Tavballzz#1', '2019-04-24 20:30:27'),
(2421, 4, 186, 5, 'ThaRealOne#0', '2019-04-24 19:34:55'),
(2422, 4, 187, 5, 'Adam#0', '2019-04-24 20:52:52'),
(2423, 4, 187, 8, 'bigdickinit#0', '2019-04-24 20:52:53'),
(2424, 4, 187, 3, 'David#0', '2019-04-24 20:50:22'),
(2425, 4, 187, 7, 'Jasmine#0', '2019-04-24 20:53:00'),
(2426, 4, 187, 4, 'Laney#0', '2019-04-24 20:47:13'),
(2427, 4, 187, 3, 'Nhla SN#0', '2019-04-24 20:50:41'),
(2428, 4, 187, 4, 'Paddy#0', '2019-04-24 20:50:11'),
(2429, 4, 187, 5, 'Polite#1', '2019-04-24 20:54:47'),
(2430, 4, 188, 4, '#40', '2019-04-24 20:43:40'),
(2431, 4, 188, 5, 'Adam#0', '2019-04-24 20:54:22'),
(2432, 4, 188, 4, 'bigdickinit#0', '2019-04-24 20:37:47'),
(2433, 4, 188, 5, 'David#0', '2019-04-24 20:50:35'),
(2434, 4, 188, 8, 'Jasmine#0', '2019-04-24 20:34:33'),
(2435, 4, 188, 4, 'Jimmy#0', '2019-04-24 20:34:45'),
(2436, 4, 188, 5, 'Krazymuthafuka#0', '2019-04-24 20:48:36'),
(2437, 4, 188, 6, 'Laney#0', '2019-04-24 20:38:53'),
(2438, 4, 188, 6, 'Mick#0', '2019-04-24 20:34:41'),
(2439, 4, 188, 5, 'Nhla SN#0', '2019-04-24 20:50:00'),
(2440, 4, 188, 7, 'Paddy#0', '2019-04-24 20:34:37'),
(2441, 4, 188, 6, 'Polite#1', '2019-04-24 20:35:16'),
(2442, 4, 188, 5, 'Tavballzz#1', '2019-04-24 20:31:40'),
(2443, 4, 193, 4, '#40', '2019-04-24 20:42:40'),
(2444, 4, 193, 3, 'Adam#0', '2019-04-24 20:51:16'),
(2445, 4, 193, 3, 'Alice Hoey#0', '2019-04-24 20:17:51'),
(2446, 4, 193, 6, 'bigdickinit#0', '2019-04-24 19:56:19'),
(2447, 4, 193, 6, 'David#0', '2019-04-24 20:24:46'),
(2448, 4, 193, 6, 'Gareth#0', '2019-04-24 19:54:26'),
(2449, 4, 193, 3, 'Jasmine#0', '2019-04-24 20:41:15'),
(2450, 4, 193, 3, 'Jimmy#0', '2019-04-24 20:41:26'),
(2451, 4, 193, 1, 'Joshwalker#0', '2019-04-24 19:12:14'),
(2452, 4, 193, 6, 'Justjason#0', '2019-04-24 19:56:48'),
(2453, 4, 193, 6, 'Kevmc#0', '2019-04-24 19:51:16'),
(2454, 4, 193, 6, 'Krazymuthafuka#0', '2019-04-24 19:51:10'),
(2455, 4, 193, 5, 'Laney#0', '2019-04-24 19:33:19'),
(2456, 4, 193, 7, 'Luke#0', '2019-04-24 20:07:42'),
(2457, 4, 193, 1, 'Miami93#0', '2019-04-24 20:13:07'),
(2458, 4, 193, 3, 'Mick#0', '2019-04-24 20:41:20'),
(2459, 4, 193, 5, 'Nhla SN#0', '2019-04-24 20:50:56'),
(2460, 4, 193, 7, 'Paddy#0', '2019-04-24 19:08:33'),
(2461, 4, 193, 4, 'Polite#1', '2019-04-24 20:51:09'),
(2462, 4, 193, 6, 'Tavballzz#0', '2019-04-24 19:27:06'),
(2463, 4, 193, 4, 'ThaRealOne#0', '2019-04-24 19:34:31'),
(2464, 4, 193, 4, 'The Rater#0', '2019-04-24 20:14:46'),
(2465, 4, 193, 6, 'Tomthewise1#0', '2019-04-24 19:39:09');

-- --------------------------------------------------------

--
-- Table structure for table `substitutions`
--

CREATE TABLE `substitutions` (
  `id` int(11) NOT NULL,
  `match_id` int(11) NOT NULL,
  `sub_player_id` int(11) NOT NULL,
  `starting_player_id` int(11) NOT NULL,
  `team_id` int(11) NOT NULL,
  `date_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `substitutions`
--

INSERT INTO `substitutions` (`id`, `match_id`, `sub_player_id`, `starting_player_id`, `team_id`, `date_time`) VALUES
(12, 4, 147, 162, 7, '2019-04-24 20:09:46'),
(13, 4, 186, 188, 8, '2019-04-24 20:30:56'),
(16, 4, 172, 174, 8, '2019-04-24 20:43:02'),
(17, 4, 181, 187, 8, '2019-04-24 20:43:27'),
(18, 4, 150, 164, 7, '2019-04-24 20:48:16'),
(19, 4, 146, 158, 7, '2019-04-24 20:49:09');

-- --------------------------------------------------------

--
-- Table structure for table `teams`
--

CREATE TABLE `teams` (
  `id` int(11) NOT NULL,
  `team_name` varchar(500) NOT NULL,
  `crest` varchar(750) NOT NULL,
  `manager` varchar(400) DEFAULT NULL,
  `home_colours` varchar(30) DEFAULT 'N/A',
  `away_colours` varchar(30) DEFAULT 'N/A',
  `alt_colours` varchar(30) DEFAULT 'N/A'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `teams`
--

INSERT INTO `teams` (`id`, `team_name`, `crest`, `manager`, `home_colours`, `away_colours`, `alt_colours`) VALUES
(3, 'Bayern', 'http://mysql02.comp.dkit.ie/D00196117/team_images/bayern.png', 'N.Kovac', 'N/A', 'N/A', 'N/A'),
(4, 'Liverpool', 'http://mysql02.comp.dkit.ie/D00196117/team_images/liverpool.png', 'J.Klopp', 'N/A', 'N/A', 'N/A'),
(5, 'Porto', 'http://mysql02.comp.dkit.ie/D00196117/team_images/Porto.png', 'S.Conceicao', 'N/A', 'N/A', 'N/A'),
(6, 'Spurs', 'http://mysql02.comp.dkit.ie/D00196117/team_images/spurs.png', 'M. Pochettino', 'N/A', 'N/A', 'N/A'),
(7, 'Man City', 'http://mysql02.comp.dkit.ie/D00196117/team_images/manCity.png', 'P. Guardiola', 'N/A', 'N/A', 'N/A'),
(8, 'Man Utd', 'http://mysql02.comp.dkit.ie/D00196117/team_images/manUnited.png', 'O.G. Solskjær', 'N/A', 'N/A', 'N/A'),
(9, 'Barcelona', 'http://mysql02.comp.dkit.ie/D00196117/team_images/barcelona.png', 'Ernesto Valverde', 'N/A', 'N/A', 'N/A');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `username` varchar(255) NOT NULL,
  `uuid_timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`username`, `uuid_timestamp`) VALUES
('#14', '2019-04-24 18:39:33'),
('#2', '2019-04-24 18:29:58'),
('#31', '2019-04-24 18:57:25'),
('#40', '2019-04-24 19:14:40'),
('#56', '2019-04-24 19:56:00'),
('#6', '2019-04-24 18:30:58'),
('#8', '2019-04-24 18:32:10'),
('@bta444#0', '2019-04-24 18:46:33'),
('Adam#0', '2019-04-24 19:12:44'),
('Alice Hoey#0', '2019-04-24 20:16:34'),
('alxmrtnz#0', '2019-04-24 18:37:25'),
('Archie#0', '2019-04-24 19:26:18'),
('asy1mpo#0', '2019-04-24 18:41:55'),
('bigdickinit#0', '2019-04-24 19:36:20'),
('Caz#0', '2019-04-24 18:34:15'),
('David#0', '2019-04-24 20:18:44'),
('Djbenzo#0', '2019-04-24 18:30:07'),
('DonalIsHere#0', '2019-04-24 20:24:41'),
('Dube #0', '2019-04-24 19:56:53'),
('Edikshulga#0', '2019-04-24 18:47:10'),
('Elliot Alexander #0', '2019-04-24 18:50:44'),
('Erkan#0', '2019-04-24 18:51:06'),
('Gareth#0', '2019-04-24 18:30:17'),
('GaryMc#0', '2019-04-24 19:48:55'),
('Greek Freek#0', '2019-04-24 19:59:45'),
('h#17', '2019-04-24 20:22:34'),
('Hillb#0', '2019-04-24 19:10:57'),
('jacob#0', '2019-04-24 18:48:10'),
('Jasmine#0', '2019-04-24 18:42:53'),
('JasonMurphy#0', '2019-04-24 19:14:26'),
('JayD#0', '2019-04-24 19:44:43'),
('Jaysmith101#0', '2019-04-24 18:33:45'),
('Jhill13#0', '2019-04-24 19:11:21'),
('Jim#1', '2019-04-24 19:06:17'),
('Jimmy#0', '2019-04-24 18:42:11'),
('jo#0', '2019-04-24 18:35:30'),
('joo#0', '2019-04-24 18:43:28'),
('Josh#1', '2019-04-24 20:13:29'),
('Joshwalker#0', '2019-04-24 18:58:11'),
('Justjason#0', '2019-04-24 19:56:06'),
('Kevmc#0', '2019-04-24 18:41:16'),
('Krazymuthafuka#0', '2019-04-24 18:36:44'),
('Laney#0', '2019-04-24 19:01:27'),
('levins98#0', '2019-04-24 20:21:03'),
('liambarnacle#0', '2019-04-24 18:44:09'),
('Luke#0', '2019-04-24 20:07:08'),
('Magz#0', '2019-04-24 19:55:30'),
('Mantiya#0', '2019-04-24 20:09:56'),
('Mat#0', '2019-04-24 18:29:52'),
('Matt#0', '2019-04-24 18:30:03'),
('Miami93#0', '2019-04-24 19:12:07'),
('Mick#0', '2019-04-24 18:42:07'),
('Mojo#0', '2019-04-24 19:46:04'),
('Muzi#0', '2019-04-24 19:35:53'),
('Nhla SN#0', '2019-04-24 19:53:45'),
('nimbus#0', '2019-04-24 19:19:08'),
('Paddy#0', '2019-04-24 18:41:04'),
('Polite#0', '2019-04-24 19:26:06'),
('Polite#1', '2019-04-24 19:26:28'),
('Redmmac#0', '2019-04-24 18:42:21'),
('RonTheDon#0', '2019-04-24 20:08:27'),
('Sam1878#0', '2019-04-24 20:12:20'),
('Sexy123#0', '2019-04-24 18:33:39'),
('SigDog#0', '2019-04-24 20:38:38'),
('Suckmyleftone#0', '2019-04-24 18:55:22'),
('Tavballzz#0', '2019-04-24 18:56:31'),
('Tavballzz#1', '2019-04-24 19:45:03'),
('ThaRealOne#0', '2019-04-24 19:33:04'),
('The Rater#0', '2019-04-24 19:26:52'),
('Tj01#0', '2019-04-24 20:39:34'),
('Tomthewise1#0', '2019-04-24 19:37:25'),
('Uuh#0', '2019-04-24 18:31:48');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `events`
--
ALTER TABLE `events`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `matches`
--
ALTER TABLE `matches`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `matches_events`
--
ALTER TABLE `matches_events`
  ADD PRIMARY KEY (`id`,`match_id`),
  ADD KEY `match_id` (`match_id`),
  ADD KEY `event_id` (`event_id`),
  ADD KEY `player_id` (`player_id`),
  ADD KEY `team_id` (`team_id`);

--
-- Indexes for table `matches_players`
--
ALTER TABLE `matches_players`
  ADD PRIMARY KEY (`match_id`,`player_id`),
  ADD KEY `player_id` (`player_id`),
  ADD KEY `team_id` (`team_id`);

--
-- Indexes for table `matches_teams`
--
ALTER TABLE `matches_teams`
  ADD PRIMARY KEY (`match_id`,`team_id`),
  ADD KEY `team_id` (`team_id`);

--
-- Indexes for table `players`
--
ALTER TABLE `players`
  ADD PRIMARY KEY (`id`),
  ADD KEY `team_id` (`team_id`);

--
-- Indexes for table `ratings`
--
ALTER TABLE `ratings`
  ADD PRIMARY KEY (`match_id`,`player_id`,`username`),
  ADD KEY `user_id` (`username`),
  ADD KEY `player_id` (`player_id`);

--
-- Indexes for table `ratings_history`
--
ALTER TABLE `ratings_history`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`username`),
  ADD KEY `match_id` (`match_id`),
  ADD KEY `player_id` (`player_id`);

--
-- Indexes for table `substitutions`
--
ALTER TABLE `substitutions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `match_id` (`match_id`),
  ADD KEY `sub_player_id` (`sub_player_id`),
  ADD KEY `starting_player_id` (`starting_player_id`),
  ADD KEY `team_id` (`team_id`);

--
-- Indexes for table `teams`
--
ALTER TABLE `teams`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`username`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `events`
--
ALTER TABLE `events`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
--
-- AUTO_INCREMENT for table `matches`
--
ALTER TABLE `matches`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT for table `matches_events`
--
ALTER TABLE `matches_events`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=76;
--
-- AUTO_INCREMENT for table `players`
--
ALTER TABLE `players`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=194;
--
-- AUTO_INCREMENT for table `ratings_history`
--
ALTER TABLE `ratings_history`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2466;
--
-- AUTO_INCREMENT for table `substitutions`
--
ALTER TABLE `substitutions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;
--
-- AUTO_INCREMENT for table `teams`
--
ALTER TABLE `teams`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `matches_events`
--
ALTER TABLE `matches_events`
  ADD CONSTRAINT `matches_events_ibfk_1` FOREIGN KEY (`match_id`) REFERENCES `matches` (`id`),
  ADD CONSTRAINT `matches_events_ibfk_2` FOREIGN KEY (`event_id`) REFERENCES `events` (`id`),
  ADD CONSTRAINT `matches_events_ibfk_3` FOREIGN KEY (`player_id`) REFERENCES `players` (`id`),
  ADD CONSTRAINT `matches_events_ibfk_4` FOREIGN KEY (`team_id`) REFERENCES `teams` (`id`);

--
-- Constraints for table `matches_players`
--
ALTER TABLE `matches_players`
  ADD CONSTRAINT `matches_players_ibfk_1` FOREIGN KEY (`match_id`) REFERENCES `matches` (`id`),
  ADD CONSTRAINT `matches_players_ibfk_2` FOREIGN KEY (`player_id`) REFERENCES `players` (`id`),
  ADD CONSTRAINT `matches_players_ibfk_3` FOREIGN KEY (`team_id`) REFERENCES `teams` (`id`);

--
-- Constraints for table `matches_teams`
--
ALTER TABLE `matches_teams`
  ADD CONSTRAINT `matches_teams_ibfk_1` FOREIGN KEY (`match_id`) REFERENCES `matches` (`id`),
  ADD CONSTRAINT `matches_teams_ibfk_2` FOREIGN KEY (`team_id`) REFERENCES `teams` (`id`);

--
-- Constraints for table `players`
--
ALTER TABLE `players`
  ADD CONSTRAINT `players_ibfk_1` FOREIGN KEY (`team_id`) REFERENCES `teams` (`id`);

--
-- Constraints for table `ratings`
--
ALTER TABLE `ratings`
  ADD CONSTRAINT `ratings_ibfk_2` FOREIGN KEY (`match_id`) REFERENCES `matches` (`id`),
  ADD CONSTRAINT `ratings_ibfk_3` FOREIGN KEY (`player_id`) REFERENCES `players` (`id`),
  ADD CONSTRAINT `ratings_ibfk_4` FOREIGN KEY (`username`) REFERENCES `users` (`username`) ON UPDATE CASCADE;

--
-- Constraints for table `ratings_history`
--
ALTER TABLE `ratings_history`
  ADD CONSTRAINT `ratings_history_ibfk_2` FOREIGN KEY (`match_id`) REFERENCES `matches` (`id`),
  ADD CONSTRAINT `ratings_history_ibfk_3` FOREIGN KEY (`player_id`) REFERENCES `players` (`id`),
  ADD CONSTRAINT `ratings_history_ibfk_4` FOREIGN KEY (`username`) REFERENCES `users` (`username`) ON UPDATE CASCADE;

--
-- Constraints for table `substitutions`
--
ALTER TABLE `substitutions`
  ADD CONSTRAINT `substitutions_ibfk_1` FOREIGN KEY (`match_id`) REFERENCES `matches` (`id`),
  ADD CONSTRAINT `substitutions_ibfk_2` FOREIGN KEY (`sub_player_id`) REFERENCES `players` (`id`),
  ADD CONSTRAINT `substitutions_ibfk_3` FOREIGN KEY (`starting_player_id`) REFERENCES `players` (`id`),
  ADD CONSTRAINT `substitutions_ibfk_4` FOREIGN KEY (`team_id`) REFERENCES `teams` (`id`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
