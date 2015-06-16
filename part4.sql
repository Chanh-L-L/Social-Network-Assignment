-- Name:  Chanh Long Lu
-- ---------------------------------------------------------

-- add Users under 21 years old --

insert into `User`(`GivenName`, `Surname`, `Address`, `City`, `Country`, `DateOfBirth`, `Email`)
values('Pelvis', 'Madly', '700 Great South Rd', 'Papatoetoe', 'New Zealand', '1999-01-01 00:00:00', 'pm@xtra.co.nz');

insert into `User`(`GivenName`, `Surname`, `Address`, `City`, `Country`, `DateOfBirth`, `Email`)
values('Mobi', 'Sword', '90 Great South Rd', 'Green Lane', 'New Zealand', '2000-01-01 00:00:00', 'mosw@fast.nz');

insert into `User`(`GivenName`, `Surname`, `Address`, `City`, `Country`, `DateOfBirth`, `Email`)
values('Humty', 'Dumty', '888 Great South Rd', 'Penrose', 'New Zealand', '2001-01-01 00:00:00', 'hun008@less.co.nz');

-- add Messages older than 1 year old --

insert into `Message`(`idOwner`, `Subject`, `Body`, `Posted`, `MessageTypeId`)
values('15', 'Hello 280 people', 'Howz everyone', '2012-01-01 12:00:00', '1');

insert into `Message`(`idOwner`, `Subject`, `Body`, `Posted`, `MessageTypeId`)
values('16', 'Parteyyyy!', 'In the park @3pm today', '2012-01-01 10:00:00', '1');

insert into `Message`(`idOwner`, `Subject`, `Body`, `Posted`, `MessageTypeId`)
values('17', 'Study anyone?', 'Need a study group', '2012-01-01 11:00:00', '1');

-- create Procedure --
-- Note: MessageTypeId=1 means message is Public as defined in MessageType table
-- CurrentDate format is yyyy-mm-dd

delimiter //

create procedure delete_old_message(CurrentDate datetime)
begin
	delete Message.* from Message, User
	where User.idUser=Message.idOwner
		and Message.MessageTypeId='1'
		and User.Country='New Zealand'
		and  TIMESTAMPDIFF(YEAR, User.DateOfBirth, CurrentDate)<'21'
		and  TIMESTAMPDIFF(YEAR, Message.Posted, CurrentDate)>'1';
end

//

delimiter ;