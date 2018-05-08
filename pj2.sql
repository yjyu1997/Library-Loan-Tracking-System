

CREATE TABLE Instrument (
instrumentID INTEGER NOT NULL, 
musicKey VARCHAR(2) NOT NULL, 
name VARCHAR(15) NOT NULL,
PRIMARY KEY (instrumentID),
CONSTRAINT instrIDLength CHECK (instrumentID BETWEEN 1 AND 9999));

CREATE TABLE Residence (
state VARCHAR(2) NOT NULL, 
street VARCHAR(40) NOT NULL, 
city VARCHAR(40) NOT NULL,
postcode VARCHAR(6) NOT NULL,  
phoneNo VARCHAR(10) NOT NULL, 
PRIMARY KEY (phoneNo),
CONSTRAINT phoneNoLength CHECK (LENGTH(phoneNo) = 10));

CREATE TABLE Musician(
SSN VARCHAR(9) NOT NULL, 
first VARCHAR(15) NOT NULL, 
last VARCHAR(15) NOT NULL, 
phoneNo VARCHAR(10) NOT NULL, 
PRIMARY KEY (SSN),
FOREIGN KEY (phoneNo) REFERENCES Residence(phoneNo)
ON DELETE NO ACTION ON UPDATE CASCADE,
CONSTRAINT SSNLength CHECK (LENGTH(SSN) = 9));
/*have to force user to use all 9 characters for a SSN*/

CREATE TABLE Album(
title VARCHAR(30) NOT NULL, 
copyDate DATE NOT NULL, 
format VARCHAR(10) NOT NULL, 
albumID INTEGER NOT NULL, 
PRIMARY KEY (albumID), 
CONSTRAINT albumIDLength CHECK (albumID BETWEEN 1 AND 9999),
CONSTRAINT dateInBounds CHECK (copyDate < CURDATE())); 

CREATE TABLE Producer (
SSN VARCHAR(9) NOT NULL, 
FOREIGN KEY (SSN) REFERENCES Musician(SSN)
);

CREATE TABLE Author (
albumID INTEGER NOT NULL, 
SSN VARCHAR(9) NOT NULL, 
PRIMARY KEY (albumID),
FOREIGN KEY (albumID) REFERENCES Album(albumID)
ON DELETE CASCADE ON UPDATE CASCADE,
FOREIGN KEY (SSN) REFERENCES Musician(SSN)
);


CREATE TABLE PlayedBy (
instrumentID INTEGER NOT NULL, 
SSN VARCHAR(9) NOT NULL, 
FOREIGN KEY (instrumentID) REFERENCES Instrument(instrumentID)
ON DELETE CASCADE ON UPDATE CASCADE,
FOREIGN KEY (SSN) REFERENCES Musician(SSN)
);

CREATE TABLE ProducedBy (
albumID INTEGER NOT NULL, 
SSN VARCHAR(9) NOT NULL, 
PRIMARY KEY (albumID),
FOREIGN KEY (albumID) REFERENCES Album(albumID)
ON DELETE CASCADE ON UPDATE CASCADE,
FOREIGN KEY (SSN) REFERENCES Musician(SSN)
);

CREATE TABLE Song (
title VARCHAR(25) NOT NULL, 
albumID INTEGER NOT NULL, 
FOREIGN KEY (albumID) REFERENCES Album(albumID)
);