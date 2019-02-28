-- phpMyAdmin SQL Dump
-- version 4.7.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Feb 28, 2019 at 10:23 PM
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
(1, '2019-03-13 20:00:00', 'Allianz Arena', 0, 'Champions League'),
(2, '2019-02-15 00:00:00', 'jhjh', 94, 'ldflkgjdf;lkgj');

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
(1, 1, 4, 25, 4, '2019-02-26 19:16:55'),
(2, 1, 3, 7, 3, '2019-02-26 18:04:51');

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
(1, 25, 4, -1),
(1, 26, 4, 23);

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
(1, 3, '4-3-3'),
(1, 4, '4-4-2');

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
(3, 'Neuer', 1, 'N/A', 3),
(4, 'Rafinha', 13, 'N/A', 3),
(5, 'Sule', 4, 'N/A', 3),
(6, 'Hummels', 5, 'N/A', 3),
(7, 'Alaba', 27, 'N/A', 3),
(8, 'Thiago', 6, 'N/A', 3),
(9, 'Rodriguez', 11, 'N/A', 3),
(10, 'Martinez', 8, 'N/A', 3),
(11, 'Gnabry', 22, 'N/A', 3),
(12, 'Lewandowski', 9, 'N/A', 3),
(13, 'Coman', 29, 'N/A', 3),
(14, 'Ulreich', 26, 'N/A', 3),
(15, 'Mai', 33, 'N/A', 3),
(16, 'Boateng', 17, 'N/A', 3),
(17, 'Shabani', 37, 'N/A', 3),
(18, 'Sanches', 35, 'N/A', 3),
(19, 'Tolisso', 24, 'N/A', 3),
(20, 'Goretzka', 18, 'N/A', 3),
(21, 'Muller', 25, 'N/A', 3),
(22, 'Davies', 19, 'N/A', 3),
(23, 'Robben', 10, 'N/A', 3),
(24, 'Ribery', 7, 'N/A', 3),
(25, 'Alisson', 13, 'N/A', 4),
(26, 'Alexander-Arnold', 66, 'N/A', 4),
(27, 'Matip', 32, 'N/A', 4),
(28, 'Van Dikj', 5, 'N/A', 4),
(29, 'Robertson', 26, 'N/A', 4),
(30, 'Wijnaldum', 5, 'N/A', 4),
(31, 'Henderson', 14, 'N/A', 4),
(32, 'Keita', 8, 'N/A', 4),
(33, 'Salah', 11, 'N/A', 4),
(34, 'Firmino', 9, 'N/A', 4),
(35, 'Mane', 10, 'N/A', 4),
(36, 'Mignolet', 22, 'N/A', 4),
(37, 'Lovren', 6, 'N/A', 4),
(38, 'Gomez', 12, 'N/A', 4),
(39, 'Moreno', 18, 'N/A', 4),
(40, 'Milner', 7, 'N/A', 4),
(41, 'Lallana', 20, 'N/A', 4),
(42, 'Fabinho', 3, 'N/A', 4),
(43, 'Oxlade-Chamberlain', 21, 'N/A', 4),
(44, 'Shaqiri', 23, 'N/A', 4),
(45, 'Sturridge', 15, 'N/A', 4),
(46, 'Origi', 27, 'N/A', 4);

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
(1, 7, 2, 10, '2019-02-28 21:19:26');

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
(34, 1, 7, 1, 6, '2019-02-28 13:09:47'),
(35, 1, 7, 2, 2, '2019-02-28 21:14:41'),
(36, 1, 16, 2, 6, '2019-02-28 21:15:12'),
(37, 1, 25, 4, 5, '2019-02-28 21:14:41'),
(38, 1, 42, 6, 6, '2019-02-28 21:15:12'),
(39, 1, 7, 2, 2, '2019-02-28 21:18:15');

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
(1, 1, 7, 26, 4, '2019-02-14 00:00:00'),
(2, 1, 25, 25, 4, '2019-02-28 00:00:00'),
(3, 2, 7, 25, 4, '2019-02-25 11:44:36'),
(5, 2, 25, 25, 4, '2019-02-25 11:14:28'),
(6, 1, 7, 26, 4, '2019-02-25 11:18:25');

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
  `user_uuid` varchar(255) NOT NULL,
  `uuid_timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `user_uuid`, `uuid_timestamp`) VALUES
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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `matches_events`
--
ALTER TABLE `matches_events`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `players`
--
ALTER TABLE `players`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=47;

--
-- AUTO_INCREMENT for table `ratings_history`
--
ALTER TABLE `ratings_history`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=40;

--
-- AUTO_INCREMENT for table `substitutions`
--
ALTER TABLE `substitutions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

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
