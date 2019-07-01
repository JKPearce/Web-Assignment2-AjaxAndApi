-- phpMyAdmin SQL Dump
-- version 4.7.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: May 22, 2018 at 10:25 AM
-- Server version: 5.7.19
-- PHP Version: 5.6.31

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+10:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `assignment2`
--
DROP DATABASE IF EXISTS `assignment2`;
CREATE DATABASE IF NOT EXISTS `assignment2` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `assignment2`;

# Privileges for `assignment2User`@`localhost`

GRANT USAGE ON *.* TO 'assignment2User'@'localhost';

GRANT ALL PRIVILEGES ON `assignment2`.* TO 'assignment2User'@'localhost'
 IDENTIFIED BY 'Lk8i0TMA3JQdysko'
  WITH GRANT OPTION ;

-- --------------------------------------------------------

--
-- Table structure for table `game`
--

DROP TABLE IF EXISTS `game`;
CREATE TABLE IF NOT EXISTS `game` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(150) NOT NULL,
  `image_url` varchar(150) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `game`
--

INSERT INTO `game` (`id`, `name`, `image_url`) VALUES
(1, 'Overwatch', 'images/overwatch.jpg'),
(2, 'World of Warcraft', 'images/wow.jpg'),
(3, 'Heroes of the Storm', 'images/hots.jpg'),
(4, 'Hearthstone', 'images/hearthstone.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `review`
--

DROP TABLE IF EXISTS `review`;
CREATE TABLE IF NOT EXISTS `review` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `game_id` int(11) NOT NULL,
  `reviewer_name` varchar(50) NOT NULL,
  `review` varchar(255) NOT NULL,
  `rating` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `game_id` (`game_id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `review`
--

INSERT INTO `review` (`id`, `game_id`, `reviewer_name`, `review`, `rating`) VALUES
(1, 1, 'Jaydon', 'This is a very fun game.', 5),
(2, 1, 'Matthew', 'HotS is better.', 3),
(3, 2, 'Jaydon', 'Lots of Fun!', 5),
(4, 2, 'Matthew', 'This game is old.', 3),
(5, 3, 'Matthew', 'Best game in the World.', 5),
(6, 3, 'Jaydon', 'Overwatch is better', 3),
(7, 4, 'Jaydon', 'I fell asleep writing my other review.', 2),
(8, 4, 'Matthew', 'Good mobile game to play when out and about.', 4);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `review`
--
ALTER TABLE `review`
  ADD CONSTRAINT `review_ibfk_1` FOREIGN KEY (`game_id`) REFERENCES `game` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
