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
-- Table structure for table `Message`
--
DROP TABLE IF EXISTS `Message` ;

CREATE TABLE IF NOT EXISTS `Message` (
  `idMessage` int(11) NOT NULL AUTO_INCREMENT,
  `idOwner` int(11) DEFAULT NULL,
  `Subject` varchar(255) DEFAULT NULL,
  `Body` text,
  `Posted` datetime DEFAULT NULL,
  `MessageTypeId` tinyint(1) NOT NULL,
  PRIMARY KEY (`idMessage`),
  KEY `MessageOwner` (`idOwner`),
  KEY `MessageTypeId` (`MessageTypeId`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=15 ;

--
-- Dumping data for table `Message`
--

INSERT INTO `Message` (`idMessage`, `idOwner`, `Subject`, `Body`, `Posted`, `MessageTypeId`) VALUES(1, 1, 'Party at my place', '2nite 7 pm till l8!!!! CU there!!!', '2011-02-15 15:06:28', 1);
INSERT INTO `Message` (`idMessage`, `idOwner`, `Subject`, `Body`, `Posted`, `MessageTypeId`) VALUES(2, 1, 'COMPSCI280', 'Just enrolled there, seems a cool course', '2011-02-15 15:20:35', 1);
INSERT INTO `Message` (`idMessage`, `idOwner`, `Subject`, `Body`, `Posted`, `MessageTypeId`) VALUES(3, 1, 'Hangover!', 'Maaaan, that party rocked!', '2011-02-16 11:45:15', 3);
INSERT INTO `Message` (`idMessage`, `idOwner`, `Subject`, `Body`, `Posted`, `MessageTypeId`) VALUES(4, 2, 'Party', 'At Tama''s place 2nite 7.30 see youse there!', '2011-02-15 17:16:22', 1);
INSERT INTO `Message` (`idMessage`, `idOwner`, `Subject`, `Body`, `Posted`, `MessageTypeId`) VALUES(5, 2, 'Yawn!', 'That party was a hit, Tama! Slept in badly though...', '2011-02-16 12:14:08', 3);
INSERT INTO `Message` (`idMessage`, `idOwner`, `Subject`, `Body`, `Posted`, `MessageTypeId`) VALUES(6, 5, 'How''s 280?', 'Anyone else enrolled?', '2011-02-17 12:04:11', 1);
INSERT INTO `Message` (`idMessage`, `idOwner`, `Subject`, `Body`, `Posted`, `MessageTypeId`) VALUES(7, 6, 'Just enrolled in COMPSCI280', 'Just what I wanted, really!', '2011-02-17 14:02:57', 3);
INSERT INTO `Message` (`idMessage`, `idOwner`, `Subject`, `Body`, `Posted`, `MessageTypeId`) VALUES(8, 7, 'COMPSCI280 lecturer', 'Heard that it will be this dude with the hat. Ulrich. Had him in 101. Easygoing and approachable!', '2011-02-17 16:01:55', 3);
INSERT INTO `Message` (`idMessage`, `idOwner`, `Subject`, `Body`, `Posted`, `MessageTypeId`) VALUES(9, 8, '280', 'Looking forward to the lectures on C# by Angela Chang - the expert!', '2011-02-17 15:32:41', 1);
INSERT INTO `Message` (`idMessage`, `idOwner`, `Subject`, `Body`, `Posted`, `MessageTypeId`) VALUES(10, 9, 'WOZUP this weekend?', 'Any partying or are you all at home doing the 280 assignment', '2011-03-12 10:10:48', 3);
INSERT INTO `Message` (`idMessage`, `idOwner`, `Subject`, `Body`, `Posted`, `MessageTypeId`) VALUES(11, 9, 'When is 280 test?', 'Need more time to study!', '2011-03-13 13:00:00', 2);
INSERT INTO `Message` (`idMessage`, `idOwner`, `Subject`, `Body`, `Posted`, `MessageTypeId`) VALUES(12, 9, 'Still drunk 2nite?', 'No more beezie for you.', '2011-03-13 15:00:00', 2);
INSERT INTO `Message` (`idMessage`, `idOwner`, `Subject`, `Body`, `Posted`, `MessageTypeId`) VALUES(13, 11, 'Exam''s coming', 'Are you ready bro!?', '2011-04-13 13:00:00', 2);
INSERT INTO `Message` (`idMessage`, `idOwner`, `Subject`, `Body`, `Posted`, `MessageTypeId`) VALUES(14, 6, 'Lunch mate', 'Meet you at quad.', '2011-05-13 13:00:00', 2);

-- --------------------------------------------------------

--
-- Table structure for table `MessageSendTo`
--

CREATE TABLE IF NOT EXISTS `MessageSendTo` (
  `RecipientId` int(11) NOT NULL AUTO_INCREMENT,
  `MessageId` int(11) NOT NULL,
  `Receiver1` int(11) NOT NULL,
  `Receiver2` int(11) NOT NULL,
  PRIMARY KEY (`RecipientId`),
  KEY `MessageId` (`MessageId`),
  KEY `Receiver1` (`Receiver1`),
  KEY `Receiver2` (`Receiver2`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=5 ;

--
-- Dumping data for table `MessageSendTo`
--

INSERT INTO `MessageSendTo` (`RecipientId`, `MessageId`, `Receiver1`, `Receiver2`) VALUES(1, 11, 9, 3);
INSERT INTO `MessageSendTo` (`RecipientId`, `MessageId`, `Receiver1`, `Receiver2`) VALUES(2, 12, 1, 9);
INSERT INTO `MessageSendTo` (`RecipientId`, `MessageId`, `Receiver1`, `Receiver2`) VALUES(3, 13, 12, 7);
INSERT INTO `MessageSendTo` (`RecipientId`, `MessageId`, `Receiver1`, `Receiver2`) VALUES(4, 14, 6, 3);

-- --------------------------------------------------------

--
-- Table structure for table `MessageType`
--

CREATE TABLE IF NOT EXISTS `MessageType` (
  `idType` tinyint(1) NOT NULL AUTO_INCREMENT,
  `TypeName` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`idType`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=4 ;

--
-- Dumping data for table `MessageType`
--

INSERT INTO `MessageType` (`idType`, `TypeName`) VALUES(1, 'Public');
INSERT INTO `MessageType` (`idType`, `TypeName`) VALUES(2, 'Private');
INSERT INTO `MessageType` (`idType`, `TypeName`) VALUES(3, 'non-Public');

--
-- Constraints for dumped tables
--

--
-- Constraints for table `Message`
--
ALTER TABLE `Message`
  ADD CONSTRAINT `MessageOwner` FOREIGN KEY (`idOwner`) REFERENCES `User` (`idUser`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `message_ibfk_1` FOREIGN KEY (`MessageTypeId`) REFERENCES `MessageType` (`idType`);

--
-- Constraints for table `MessageSendTo`
--
ALTER TABLE `MessageSendTo`
  ADD CONSTRAINT `messagesendto_ibfk_1` FOREIGN KEY (`MessageId`) REFERENCES `Message` (`idMessage`),
  ADD CONSTRAINT `messagesendto_ibfk_2` FOREIGN KEY (`Receiver1`) REFERENCES `User` (`idUser`),
  ADD CONSTRAINT `messagesendto_ibfk_3` FOREIGN KEY (`Receiver2`) REFERENCES `User` (`idUser`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
