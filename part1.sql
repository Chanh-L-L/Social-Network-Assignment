-- Name:  Chanh Long Lu
-- ---------------------------------------------------------

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

-- --------------------------------------------------------

--
-- Table structure for table `Activity`
--

CREATE TABLE IF NOT EXISTS `Activity` (
  `idActivity` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `ActivityName` varchar(80) DEFAULT NULL,
  `idUser1` int(11) NOT NULL,
  `idUser2` int(11) NOT NULL,
  PRIMARY KEY (`idActivity`),
  KEY `idUser1` (`idUser1`),
  KEY `idUser2` (`idUser2`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=5 ;

--
-- Dumping data for table `Activity`
--

INSERT INTO `Activity` (`idActivity`, `ActivityName`, `idUser1`, `idUser2`) VALUES(1, 'Bison breeding', 1, 2);
INSERT INTO `Activity` (`idActivity`, `ActivityName`, `idUser1`, `idUser2`) VALUES(2, 'Swimming', 1, 5);
INSERT INTO `Activity` (`idActivity`, `ActivityName`, `idUser1`, `idUser2`) VALUES(3, 'Running', 3, 6);
INSERT INTO `Activity` (`idActivity`, `ActivityName`, `idUser1`, `idUser2`) VALUES(4, 'Sailing', 4, 7);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `Activity`
--
ALTER TABLE `Activity`
  ADD CONSTRAINT `activity_ibfk_2` FOREIGN KEY (`idUser2`) REFERENCES `User` (`idUser`),
  ADD CONSTRAINT `activity_ibfk_1` FOREIGN KEY (`idUser1`) REFERENCES `User` (`idUser`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
