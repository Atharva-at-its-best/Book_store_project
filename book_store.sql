-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Mar 11, 2025 at 11:50 AM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `book_store`
--

-- --------------------------------------------------------

--
-- Table structure for table `cart`
--

CREATE TABLE `cart` (
  `id` int(100) NOT NULL,
  `user_id` int(100) NOT NULL,
  `name` varchar(100) NOT NULL,
  `price` int(100) NOT NULL,
  `quantity` int(100) NOT NULL,
  `image` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `message`
--

CREATE TABLE `message` (
  `id` int(100) NOT NULL,
  `user_id` int(100) NOT NULL,
  `name` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `number` varchar(12) NOT NULL,
  `message` varchar(500) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `message`
--

INSERT INTO `message` (`id`, `user_id`, `name`, `email`, `number`, `message`) VALUES
(2, 2, 'Aditys', 'adi789987@gmail.com', '9876541230', 'Nice product collection!'),
(3, 1, 'Atharva', 'atharvamude@gmail.com', '7588103664', 'Are they original books or fake?'),
(4, 1, 'Atharva', 'atharva@gmail.com', '7588103664', 'Are they original books or fake?'),
(5, 1, 'abc', 'abc@gmail.com', '77879', 'Hello sharks !'),
(6, 1, 'atharva mude', 'atharvamude124@gmail.com', '451895', 'testing email'),
(7, 1, 'Atharva Mude', 'atharva.mude.ai@ghrce.raisoni.net', '07057465423', 'new testing mail'),
(8, 1, 'Atharva Mude', 'atharva.mude.ai@ghrce.raisoni.net', '07057465423', 'Message sent successfully!'),
(9, 1, 'Atharva Mude', 'atharva.mude.ai@ghrce.raisoni.net', '07057465423', 'nice work'),
(10, 1, 'Atharva Mude', 'atharva.mude.ai@ghrce.raisoni.net', '07057465423', 'testing email for contacting');

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `id` int(100) NOT NULL,
  `user_id` int(100) NOT NULL,
  `name` varchar(100) NOT NULL,
  `number` varchar(12) NOT NULL,
  `email` varchar(100) NOT NULL,
  `method` varchar(50) NOT NULL,
  `address` varchar(500) NOT NULL,
  `total_products` varchar(1000) NOT NULL,
  `total_price` int(100) NOT NULL,
  `placed_on` varchar(50) NOT NULL,
  `payment_status` varchar(20) NOT NULL DEFAULT 'Pending'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`id`, `user_id`, `name`, `number`, `email`, `method`, `address`, `total_products`, `total_price`, `placed_on`, `payment_status`) VALUES
(1, 1, 'Aditi Kumar', '9876541230', 'aditikumar@gmail.com', 'Cash on delivery', 'flat no.123 , Hiranandani, Mumbai, India - 400104', 'Dont Look Back(2)', 200, '28 February 2025', 'pending'),
(4, 1, 'dsfs', '07057465423', 'sfzd@gxv', 'cash on delivery', 'flat no. 23, dfhbd, vcb, tgd - 440027', ', Dont Look Back (1) ', 100, '07-Mar-2025', 'pending'),
(5, 1, 'fdg', '07057465423', 'detd@gfh', 'cash on delivery', 'flat no. 23, cg, gu, India - 440027', ', Psychology Of Money (1) ', 300, '07-Mar-2025', 'completed'),
(6, 1, 'Atharva Mude', '07057465423', 'atharva@gmail.com', 'cash on delivery', 'flat no. 158, near ring road omkar nagar square nagpur, Nagpur, India - 440027', ', Dont Look Back (2) , Dont Believe Everything ... (3) , Cant Hurt Me (2) ', 1800, '09-Mar-2025', 'pending'),
(7, 2, 'Atharva Mude', '07057465423', 'atharva.mude.ai@ghrce.raisoni.net', 'cash on delivery', 'flat no. 101, near ring road omkar nagar square nagpur, Nagpur, India - 440027', ', Seven (1) , Twist Me (1) ', 1400, '10-Mar-2025', 'completed'),
(8, 2, 'Atharva Mude', '07057465423', 'atharva.mude.ai@ghrce.raisoni.net', 'cash on delivery', 'flat no. 25, near ring road omkar nagar square nagpur, Nagpur, India - 440027', ', Cant Hurt Me (1) ', 500, '10-Mar-2025', 'Pending'),
(9, 2, 'Atharva Mude', '07057465423', 'atharva.mude.ai@ghrce.raisoni.net', 'cash on delivery', 'flat no. 23, scdv, Nagpur, India - 440027', ', Subtle Art Of Not .. (1) ', 325, '10-Mar-2025', 'completed'),
(10, 2, 'Atharva Mude', '07057465423', 'atharvamude124@gmail.com', 'cash on delivery', 'flat no. 56, near ring road omkar nagar square nagpur, Nagpur, India - 440027', ', Rich Dad Poor Dad (3) ', 1050, '10-Mar-2025', 'completed');

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` int(100) NOT NULL,
  `name` varchar(100) NOT NULL,
  `price` int(100) NOT NULL,
  `image` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `name`, `price`, `image`) VALUES
(3, 'Dont Look Back', 100, '1.png'),
(4, 'Dont Believe Everything ...', 200, '2.jpg'),
(5, 'Cant Hurt Me', 500, 'cant hurt me.jpg'),
(6, 'The 5 Am Club', 500, '4.jpg'),
(7, 'Psychology Of Money', 300, '5.jpg'),
(8, 'Zero To One', 450, '6.jpg'),
(9, 'Atomic Habits', 150, '7.jpg'),
(10, 'Subtle Art Of Not ..', 325, '8.jpg'),
(11, '12 Rules For Life', 475, '9.jpg'),
(12, 'The Almanack Of Naval...', 300, '10.jpg'),
(13, 'Rich Dad Poor Dad', 350, '11.jpg'),
(14, 'The Art of Being Alone', 200, '12.jpg'),
(15, 'It Ends With Us', 350, '13.jpg'),
(16, 'Two States', 400, '14.jpg'),
(17, 'Too Good To Be True', 550, '15.jpg'),
(18, 'You Only Live Once', 250, '16.jpg'),
(19, 'The Alchemist', 350, '17.jpg'),
(20, 'Haunting Adeline', 250, '18.jpg'),
(21, 'Karma', 200, '19.jpg'),
(22, 'Attitude Is Everything', 250, '20.jpg'),
(23, 'Seven', 800, '21.jpg'),
(24, 'The Monk Who Sold His ...', 250, '22.jpg'),
(25, 'The 48 Laws Of Power', 600, '23.jpg'),
(26, 'You Are A Badass', 450, '24.jpg'),
(27, 'The Power of Subconsci ...', 150, '25.jpg'),
(28, 'The Enemy', 250, '26.jpg'),
(29, 'Red Queen', 550, '27.jpg'),
(30, 'Twist Me', 600, '28.jpg'),
(31, 'Fifty Shades of Grey', 450, '29.jpg'),
(32, 'Seduced In The Dark', 650, '30.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `ID` int(100) NOT NULL,
  `Name` varchar(100) NOT NULL,
  `Email` varchar(100) NOT NULL,
  `Password` varchar(100) NOT NULL,
  `User_type` varchar(20) NOT NULL DEFAULT 'User'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`ID`, `Name`, `Email`, `Password`, `User_type`) VALUES
(1, 'Atharva', 'atharva@gmail.com', '123', 'user'),
(2, 'aditys', 'adi@gmail.com', '456', 'user'),
(3, 'Amen', 'amen@gmail.com', '456789', 'admin');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `cart`
--
ALTER TABLE `cart`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `message`
--
ALTER TABLE `message`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`ID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `cart`
--
ALTER TABLE `cart`
  MODIFY `id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `message`
--
ALTER TABLE `message`
  MODIFY `id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `ID` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
