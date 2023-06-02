-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Jun 02, 2023 at 11:31 AM
-- Server version: 5.7.36
-- PHP Version: 7.4.26

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `mvc-2209c-toets`
--

-- --------------------------------------------------------

--
-- Table structure for table `Examen`
--

DROP TABLE IF EXISTS `Examen`;
CREATE TABLE IF NOT EXISTS `Examen` (
  `Id` tinyint(3) UNSIGNED NOT NULL AUTO_INCREMENT,
  `StudentId` int(6) NOT NULL,
  `Rijschool` varchar(50) NOT NULL,
  `Stad` varchar(20) NOT NULL,
  `Rijbewijscategorie` varchar(2) NOT NULL,
  `Datum` date NOT NULL,
  `Uitslag` varchar(10) NOT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `Examen`
--

INSERT INTO `Examen` (`Id`, `StudentId`, `Rijschool`, `Stad`, `Rijbewijscategorie`, `Datum`, `Uitslag`) VALUES
(1, 100234, 'VolGasVooruit', 'Rotterdam', 'B', '2023-04-03', 'Geslaagd'),
(2, 123432, 'InZijnVierDoorDeBocht', 'Sliedrecht', 'C', '2023-03-01', 'Geslaagd'),
(3, 103234, 'LinksomRechtsom', 'Dordrecht', 'D', '2023-05-15', 'Geslaagd'),
(4, 106452, 'OpDeVluchtStrook', 'Zwijndrecht', 'AM', '2023-05-08', 'Gezakt'),
(5, 104546, 'RechtDoorEnGaan', 'Rotterdam', 'B', '2023-04-17', 'Gezakt'),
(6, 100333, 'AltijdGeslaagd', 'Dordrecht', 'B', '2023-05-12', 'Geslaagd'),
(7, 124444, 'RijlesVoorJou', 'Rotterdam', 'B', '2023-04-12', 'Geslaagd');

-- --------------------------------------------------------

--
-- Table structure for table `ExamenPerExaminator`
--

DROP TABLE IF EXISTS `ExamenPerExaminator`;
CREATE TABLE IF NOT EXISTS `ExamenPerExaminator` (
  `Id` tinyint(3) UNSIGNED NOT NULL AUTO_INCREMENT,
  `ExamenId` tinyint(3) UNSIGNED NOT NULL,
  `ExaminatorId` tinyint(3) UNSIGNED NOT NULL,
  PRIMARY KEY (`Id`),
  KEY `FK_ExamenPerExaminator_ExamenId_Examen_Id` (`ExamenId`),
  KEY `FK_ExamenPerExaminator_ExaminatorId_Examinator_Id` (`ExaminatorId`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `ExamenPerExaminator`
--

INSERT INTO `ExamenPerExaminator` (`Id`, `ExamenId`, `ExaminatorId`) VALUES
(1, 1, 3),
(2, 3, 3),
(3, 2, 2),
(4, 4, 1),
(5, 7, 3),
(6, 6, 2),
(7, 5, 4);

-- --------------------------------------------------------

--
-- Table structure for table `Examinator`
--

DROP TABLE IF EXISTS `Examinator`;
CREATE TABLE IF NOT EXISTS `Examinator` (
  `Id` tinyint(3) UNSIGNED NOT NULL AUTO_INCREMENT,
  `Voornaam` varchar(20) NOT NULL,
  `Tussenvoegsel` varchar(10) DEFAULT NULL,
  `Achternaam` varchar(20) NOT NULL,
  `Mobiel` varchar(12) NOT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `Examinator`
--

INSERT INTO `Examinator` (`Id`, `Voornaam`, `Tussenvoegsel`, `Achternaam`, `Mobiel`) VALUES
(1, 'Manuel', 'van', 'Meekeren', '06-28493823'),
(2, 'Lissette', 'den', 'Dongen', '06-24383299'),
(3, 'Jurswailly', '', 'Luciano', '06-48293846'),
(4, 'Nashwa', '', 'Salawi', '06-34291219');

--
-- Constraints for dumped tables
--

--
-- Constraints for table `ExamenPerExaminator`
--
ALTER TABLE `ExamenPerExaminator`
  ADD CONSTRAINT `FK_ExamenPerExaminator_ExamenId_Examen_Id` FOREIGN KEY (`ExamenId`) REFERENCES `Examen` (`Id`),
  ADD CONSTRAINT `FK_ExamenPerExaminator_ExaminatorId_Examinator_Id` FOREIGN KEY (`ExaminatorId`) REFERENCES `Examinator` (`Id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
