CREATE TABLE sorting (
  id int IDENTITY(1,1) PRIMARY KEY,
  numbervalue int,
  datevalue date,
  stringvalue varchar(max),
  datestring varchar(max),
  numberstring varchar(max),
  numbername varchar(max),
  fullname varchar(max),
  email varchar(max),
  firstname varchar(max),
  lastname varchar(max)
);

SET IDENTITY_INSERT sorting ON;
INSERT INTO sorting(id, numbervalue, datevalue, stringvalue, numberstring, datestring, numbername, fullname, email, firstname, lastname)
VALUES
	(1,-4,'1815-12-10','apple','-4','10 Dec 1815','Six','Ada Lovelace','ada.lovelace@example.com','Ada','Lovelace'), 
	(2,32,'1794-09-29','Cherry','32','29 Sep 1794','Four','Rose de Freycinet','rose.defreycinet@example.net','Rose','de Freycinet'), 
	(3,0,'1819-09-13','cherry','0','13 Sep 1819','Three','Clara Schumann','clara.schumann@example.com','Clara','Schumann'), 
	(4,4,'1820-05-12','date','4','12 May 1820','Eight','Florence Nightingale','florence.nightingale@example.org','Florence','Nightingale'), 
	(5,16,'1890-09-15','Banana','16','15 Sep 1890','Two','Agatha Christie','agatha.christie@example.net','Agatha','Christie'), 
	(6,8,'1917-06-30','Apple','8','30 Jun 1917','Seven','Lena Horne','lena.horne@example.com','Lena','Horne'), 
	(7,-8,'1867-11-07','banana','-8','7 Nov 1867','One','Marie Curie','marie.curie@example.org','Marie','Curie'), 
	(8,1024,'1775-12-16','Date','1024','16 Dec 1775','Five','Jane Austen','jane.austen@example.net','Jane','Austen')
;
SET IDENTITY_INSERT sorting OFF;