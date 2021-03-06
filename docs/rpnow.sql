-- phpMyAdmin SQL Dump
-- version 4.0.10.7
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Mar 29, 2015 at 07:17 PM
-- Server version: 5.5.42-cll
-- PHP Version: 5.4.23

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `rzone_rp`
--

-- --------------------------------------------------------

--
-- Table structure for table `Character`
--

CREATE TABLE IF NOT EXISTS `Character` (
  `Name` varchar(30) NOT NULL,
  `Color` tinytext NOT NULL,
  `Room` char(4) NOT NULL,
  `Number` int(11) NOT NULL AUTO_INCREMENT,
  `Timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`Number`),
  UNIQUE KEY `NameRoom` (`Name`,`Room`),
  KEY `Room` (`Room`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `Message`
--

CREATE TABLE IF NOT EXISTS `Message` (
  `Content` text NOT NULL,
  `Is_Action` tinyint(1) NOT NULL DEFAULT '0',
  `Timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `Character_Name` varchar(30) NOT NULL,
  `Character_Room` char(4) NOT NULL,
  `Number` int(10) unsigned NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`Number`),
  KEY `Timestamp` (`Timestamp`),
  KEY `Character` (`Character_Name`,`Character_Room`),
  KEY `Character_Room` (`Character_Room`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `Room`
--

CREATE TABLE IF NOT EXISTS `Room` (
  `ID` char(4) NOT NULL,
  `Title` tinytext NOT NULL,
  `Description` tinytext NOT NULL,
  `Timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `Character`
--
ALTER TABLE `Character`
  ADD CONSTRAINT `Character_ibfk_1` FOREIGN KEY (`Room`) REFERENCES `Room` (`ID`);

--
-- Constraints for table `Message`
--
ALTER TABLE `Message`
  ADD CONSTRAINT `Character` FOREIGN KEY (`Character_Name`, `Character_Room`) REFERENCES `Character` (`Name`, `Room`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
