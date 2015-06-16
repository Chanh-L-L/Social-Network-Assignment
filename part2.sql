-- Name:  Chanh Long Lu
-- ---------------------------------------------------------

CREATE VIEW vw_user
AS SELECT GivenName, Surname, Address, City, Country, DateOfBirth, Email, ActivityName
FROM User, Activity
WHERE
ActivityName = "Bison breeding"
AND ( Activity.idUser1 = User.idUser 
OR Activity.idUser2 = User.idUser );

SELECT * FROM vw_user;