-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Mar 09, 2023 at 11:11 AM
-- Server version: 10.4.27-MariaDB
-- PHP Version: 8.0.25

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `azure_db`
--
CREATE DATABASE IF NOT EXISTS `azure_db` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `azure_db`;

-- --------------------------------------------------------

--
-- Table structure for table `agent`
--

DROP TABLE IF EXISTS `agent`;
CREATE TABLE `agent` (
  `id` int(11) NOT NULL,
  `user_name` varchar(255) NOT NULL,
  `agent_name` varchar(100) DEFAULT NULL,
  `email` varchar(255) NOT NULL,
  `password` text DEFAULT NULL,
  `role` enum('USER','ADMIN') DEFAULT 'USER',
  `phone_number` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

DROP TABLE IF EXISTS `categories`;
CREATE TABLE `categories` (
  `id` int(11) NOT NULL,
  `title` varchar(50) NOT NULL,
  `image` varchar(50) NOT NULL,
  `description` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `title`, `image`, `description`) VALUES
(1, 'Beach', 'url', 'blah2'),
(2, 'Mountains', 'url1', 'blah2'),
(3, 'Hiking', 'url2', 'blah2');

-- --------------------------------------------------------

--
-- Table structure for table `order`
--

DROP TABLE IF EXISTS `order`;
CREATE TABLE `order` (
  `id` int(11) NOT NULL,
  `list_id` int(11) DEFAULT NULL,
  `order_type` varchar(255) NOT NULL,
  `status` enum('CANCEL','PENDING','APPROVED') DEFAULT NULL,
  `order_date` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `rating`
--

DROP TABLE IF EXISTS `rating`;
CREATE TABLE `rating` (
  `id` int(11) NOT NULL,
  `rating` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `travel_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `rating`
--

INSERT INTO `rating` (`id`, `rating`, `user_id`, `travel_id`) VALUES
(2, 3, 1, 3);

-- --------------------------------------------------------

--
-- Table structure for table `travels`
--

DROP TABLE IF EXISTS `travels`;
CREATE TABLE `travels` (
  `id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `images` text DEFAULT NULL,
  `detail` text DEFAULT NULL,
  `price` int(11) DEFAULT NULL,
  `location` text DEFAULT NULL,
  `day` int(11) DEFAULT NULL,
  `cat_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `travels`
--

INSERT INTO `travels` (`id`, `title`, `images`, `detail`, `price`, `location`, `day`, `cat_id`) VALUES
(1, 'ENJOY WARM BEACH VIBES', 'url', 'blah2', 1500, 'Bali, Indonesia', 14, 1),
(2, 'EVEREST', 'url', 'blah2', 3000, 'Himalaya', 7, 2),
(3, 'LET\'S WAALK', 'url', 'blah2', 2000, 'Switzerland', 7, 3),
(4, 'asd', 'asd', 'asd', 122, 'asd', 1, 2);

-- --------------------------------------------------------

--
-- Table structure for table `travel_list`
--

DROP TABLE IF EXISTS `travel_list`;
CREATE TABLE `travel_list` (
  `id` int(11) NOT NULL,
  `travel_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `adult` int(11) DEFAULT NULL,
  `child` int(11) DEFAULT NULL,
  `total` float DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `password` varchar(255) NOT NULL,
  `email` varchar(30) NOT NULL,
  `role` enum('USER','ADMIN') DEFAULT 'USER',
  `phone_number` text DEFAULT NULL,
  `profileimg` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `password`, `email`, `role`, `phone_number`, `profileimg`) VALUES
(1, 'Naraa', 'pass123', 'naraa@gmail.com', 'USER', NULL, NULL),
(2, 'Saraa', 'pass123', 'saraa@gmail.com', 'USER', NULL, NULL),
(3, 'Ganaa', 'pass123', 'ganaa@gmail.com', 'USER', NULL, NULL),
(4, 'Teska', '$2b$10$xS.mG8wEMMJXSruCP8HmSeaKc4AZqy2z8FmleUdqc73SqoQB7OtNS', 'teska@gmail.com', NULL, '98983320', 'url'),
(5, 'Teska0075', '$2b$10$ihUjvZOuSiX4AJzHESDYwu816wzDaWGBMjVWwl5CaqPmcxqRnYUPy', 'teska0075@gmail.com', 'USER', '98983320', 'url');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `agent`
--
ALTER TABLE `agent`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `image` (`image`);

--
-- Indexes for table `order`
--
ALTER TABLE `order`
  ADD PRIMARY KEY (`id`),
  ADD KEY `list_id` (`list_id`);

--
-- Indexes for table `rating`
--
ALTER TABLE `rating`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `travel_id` (`travel_id`);

--
-- Indexes for table `travels`
--
ALTER TABLE `travels`
  ADD PRIMARY KEY (`id`),
  ADD KEY `cat_id` (`cat_id`);

--
-- Indexes for table `travel_list`
--
ALTER TABLE `travel_list`
  ADD PRIMARY KEY (`id`),
  ADD KEY `travel_id` (`travel_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `agent`
--
ALTER TABLE `agent`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `order`
--
ALTER TABLE `order`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `rating`
--
ALTER TABLE `rating`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `travels`
--
ALTER TABLE `travels`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `travel_list`
--
ALTER TABLE `travel_list`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `order`
--
ALTER TABLE `order`
  ADD CONSTRAINT `order_ibfk_1` FOREIGN KEY (`list_id`) REFERENCES `travel_list` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `rating`
--
ALTER TABLE `rating`
  ADD CONSTRAINT `rating_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `rating_ibfk_2` FOREIGN KEY (`travel_id`) REFERENCES `travels` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `travels`
--
ALTER TABLE `travels`
  ADD CONSTRAINT `travels_ibfk_1` FOREIGN KEY (`cat_id`) REFERENCES `categories` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `travel_list`
--
ALTER TABLE `travel_list`
  ADD CONSTRAINT `travel_list_ibfk_1` FOREIGN KEY (`travel_id`) REFERENCES `travels` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `travel_list_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
