-- phpMyAdmin SQL Dump
-- version 5.1.3
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 15, 2022 at 05:44 PM
-- Server version: 10.4.24-MariaDB
-- PHP Version: 8.1.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `power_app`
--

-- --------------------------------------------------------

--
-- Table structure for table `bill_generate`
--

CREATE TABLE `bill_generate` (
  `invoiceID` int(11) NOT NULL,
  `accNo` varchar(100) DEFAULT NULL,
  `custName` varchar(200) DEFAULT NULL,
  `unitPrice` double DEFAULT NULL,
  `units` double DEFAULT NULL,
  `amount` double DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `bill_generate`
--

INSERT INTO `bill_generate` (`invoiceID`, `accNo`, `custName`, `unitPrice`, `units`, `amount`) VALUES
(1, '123', 'harshani', 22.5, 1000, 2250),
(13, '100928', 'jerry', 100, 100, 10000);

-- --------------------------------------------------------

--
-- Table structure for table `card_data`
--

CREATE TABLE `card_data` (
  `userCard_ID` int(11) NOT NULL,
  `card_number` varchar(45) DEFAULT NULL,
  `cvv` int(11) DEFAULT NULL,
  `exp_date` varchar(45) DEFAULT NULL,
  `crd_holder_name` varchar(45) DEFAULT NULL,
  `card_issued` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `card_data`
--

INSERT INTO `card_data` (`userCard_ID`, `card_number`, `cvv`, `exp_date`, `crd_holder_name`, `card_issued`) VALUES
(9, '00333', 790, '08/10/2023', 'gimhani', 'visa'),
(10, '1231312', 231, '02/08/2040	', 'harr', 'Visa');

-- --------------------------------------------------------

--
-- Table structure for table `payment_table`
--

CREATE TABLE `payment_table` (
  `payment_ID` int(11) NOT NULL,
  `customer_name` varchar(100) NOT NULL,
  `bill_accountNo` varchar(50) NOT NULL,
  `date` varchar(50) NOT NULL,
  `amount` double NOT NULL,
  `pay_amount` double NOT NULL,
  `email` varchar(45) NOT NULL,
  `rest_amount` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `payment_table`
--

INSERT INTO `payment_table` (`payment_ID`, `customer_name`, `bill_accountNo`, `date`, `amount`, `pay_amount`, `email`, `rest_amount`) VALUES
(3, 'harshi', '123', '12/2/2022', 1000, 900, 'harshi.dis@gmail.com', 100),
(4, 'gayani', '12022', '12/10/2022', 2250, 900, 'gayani.dis@gmail.com', 1350),
(5, 'maleesha', '2081553', '11/04/2022', 10000, 5000, 'maleesha@ssh.gmail.com', 5000);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `bill_generate`
--
ALTER TABLE `bill_generate`
  ADD PRIMARY KEY (`invoiceID`);

--
-- Indexes for table `card_data`
--
ALTER TABLE `card_data`
  ADD PRIMARY KEY (`userCard_ID`);

--
-- Indexes for table `payment_table`
--
ALTER TABLE `payment_table`
  ADD PRIMARY KEY (`payment_ID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `bill_generate`
--
ALTER TABLE `bill_generate`
  MODIFY `invoiceID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `card_data`
--
ALTER TABLE `card_data`
  MODIFY `userCard_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `payment_table`
--
ALTER TABLE `payment_table`
  MODIFY `payment_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
