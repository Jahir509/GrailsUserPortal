-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Nov 30, 2019 at 11:24 AM
-- Server version: 10.1.16-MariaDB
-- PHP Version: 5.5.38

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `bitmascot2`
--

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `version` bigint(20) NOT NULL,
  `phone` varchar(255) NOT NULL,
  `address` varchar(255) NOT NULL,
  `is_active` bit(1) NOT NULL,
  `birthdate` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `user_type` varchar(255) NOT NULL,
  `lastname` varchar(255) NOT NULL,
  `firstname` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id`, `version`, `phone`, `address`, `is_active`, `birthdate`, `password`, `user_type`, `lastname`, `firstname`, `email`) VALUES
(1, 0, '01991339009', 'Bitmascot', b'1', '1/1/2019', '21232f297a57a5a743894a0e4a801fc3', 'ADMINISTRATOR', 'User', 'Admin', 'admin@gmail.com'),
(8, 0, '01836983116', 'Modhubagh,Moghbazar,Dhaka-1217', b'1', '2019-06-18', '202cb962ac59075b964b07152d234b70', 'REGULAR_USER', 'Ahmed', 'Jony', 'jony@gmail.com'),
(9, 1, '1212121212', 'mamun@gmail.com', b'1', '2019-11-06', 'd9b1d7db4cd6e70935368a1efb10e377', 'REGULAR_USER', 'Ahmed', 'Mamun', 'mamun@gmail.com'),
(10, 0, '01836983116', 'Modhubagh,Moghbazar,Dhaka-1217', b'1', '2019-11-21', '202cb962ac59075b964b07152d234b70', 'REGULAR_USER', 'Ahmed', 'Jahir', 'jahir@gmail.com'),
(11, 0, '01836983116', 'Modhubagh,Moghbazar,Dhaka-1217', b'1', '2019-11-13', '202cb962ac59075b964b07152d234b70', 'REGULAR_USER', 'Ahmed', 'masud', 'masud@gmail.com'),
(12, 0, '25654151', 'Modhubagh,Moghbazar,Dhaka-1217', b'1', '2019-11-20', '202cb962ac59075b964b07152d234b70', 'REGULAR_USER', 'Islam', 'SIfat', 'sifat@gmail.com');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UK_ob8kqyqqgmefl0aco34akdtpe` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
