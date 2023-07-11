-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 15, 2022 at 03:55 PM
-- Server version: 10.4.24-MariaDB
-- PHP Version: 8.1.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `examin`
--

-- --------------------------------------------------------

--
-- Table structure for table `groups`
--

CREATE TABLE `groups` (
  `gid` int(11) NOT NULL,
  `gname` varchar(50) NOT NULL,
  `gdescription` varchar(200) NOT NULL,
  `active` int(2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `groups`
--

INSERT INTO `groups` (`gid`, `gname`, `gdescription`, `active`) VALUES
(2, 'Faculty', 'Faculty of the System', 1),
(3, 'Student of 2022-2023 MCA', 'Students who got admission in year 2022-2023 batch in Mca.', 1),
(5, 'Students of 2023-2024 MCA', 'Students who got admission in year 2023-2024 batch in Mca.', 1),
(8, 'Students of 2021-2022 MCA', 'Students who got admission in year 2021-2022 batch in Mca.', 0),
(9, 'abc', 'abc', 1);

-- --------------------------------------------------------

--
-- Table structure for table `paperset`
--

CREATE TABLE `paperset` (
  `psid` int(11) NOT NULL,
  `psname` varchar(50) NOT NULL,
  `uid` int(11) NOT NULL,
  `gid` int(11) NOT NULL,
  `active` int(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `paperset`
--

INSERT INTO `paperset` (`psid`, `psname`, `uid`, `gid`, `active`) VALUES
(4, ' Gk ', 2, 3, 1),
(7, ' Gk ', 2, 2, 1),
(8, ' bcd ', 2, 2, 1),
(9, ' Java Examination 1', 2, 3, 1),
(10, ' Java Examination 2', 2, 8, 1),
(11, ' Java Examination 3', 2, 3, 1),
(12, 'Maths ', 2, 5, 1),
(19, 'Dev', 2, 3, 1);

-- --------------------------------------------------------

--
-- Table structure for table `question`
--

CREATE TABLE `question` (
  `qid` int(11) NOT NULL,
  `question` varchar(200) NOT NULL,
  `opt1` varchar(100) NOT NULL,
  `opt2` varchar(100) NOT NULL,
  `opt3` varchar(100) NOT NULL,
  `opt4` varchar(100) NOT NULL,
  `answer` int(2) NOT NULL,
  `psid` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `question`
--

INSERT INTO `question` (`qid`, `question`, `opt1`, `opt2`, `opt3`, `opt4`, `answer`, `psid`) VALUES
(3, 'Who is the prime minister of India?', 'Narendra Modi', 'Amit Shah', 'Bhupendra Patel', 'Yogi Adityanath', 1, 4),
(4, 'Which is the largest state of India?', 'Gujarat', 'Maharastra', 'Rajasthan', 'Goa', 3, 4),
(9, 'Choose even number', '5', '9', '1', '4', 4, 7),
(10, 'Choose odd number', '4', '6', '7', '8', 3, 7),
(11, 'skdjksadgn', '56', '5', '65', '65', 1, 8),
(12, 'Is Java a Programming language?', 'Yes', 'No', 'None', 'Both (A) ', 1, 9),
(13, 'In which file we can write scriptlets?', 'Servlet', 'Filter', 'Jsp', 'Xml', 3, 9),
(14, 'Select the true statement from the following?', 'Session cannot be used in Jsp', 'You have to declare and session in Jsp', 'Java is a scripting language', 'Java language is developed by Sun MicroSystems', 4, 9),
(15, 'Is Java a Programming language?', 'Yes', 'No', 'None', 'Both (A) ', 1, 10),
(16, 'In which file we can write scriptlets?', 'Servlet', 'Filter', 'Jsp', 'Xml', 3, 10),
(17, 'Select the true statement from the following?', 'Session cannot be used in Jsp', 'You have to declare and session in Jsp', 'Java is a scripting language', 'Java language is developed by Sun MicroSystems', 43, 10),
(18, 'Array in java are?', 'Object reference', 'objects', 'Primitive Data types', 'None', 2, 11),
(19, 'Identify the corrected definition of a package.', 'A package is a collection of editing tools.', 'A package is a collection of classes.', 'A package is a collection of classes and interfaces.', 'A package is a collection of interfaces.', 3, 11),
(20, 'Which company is the founder of Java?', 'Sun MicroSystem', 'Apple', 'Microsoft', 'Google', 1, 11),
(21, '7*6', '41', '42', '43', '44', 2, 12),
(22, '(4*20)-(20/4)', '60', '65', '70', '75', 4, 12),
(23, '1+1', '0', '1', '2', '11', 3, 12),
(30, 'dkgbakndg', '13', '21', '54', '98', 2, 19);

-- --------------------------------------------------------

--
-- Table structure for table `result`
--

CREATE TABLE `result` (
  `rsid` int(11) NOT NULL,
  `uid` int(11) NOT NULL,
  `psid` int(11) NOT NULL,
  `result` int(10) NOT NULL,
  `date_time_ofSubmission` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `result`
--

INSERT INTO `result` (`rsid`, `uid`, `psid`, `result`, `date_time_ofSubmission`) VALUES
(1, 3, 4, 2, '2022-11-14 15:25:58'),
(13, 3, 11, 2, '2022-11-14 23:14:46'),
(14, 7, 19, 1, '2022-11-15 10:02:19');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `userId` int(11) NOT NULL,
  `uname` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL,
  `typeOfUser` int(1) NOT NULL,
  `gid` int(11) NOT NULL,
  `active` int(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`userId`, `uname`, `password`, `typeOfUser`, `gid`, `active`) VALUES
(2, 'faculty', '123', 1, 2, 1),
(3, 'adarsh', 'adarsh', 2, 3, 1),
(5, 'abc', 'abc', 1, 2, 1),
(6, 'Mohan', '123', 2, 8, 1),
(7, 'Dev Rami', '123', 2, 3, 1);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `groups`
--
ALTER TABLE `groups`
  ADD PRIMARY KEY (`gid`),
  ADD UNIQUE KEY `gid` (`gid`,`gname`);

--
-- Indexes for table `paperset`
--
ALTER TABLE `paperset`
  ADD PRIMARY KEY (`psid`);

--
-- Indexes for table `question`
--
ALTER TABLE `question`
  ADD PRIMARY KEY (`qid`);

--
-- Indexes for table `result`
--
ALTER TABLE `result`
  ADD PRIMARY KEY (`rsid`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`userId`),
  ADD UNIQUE KEY `userId` (`userId`,`uname`),
  ADD UNIQUE KEY `uname` (`uname`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `groups`
--
ALTER TABLE `groups`
  MODIFY `gid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `paperset`
--
ALTER TABLE `paperset`
  MODIFY `psid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT for table `question`
--
ALTER TABLE `question`
  MODIFY `qid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT for table `result`
--
ALTER TABLE `result`
  MODIFY `rsid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `userId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
