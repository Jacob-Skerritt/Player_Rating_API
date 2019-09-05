-- phpMyAdmin SQL Dump
-- version 4.7.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Mar 24, 2019 at 11:00 PM
-- Server version: 10.1.26-MariaDB
-- PHP Version: 7.1.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `player_ratings`
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
(4, 'Yellow card');

-- --------------------------------------------------------

--
-- Table structure for table `matches`
--

CREATE TABLE `matches` (
  `id` int(11) NOT NULL,
  `match_date_time` datetime NOT NULL,
  `match_location` varchar(1000) DEFAULT NULL,
  `match_elapsed_time` double DEFAULT '0',
  `competition` varchar(500) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `matches`
--

INSERT INTO `matches` (`id`, `match_date_time`, `match_location`, `match_elapsed_time`, `competition`) VALUES
(1, '2019-03-13 20:00:00', 'Allianz Arena', 0, 'Champions League');

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
  `date_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `matches_events`
--

INSERT INTO `matches_events` (`id`, `match_id`, `event_id`, `player_id`, `team_id`, `date_time`) VALUES
(1, 1, 3, 51, 3, '2019-03-20 09:20:53');

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
(1, 47, 3, -1),
(1, 48, 3, 1),
(1, 49, 3, 2),
(1, 50, 3, 3),
(1, 51, 3, 4),
(1, 52, 3, 5),
(1, 53, 3, 6),
(1, 54, 3, 7),
(1, 55, 3, 8),
(1, 56, 3, 9),
(1, 57, 3, 10),
(1, 58, 3, -1),
(1, 59, 3, 0),
(1, 60, 3, -1),
(1, 61, 3, -1),
(1, 62, 3, -1),
(1, 63, 3, -1),
(1, 64, 3, -1),
(1, 65, 3, -1),
(1, 66, 3, -1),
(1, 67, 3, -1),
(1, 68, 3, -1),
(1, 69, 4, 0),
(1, 70, 4, 1),
(1, 71, 4, 2),
(1, 72, 4, 3),
(1, 73, 4, 4),
(1, 74, 4, 5),
(1, 75, 4, 6),
(1, 76, 4, 7),
(1, 77, 4, 8),
(1, 78, 4, 9),
(1, 79, 4, 10),
(1, 80, 4, -1),
(1, 81, 4, -1),
(1, 82, 4, -1),
(1, 83, 4, -1),
(1, 84, 4, -1),
(1, 85, 4, -1),
(1, 86, 4, -1),
(1, 87, 4, -1),
(1, 88, 4, -1),
(1, 89, 4, -1),
(1, 90, 4, -1);

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
(1, 4, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `players`
--

CREATE TABLE `players` (
  `id` int(11) NOT NULL,
  `player_name` varchar(500) NOT NULL,
  `player_no` int(2) NOT NULL,
  `player_image` varchar(150) DEFAULT 'N/A',
  `team_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `players`
--

INSERT INTO `players` (`id`, `player_name`, `player_no`, `player_image`, `team_id`) VALUES
(47, 'Neuer', 1, 'Neuer.jpg', 3),
(48, 'Rafinha', 13, 'Rafinha.jpg', 3),
(49, 'Sule', 4, 'Sule.jpg', 3),
(50, 'Hummels', 5, 'Hummels.jpg', 3),
(51, 'Alaba', 27, 'Alaba.jpg', 3),
(52, 'Thiago', 6, 'Thiago.jpg', 3),
(53, 'Rodriguez', 11, 'Rodriguez.jpg', 3),
(54, 'Martinez', 8, 'Martinez.jpg', 3),
(55, 'Gnabry', 22, 'Gnabry.jpg', 3),
(56, 'Lewandowski', 9, 'Lewandowski.jpg', 3),
(57, 'Coman', 29, 'Coman.jpg', 3),
(58, 'Ulreich', 26, 'Ulreich.jpg', 3),
(59, 'Mai', 33, 'Mai.jpg', 3),
(60, 'Boateng', 17, 'Boateng.jpg', 3),
(61, 'Shabani', 37, 'Shabani.jpg', 3),
(62, 'Sanches', 35, 'Sanches.jpg', 3),
(63, 'Tolisso', 24, 'Tolisso.jpg', 3),
(64, 'Goretzka', 18, 'Goretzka.jpg', 3),
(65, 'Muller', 25, 'Muller.jpg', 3),
(66, 'Davies', 19, 'Davies.jpg', 3),
(67, 'Robben', 10, 'Robben.jpg', 3),
(68, 'Ribery', 7, 'Ribery.jpg', 3),
(69, 'Alisson', 13, 'Alisson.jpg', 4),
(70, 'Alexander-Arnold', 66, 'Alexander-Arnold.jpg', 4),
(71, 'Matip', 32, 'Matip.jpg', 4),
(72, 'Van Dikj', 5, 'Van Dikj.jpg', 4),
(73, 'Robertson is gay', 26, 'Robertson.jpg', 4),
(74, 'Wijnaldum', 5, 'Wijnaldum.jpg', 4),
(75, 'Henderson', 14, 'Henderson.jpg', 4),
(76, 'Keita', 8, 'Keita.jpg', 4),
(77, 'Salah', 11, 'Salah.jpg', 4),
(78, 'Firmino', 9, 'Firmino.jpg', 4),
(79, 'Mane', 10, 'Mane.jpg', 4),
(80, 'Mignolet', 22, 'Mignolet.jpg', 4),
(81, 'Lovren', 6, 'Lovren.jpg', 4),
(82, 'Gomez', 12, 'Gomez.jpg', 4),
(83, 'Moreno', 18, 'Moreno.jpg', 4),
(84, 'Milner', 7, 'Milner.jpg', 4),
(85, 'Lallana', 20, 'Lallana.jpg', 4),
(86, 'Fabinho', 3, 'Fabinho.jpg', 4),
(87, 'Oxlade-Chamberlain', 21, 'Oxlade-Chamberlain.jpg', 4),
(88, 'Shaqiri', 23, 'Shaqiri.jpg', 4),
(89, 'Sturridge', 15, 'Sturridge.jpg', 4),
(90, 'Origi', 27, 'Origi.jpg', 4);

-- --------------------------------------------------------

--
-- Table structure for table `ratings`
--

CREATE TABLE `ratings` (
  `match_id` int(11) NOT NULL,
  `player_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `rating` int(2) NOT NULL,
  `date_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `ratings`
--

INSERT INTO `ratings` (`match_id`, `player_id`, `user_id`, `rating`, `date_time`) VALUES
(1, 47, 3, 6, '2019-03-21 17:58:57'),
(1, 51, 2, 8, '2019-03-17 18:19:39'),
(1, 51, 3, 3, '2019-03-17 18:20:08'),
(1, 51, 4, 2, '2019-03-17 18:19:39'),
(1, 51, 5, 6, '2019-03-17 18:20:08'),
(1, 53, 2, 50, '2019-03-24 18:36:43'),
(1, 53, 5, 100, '2019-03-24 18:36:24'),
(1, 55, 3, 3, '2019-03-17 19:05:37'),
(1, 58, 5, 1, '2019-03-21 18:18:34'),
(1, 62, 3, 6, '2019-03-21 17:58:48'),
(1, 63, 2, 3, '2019-03-20 20:57:05'),
(1, 63, 3, 1, '2019-03-20 20:56:54'),
(1, 66, 6, 6, '2019-03-17 19:05:37'),
(1, 69, 2, 8, '2019-03-22 14:46:57'),
(1, 69, 5, 10, '2019-03-23 20:56:41'),
(1, 69, 6, 5, '2019-03-22 14:03:56'),
(1, 70, 2, 2, '2019-03-17 19:05:03'),
(1, 70, 5, 10, '2019-03-23 20:56:38'),
(1, 70, 6, 8, '2019-03-17 19:05:21'),
(1, 71, 2, 8, '2019-03-22 14:47:49'),
(1, 72, 3, 6, '2019-03-22 14:40:09'),
(1, 72, 5, 100, '2019-03-24 21:52:57'),
(1, 72, 6, 7, '2019-03-22 14:41:20'),
(1, 73, 3, 12, '2019-03-22 14:48:23'),
(1, 73, 6, 5, '2019-03-22 13:58:34'),
(1, 75, 5, 10, '2019-03-23 21:02:37'),
(1, 76, 2, 1, '2019-03-20 20:11:34'),
(1, 76, 3, 78, '2019-03-23 18:43:08'),
(1, 76, 5, 7, '2019-03-21 18:00:26'),
(1, 76, 6, 7, '2019-03-21 18:02:01'),
(1, 78, 5, 6, '2019-03-23 21:11:16'),
(1, 87, 2, 6, '2019-03-19 19:31:24');

--
-- Triggers `ratings`
--
DELIMITER $$
CREATE TRIGGER `ratings_history_management` BEFORE DELETE ON `ratings` FOR EACH ROW BEGIN
INSERT INTO ratings_history VALUES (null, old.match_id, old.player_id, old.rating, old.user_id, old.date_time);
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
  `user_id` int(11) NOT NULL,
  `date_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `ratings_history`
--

INSERT INTO `ratings_history` (`id`, `match_id`, `player_id`, `rating`, `user_id`, `date_time`) VALUES
(1, 1, 69, 3, 5, '2019-03-17 19:05:21'),
(2, 1, 76, 3, 2, '2019-03-19 17:59:21'),
(3, 1, 76, 3, 2, '2019-03-19 17:59:24'),
(4, 1, 76, 3, 2, '2019-03-19 17:59:26'),
(5, 1, 76, 3, 2, '2019-03-19 18:07:19'),
(6, 1, 87, 6, 2, '2019-03-19 19:30:09'),
(7, 1, 76, 9, 2, '2019-03-19 18:07:46'),
(8, 1, 62, 6, 3, '2019-03-21 17:58:32'),
(9, 1, 62, 6, 3, '2019-03-21 17:58:48'),
(10, 1, 62, 6, 3, '2019-03-21 17:58:48'),
(11, 1, 76, 89, 6, '2019-03-20 19:33:35'),
(12, 1, 76, 8, 5, '2019-03-20 19:33:24'),
(13, 1, 76, 6, 6, '2019-03-21 17:59:35'),
(14, 1, 69, 8, 5, '2019-03-18 15:18:01'),
(15, 1, 69, 100, 5, '2019-03-21 18:03:28'),
(16, 1, 69, 200, 5, '2019-03-21 18:12:35'),
(17, 1, 69, 6, 5, '2019-03-21 18:30:13'),
(18, 1, 69, 100, 5, '2019-03-21 18:30:24'),
(19, 1, 72, 6, 6, '2019-03-22 09:29:18'),
(20, 1, 69, 34, 2, '2019-03-19 18:34:43'),
(21, 1, 69, 7, 6, '2019-03-22 10:14:56'),
(22, 1, 69, 6, 2, '2019-03-22 09:51:42'),
(23, 1, 72, 7, 6, '2019-03-22 09:29:23'),
(24, 1, 69, 6, 2, '2019-03-22 14:11:38'),
(25, 1, 72, 5, 6, '2019-03-22 14:20:10'),
(26, 1, 72, 6, 3, '2019-03-22 10:25:13'),
(27, 1, 72, 7, 6, '2019-03-22 14:31:40'),
(28, 1, 69, 5, 2, '2019-03-22 14:22:20'),
(29, 1, 69, 6, 2, '2019-03-22 14:42:33'),
(30, 1, 71, 1, 2, '2019-03-20 20:12:23'),
(31, 1, 73, 6, 3, '2019-03-22 14:03:04'),
(32, 1, 70, 4, 5, '2019-03-17 19:05:03'),
(33, 1, 72, 6, 5, '2019-03-22 14:32:19');

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

-- --------------------------------------------------------

--
-- Table structure for table `teams`
--

CREATE TABLE `teams` (
  `id` int(11) NOT NULL,
  `team_name` varchar(500) NOT NULL,
  `crest` varchar(750) NOT NULL,
  `manager` varchar(400) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `teams`
--

INSERT INTO `teams` (`id`, `team_name`, `crest`, `manager`) VALUES
(3, 'Bayern Munich', 'tbd.jpg', 'N.Kovac'),
(4, 'Liverpool', 'tbd.jpg', 'J.Klopp');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `username` varchar(255) NOT NULL,
  `uuid_timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `username`, `uuid_timestamp`) VALUES
(2, 'bob', '2019-02-24 12:16:46'),
(3, 'tim', '2019-02-26 22:47:19'),
(4, 'jim', '2019-02-26 22:47:19'),
(5, 'lin', '2019-02-26 22:47:30'),
(6, 'tom', '2019-02-26 22:47:30');

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
  ADD PRIMARY KEY (`match_id`,`player_id`,`user_id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `player_id` (`player_id`);

--
-- Indexes for table `ratings_history`
--
ALTER TABLE `ratings_history`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`),
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
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `events`
--
ALTER TABLE `events`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `matches`
--
ALTER TABLE `matches`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `matches_events`
--
ALTER TABLE `matches_events`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `players`
--
ALTER TABLE `players`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=91;

--
-- AUTO_INCREMENT for table `ratings_history`
--
ALTER TABLE `ratings_history`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=34;

--
-- AUTO_INCREMENT for table `substitutions`
--
ALTER TABLE `substitutions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `teams`
--
ALTER TABLE `teams`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

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
  ADD CONSTRAINT `ratings_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `ratings_ibfk_2` FOREIGN KEY (`match_id`) REFERENCES `matches` (`id`),
  ADD CONSTRAINT `ratings_ibfk_3` FOREIGN KEY (`player_id`) REFERENCES `players` (`id`);

--
-- Constraints for table `ratings_history`
--
ALTER TABLE `ratings_history`
  ADD CONSTRAINT `ratings_history_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `ratings_history_ibfk_2` FOREIGN KEY (`match_id`) REFERENCES `matches` (`id`),
  ADD CONSTRAINT `ratings_history_ibfk_3` FOREIGN KEY (`player_id`) REFERENCES `players` (`id`);

--
-- Constraints for table `substitutions`
--
ALTER TABLE `substitutions`
  ADD CONSTRAINT `substitutions_ibfk_1` FOREIGN KEY (`match_id`) REFERENCES `matches` (`id`),
  ADD CONSTRAINT `substitutions_ibfk_2` FOREIGN KEY (`sub_player_id`) REFERENCES `players` (`id`),
  ADD CONSTRAINT `substitutions_ibfk_3` FOREIGN KEY (`starting_player_id`) REFERENCES `players` (`id`),
  ADD CONSTRAINT `substitutions_ibfk_4` FOREIGN KEY (`team_id`) REFERENCES `teams` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
