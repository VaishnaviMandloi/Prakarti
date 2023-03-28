-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Mar 20, 2023 at 12:54 PM
-- Server version: 10.4.27-MariaDB
-- PHP Version: 8.2.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `prakarti`
--

-- --------------------------------------------------------

--
-- Table structure for table `accpted`
--

CREATE TABLE `accpted` (
  `id` int(11) NOT NULL,
  `first_name` varchar(50) NOT NULL,
  `last_name` varchar(50) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `country` varchar(50) DEFAULT NULL,
  `type_of_room` varchar(50) DEFAULT NULL,
  `bedding` varchar(50) DEFAULT NULL,
  `number_of_room` varchar(50) DEFAULT NULL,
  `check_out` varchar(50) DEFAULT NULL,
  `check_in` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `accpted`
--

INSERT INTO `accpted` (`id`, `first_name`, `last_name`, `email`, `country`, `type_of_room`, `bedding`, `number_of_room`, `check_out`, `check_in`) VALUES
(35, 'Hamza', NULL, 'rjvideos9@gmail.com', 'Pakistani', 'Deluxe Room', 'Double', '3', '2021-09-17', '2021-09-14'),
(36, 'Hamza', NULL, 'rjvideos9@gmail.com', 'Pakistani', 'Deluxe Room', 'Double', '3', '2021-09-17', '2021-09-14'),
(37, 'marruhk', NULL, 'dsfkjafkdf@gmail.com', 'Pakistani', 'Superior Room', 'Single', '1', '2021-09-15', '2021-09-24'),
(38, 'Hamza', NULL, 'rjvideos9@gmail.com', 'Pakistani', 'Deluxe Room', 'Double', '3', '2021-09-14', '2021-09-17'),
(40, 'reject', NULL, 'frrgthi@gh.com', 'Pakistani', 'Superior Room', 'Single', '1', '2023-03-19', '2023-03-19'),
(41, 'reject', NULL, 'frrgthi@gh.com', 'Pakistani', 'Superior Room', 'Double', '2', '2023-03-19', '2023-03-19');

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `id` int(11) NOT NULL,
  `name` varchar(50) DEFAULT NULL,
  `password` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`id`, `name`, `password`) VALUES
(1, 'hamza', '123'),
(2, 'ahmad', '1122');

-- --------------------------------------------------------

--
-- Table structure for table `appoinment`
--

CREATE TABLE `appoinment` (
  `id` int(11) NOT NULL,
  `Title` varchar(50) DEFAULT NULL,
  `first_name` varchar(50) DEFAULT NULL,
  `last_name` varchar(50) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `nationality` varchar(50) DEFAULT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `type_of_room` varchar(50) DEFAULT NULL,
  `Bedding_Type` varchar(50) DEFAULT NULL,
  `Number_of_rooms` varchar(50) DEFAULT NULL,
  `check_in` varchar(50) DEFAULT NULL,
  `check_out` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `appoinment`
--

INSERT INTO `appoinment` (`id`, `Title`, `first_name`, `last_name`, `email`, `nationality`, `phone`, `type_of_room`, `Bedding_Type`, `Number_of_rooms`, `check_in`, `check_out`) VALUES
(68, 'Dr.', 'reject', 'id', 'frrgthi@gh.com', 'Pakistani', '34467980-08988', 'Guest House', 'Triple', '4', '2023-04-05', '2023-04-07'),
(70, 'Mr.', 'fff', 'ggg', 'frrgthi@gh.com', 'Pakistani', '34467980-08988', 'Deluxe Room', 'Triple', '2', '2023-03-19', '2023-03-19'),
(71, 'Dr.', 'digpal', 'singh', 'digpal@gmail.com', 'Pakistani', '34467980-08988', 'Deluxe Room', 'Double', '1', '2023-03-19', '2023-03-19'),
(72, 'Dr.', 'digpal', 'singh', 'digpal@gmail.com', 'Pakistani', '34467980-08988', 'Deluxe Room', 'Double', '1', '2023-03-19', '2023-03-19'),
(73, 'Dr.', 'mahipal', 'singh', 'digpal@gmail.com', 'Pakistani', '01234567892', 'Guest House', 'Double', '2', '2023-03-20', '2023-03-20');

-- --------------------------------------------------------

--
-- Table structure for table `contact`
--

CREATE TABLE `contact` (
  `name` varchar(100) NOT NULL,
  `email` varchar(50) DEFAULT NULL,
  `date_created` datetime NOT NULL DEFAULT current_timestamp(),
  `phone` varchar(100) DEFAULT NULL,
  `id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `contact`
--

INSERT INTO `contact` (`name`, `email`, `date_created`, `phone`, `id`) VALUES
('hamza', 'rjvideos9@gmail.com', '2021-09-01 00:44:53', 'NULL', 1),
('hamza', 'rjvideos@gmail.com', '2021-09-01 00:45:23', NULL, 2),
('hamza', 'rjvideos@gmail.com', '2021-09-01 00:45:58', NULL, 3),
('rajpoot', 'rj@gamil.com', '2021-09-01 12:25:40', NULL, 4),
('rajpoot', 'rj@gamil.com', '2021-09-01 12:25:40', NULL, 5),
('hamz', 'rjvideos9@gmail.com', '2021-09-01 13:20:10', NULL, 6),
('helo', 'rjv@gmail.com', '2021-09-01 15:51:11', NULL, 7),
('Hamza', 'rjvideos9@gmail.com', '2021-09-02 02:43:24', NULL, 8),
('Hamza', 'rjvideos9@gmail.com', '2021-09-02 10:01:40', '03041080841', 9),
('hamza', 'rjvideos9@gmail.com', '2021-09-02 10:29:40', '03041080841', 10),
('hamza', 'rjvideos9@gmail.com', '2021-09-02 10:31:31', '03041080841', 11),
('hamza', 'rjvideos9@gmail.com', '2021-09-02 10:31:31', '03041080841', 12),
('Hamza', 'rjvideos9@gmail.com', '2021-09-02 10:31:31', '03041080841', 13),
('Hamza', 'rjvideos9@gmail.com', '2021-09-02 10:31:31', '03041080841', 14),
('Hamza', 'rjvideos9@gmail.com', '2021-09-02 10:31:31', '03041080841', 15),
('Hamza', 'rjvideos9@gmail.com', '2021-09-02 10:31:31', '03041080841', 16),
('Hamza', 'rjvideos9@gmail.com', '2021-09-02 10:31:31', '03041080841', 17),
('Hamza', 'rjvideos9@gmail.com', '2021-09-02 10:36:34', '03041080841', 18),
('Hamza', 'rjvideos9@gmail.com', '2021-09-02 10:40:21', '03041080841', 19),
('Hamza', 'rjvideos9@gmail.com', '2021-09-02 10:41:35', '03041080841', 20),
('Hamza', 'Rjvideos9@gmail.com', '2021-09-02 10:41:35', '03041080841', 21),
('Hamza', 'rjvideos9@gmail.com', '2021-09-02 10:41:35', '03041080841', 22),
('Hamza', 'rjvideos9@gmail.com', '2021-09-02 10:41:35', '03041080841', 23),
('Hamza', 'rjvideos9@gmail.com', '2021-09-02 10:41:35', '03041080841', 24),
('fff ggg', 'frrgthi@gh.com', '2023-03-18 23:27:48', '34467980-08988', 25),
('digpal singh', 'digpal@gmail.com', '2023-03-20 03:03:51', '1234567892', 26),
('digpal singh', 'digpal@gmail.com', '2023-03-20 04:48:24', '1234567892', 27),
('mahipal singh', 'mahipal@gmail.com', '2023-03-20 04:48:24', '01234567892', 28);

-- --------------------------------------------------------

--
-- Table structure for table `reject`
--

CREATE TABLE `reject` (
  `id` int(11) NOT NULL,
  `name` varchar(100) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `country` varchar(50) DEFAULT NULL,
  `type_of_room` varchar(50) DEFAULT NULL,
  `bedding` varchar(50) DEFAULT NULL,
  `number_of_room` varchar(50) DEFAULT NULL,
  `check_in` varchar(50) DEFAULT NULL,
  `check_out` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `reject`
--

INSERT INTO `reject` (`id`, `name`, `email`, `country`, `type_of_room`, `bedding`, `number_of_room`, `check_in`, `check_out`) VALUES
(8, 'Waris ali', 'rjvideos9@gmail.com', 'Pakistani', 'Deluxe Room', 'Single', '1', '2021-09-09', '2021-09-08'),
(9, 'Hamza', 'rjvideos9@gmail.com', 'Pakistani', 'Superior Room', 'Triple', '1', '2021-09-17', '2021-09-17'),
(10, 'Hamza', 'rjvideos9@gmail.com', 'Pakistani', 'Superior Room', 'Triple', '1', '2021-09-17', '2021-09-17'),
(11, 'Hamza', 'rjvideos9@gmail.com', 'Pakistani', 'Superior Room', 'Triple', '1', '2021-09-17', '2021-09-17'),
(12, 'Hamza', 'rjvideos9@gmail.com', 'Pakistani', 'Superior Room', 'Triple', '1', '2021-09-17', '2021-09-17'),
(13, 'Hamza', 'rjvideos9@gmail.com', 'Pakistani', 'Deluxe Room', 'Double', '3', '2021-09-17', '2021-09-14'),
(14, 'Hamza', 'rjvideos9@gmail.com', 'Pakistani', 'Deluxe Room', 'Double', '3', '2021-09-17', '2021-09-14'),
(15, 'reject', 'frrgthi@gh.com', 'Pakistani', 'Superior Room', 'Single', '2', '2023-03-19', '2023-03-19'),
(16, 'reject', 'frrgthi@gh.com', 'Pakistani', 'Deluxe Room', 'Triple', '2', '2023-03-19', '2023-03-19'),
(17, 'reject', 'frrgthi@gh.com', 'Pakistani', 'Superior Room', 'Single', '3', '2023-03-20', '2023-03-29'),
(18, 'reject', 'frrgthi@gh.com', 'Pakistani', 'Guest House', 'Double', '2', '2023-03-19', '2023-03-19'),
(19, 'reject', 'frrgthi@gh.com', 'Pakistani', 'Deluxe Room', 'Triple', '3', '2023-03-19', '2023-04-07');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `userid` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`userid`, `name`, `email`, `password`) VALUES
(2, 'Adam William', 'adam@webdamn.com', '123'),
(3, 'vaishnavi Mandloi', 'vaish@gmail.com', '123'),
(4, 'vaishnavi Mandloi', 'devanshi@gmail.com', '123'),
(5, 'vaishnavi Mandloi', 'devi@gmail.com', '123'),
(6, 'vaishnavi Mandloi', 'devyani@gmail.com', '123'),
(7, 'anita tomar', 'anita@yahoo.vom', '123'),
(8, 'anita tomar', 'anitaa@yahoo.vom', '123'),
(9, 'anita tomar', 'anitaaa@yahoo.vom', '123'),
(10, 'digpal', 'digpal@fghh.gh', '123'),
(11, 'digpal', 'digpal@fgh.com', '123'),
(12, 'digpal singh', 'digpal@gmail.com', '123');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `accpted`
--
ALTER TABLE `accpted`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `appoinment`
--
ALTER TABLE `appoinment`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `contact`
--
ALTER TABLE `contact`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `reject`
--
ALTER TABLE `reject`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`userid`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `accpted`
--
ALTER TABLE `accpted`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=42;

--
-- AUTO_INCREMENT for table `admin`
--
ALTER TABLE `admin`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `appoinment`
--
ALTER TABLE `appoinment`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=74;

--
-- AUTO_INCREMENT for table `contact`
--
ALTER TABLE `contact`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- AUTO_INCREMENT for table `reject`
--
ALTER TABLE `reject`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `userid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
