-- 	Create Activity table --

create table Activity(
`idActivity` mediumint unsigned not null auto_increment,
`Name` varchar(80),
primary key(idActivity)
)ENGINE=InnoDB;

-- 	Add activities --

INSERT INTO `Activity`(`Name`) VALUES ("Bison breeding");
INSERT INTO `Activity`(`Name`) VALUES ("Swimming");
INSERT INTO `Activity`(`Name`) VALUES ("Running");
INSERT INTO `Activity`(`Name`) VALUES ("Sailing");

-- 	Add Users assoiciated to some activities --

alter table Activity add idUser1 int not null after Name;
alter table Activity add idUser2 int not null after idUser1;
alter table Activity add idUser3 int not null after idUser2;
alter table Activity add idUser4 int not null after idUser3;

-- 	Make one activity has more than one User --

UPDATE Activity, User
SET Activity.idUser1 = User.idUser
WHERE Activity.Name="Bison breeding" AND User.idUser = 1;

UPDATE Activity, User
SET Activity.idUser2 = User.idUser
WHERE Activity.Name="Bison breeding" AND User.idUser = 3;

UPDATE Activity, User
SET Activity.idUser3 = User.idUser
WHERE Activity.Name="Bison breeding" AND User.idUser = 7;

UPDATE Activity, User
SET Activity.idUser4 = User.idUser
WHERE Activity.Name="Bison breeding" AND User.idUser = 10;

-- 	Make a User has more than one activity --

UPDATE Activity, User
SET Activity.idUser1 = User.idUser
WHERE Activity.Name="Swimming" AND User.idUser = 1;

--	 Add foreign key constraints

ALTER TABLE Activity ADD KEY (idUser1);
ALTER TABLE Activity ADD KEY (idUser2);
ALTER TABLE Activity ADD KEY (idUser3);
ALTER TABLE Activity ADD KEY (idUser4);

SET foreign_key_checks = 0;
ALTER TABLE Activity ADD FOREIGN KEY (idUser1) REFERENCES User (idUser);
ALTER TABLE Activity ADD FOREIGN KEY (idUser2) REFERENCES User (idUser);
ALTER TABLE Activity ADD FOREIGN KEY (idUser3) REFERENCES User (idUser);
ALTER TABLE Activity ADD FOREIGN KEY (idUser4) REFERENCES User (idUser);
SET foreign_key_checks = 1;

-- 	Add in more User for Activity --

UPDATE `Activity` SET `idUser1`=2 WHERE `Name`="Running";
UPDATE `Activity` SET `idUser1`=13 WHERE `Name`="Sailing";

UPDATE `Activity` SET `idUser2`=4 WHERE `Name`="Swimming";
UPDATE `Activity` SET `idUser2`=5 WHERE `Name`="Running";
UPDATE `Activity` SET `idUser2`=6 WHERE `Name`="Sailing";

UPDATE `Activity` SET `idUser3`=8 WHERE `Name`="Swimming";
UPDATE `Activity` SET `idUser3`=9 WHERE `Name`="Running";
UPDATE `Activity` SET `idUser3`=11 WHERE `Name`="Sailing";

UPDATE `Activity` SET `idUser4`=12 WHERE `Name`="Swimming";
UPDATE `Activity` SET `idUser4`=3 WHERE `Name`="Running";
UPDATE `Activity` SET `idUser4`=14 WHERE `Name`="Sailing";

-- 	design a SELECT query that yields the given name, surname, date of birth, address, and e-mail
-- 	for each user interested in bison breeding 

SELECT `GivenName` , `Surname` , `DateOfBirth` , `Address` , `Email`
FROM User, Activity
WHERE Name = "Bison breeding"
AND ( Activity.idUser1 = User.idUser 
OR Activity.idUser2 = User.idUser 
OR Activity.idUser3 = User.idUser 
OR Activity.idUser4 = User.idUser);

-- 	Create a view --

CREATE VIEW vw_user
AS SELECT GivenName, Surname, Address, DateOfBirth, Email, Name
FROM User, Activity
WHERE
Name = "Bison breeding"
AND ( Activity.idUser1 = User.idUser 
OR Activity.idUser2 = User.idUser 
OR Activity.idUser3 = User.idUser 
OR Activity.idUser4 = User.idUser);

SELECT * FROM vw_user;

-- 	Create Message Types table

create table MessageType(
`idType` tinyint(1) not null auto_increment,
`TypeName` varchar(10),
primary key(idType)
)ENGINE=InnoDB;

INSERT INTO `MessageType`(`TypeName`) VALUES ("Public");
INSERT INTO `MessageType`(`TypeName`) VALUES ("Private");
INSERT INTO `MessageType`(`TypeName`) VALUES ("non-Public");

--	----------------------------------------------------
-- 	Altering Message table
--	----------------------------------------------------
-- 	add MessageTypeId column

alter table Message add `MessageTypeId` tinyint(1) not null after `Posted`;

--	add foreign key to MessageTypeId

alter table Message add key(MessageTypeId);

SET foreign_key_checks = 0;
ALTER TABLE Message ADD FOREIGN KEY (MessageTypeId) REFERENCES MessageType (idType);
SET foreign_key_checks = 1;

--	drop isPublic column

alter table Message drop isPublic;

-- 	add 4 more messages to Message table

insert into Message (`idOwner`, `Subject`, `Body`, `Posted`, `MessageTypeId`)
values ("9", "When is 280 test?", "Need more time to study!", "2011-03-13 13:00:00", "2");

insert into Message (`idOwner`, `Subject`, `Body`, `Posted`, `MessageTypeId`)
values ("9", "Still drunk 2nite?", "No more beezie for you.", "2011-03-13 15:00:00", "2");

insert into Message (`idOwner`, `Subject`, `Body`, `Posted`, `MessageTypeId`)
values ("11", "Exam's coming", "Are you ready bro!?", "2011-04-13 13:00:00", "2");

insert into Message (`idOwner`, `Subject`, `Body`, `Posted`, `MessageTypeId`)
values ("6", "Lunch mate", "Meet you at quad.", "2011-05-13 13:00:00", "2");

--	create MessageSendTo table

create table MessageSendTo(
`RecipientId` int(11) not null auto_increment,
`MessageId` int(11) not null,
`Receiver1` int(11) not null,
`Receiver2` int(11) not null,
primary key(RecipientId)
)ENGINE=InnoDB;

UPDATE MessageSendTo, User, Message
SET MessageSendTo.MessageId = Message.idMessage, MessageSendTo.Receiver1 = User.idUser, MessageSendTo.Receiver2 = User.idUser;

--	add foreign key

alter table MessageSendTo add key(MessageId);
alter table MessageSendTo add key(Receiver1);
alter table MessageSendTo add key(Receiver2);

SET foreign_key_checks = 0;
ALTER TABLE MessageSendTo ADD FOREIGN KEY (MessageId) REFERENCES Message(idMessage);
ALTER TABLE MessageSendTo ADD FOREIGN KEY (Receiver1) REFERENCES User(idUser);
ALTER TABLE MessageSendTo ADD FOREIGN KEY (Receiver2) REFERENCES User(idUser);
SET foreign_key_checks = 1;

insert into MessageSendTo (`MessageId`, `Receiver1`, `Receiver2`)
values ("11", "1", "2");

insert into MessageSendTo (`MessageId`, `Receiver1`)
values ("12", "1");

insert into MessageSendTo (`MessageId`, `Receiver1`)
values ("13", "5");

insert into MessageSendTo (`MessageId`, `Receiver1`, `Receiver2`)
values ("14", "11", "12");
