create database project;


use project;

CREATE TABLE adverse (
  INCIDENT_ID int NOT NULL,
  INCIDENT_DESCRIPTION varchar(100) DEFAULT NULL,
  PRIMARY KEY (INCIDENT_ID)
)

CREATE TABLE instruments (
  TRAY_ID int NOT NULL,
  TRAY_NAME varchar(50) DEFAULT NULL,
  VENDOR varchar(30) DEFAULT NULL,
  QTY_PIECES int DEFAULT NULL,
  PRIMARY KEY (TRAY_ID)
) 

CREATE TABLE patient (
  PATIENT_ID int NOT NULL,
  PT_FNAME varchar(20) DEFAULT NULL,
  PT_LNAME varchar(20) DEFAULT NULL,
  PT_SEX varchar(2) DEFAULT NULL,
  PT_DOB datetime NOT NULL,
  PT_WEIGHT int DEFAULT NULL,
  PT_ETHNICITY varchar(35) DEFAULT NULL,
  PRIMARY KEY (PATIENT_ID)
) 

CREATE TABLE procedures (
  CPT_CODE int NOT NULL,
  CPT_DESC varchar(100) DEFAULT NULL,
  SPECIALTY varchar(30) DEFAULT NULL,
  EST_LENGTH int DEFAULT NULL,
  PRIMARY KEY (CPT_CODE)
) 

CREATE TABLE staff (
  EMP_ID int NOT NULL,
  EMP_FNAME varchar(30) DEFAULT NULL,
  EMP_LNAME varchar(30) DEFAULT NULL,
  EMP_ROLE varchar(25) DEFAULT NULL,
  EMP_SEX varchar(2) DEFAULT NULL,
  EMP_HIREDATE datetime NOT NULL,
  PRIMARY KEY (EMP_ID)
) 

CREATE TABLE surgeon (
  SURGEON_ID int NOT NULL,
  S_FNAME varchar(20) DEFAULT NULL,
  S_LNAME varchar(20) DEFAULT NULL,
  S_SPECIALTY varchar(40) DEFAULT NULL,
  S_SEX varchar(2) DEFAULT NULL,
  S_DOB datetime NOT NULL,
  S_HIREDATE datetime NOT NULL,
  PRIMARY KEY (SURGEON_ID)
) 

CREATE TABLE surgery_event (
  ENCOUNTER_ID int NOT NULL,
  SURGERY_DATE date NOT NULL,
  PATIENT_ID int DEFAULT NULL FOREIGN KEY REFERENCES patient(PATIENT_ID),
  OR_SUITE int DEFAULT NULL,
  SPECIALTY varchar(45) DEFAULT NULL,
  CPT_CODE int DEFAULT NULL FOREIGN KEY REFERENCES procedures(CPT_CODE),
  CPT_DESC varchar(70) DEFAULT NULL,
  SURGEON_ID int DEFAULT NULL FOREIGN KEY REFERENCES surgeon(SURGEON_ID),
  SCRUB_ID int DEFAULT NULL FOREIGN KEY REFERENCES staff(EMP_ID),
  NURSE_ID int DEFAULT NULL FOREIGN KEY REFERENCES staff(EMP_ID),
  ANES_ID int DEFAULT NULL FOREIGN KEY REFERENCES staff(EMP_ID),
  BOOKED_TIME int DEFAULT NULL,
  INCIDENT_ID int DEFAULT NULL,
  TRAY_ID int DEFAULT NULL FOREIGN KEY REFERENCES instruments(TRAY_ID),
  OR_SCHEDULE datetime NOT NULL,
  WHEELS_IN datetime DEFAULT NULL,
  START_TIME datetime DEFAULT NULL,
  END_TIME datetime DEFAULT NULL,
  WHEELS_OUT datetime DEFAULT NULL,
  PRIMARY KEY (ENCOUNTER_ID),
)

INSERT INTO adverse VALUES (0,'No Incident'),(1,'Anesthesiology complications'),(2,'Surgical complications'),(3,'Intrumentation Delays'),(4,'Unforeseen Issues needing to be addressed intraoperatively'),(5,'Intraop labs needed');

INSERT INTO instruments VALUES (1,'Osteotomy Set 1','V Mueller',35),(2,'Osteotomy Set 2','V Mueller',35),(3,'Osteotomy Set 3','V Mueller',35),(4,'TPS Drill 1','Stryker',8),(5,'TPS Drill 2','Stryker',8),(6,'Podiatry Set 1','V Mueller',55),(7,'Podiatry Set 2','V Mueller',55),(8,'Opthomology Set 1','Storz',12),(9,'Opthomology Set 2','Storz',12),(10,'Opthomology Set 3','Storz',12),(11,'OBGYN Set 1','V Mueller',42),(12,'OBGYN Set 2','V Mueller',42),(13,'Hysterectomy Set 1','SKLAR',25),(14,'Gyn Biopsy Set 1','SKLAR',32),(15,'Synthes Knee Arthroplasty Set 1','Depuy Synthes',125),(16,'Synthes Knee Arthroplasty Set 2','Depuy Synthes',125),(17,'Zimmer Hip Arthorplasty Set 1','Zimmer Biomet',155),(18,'Zimmer Hip Arthorplasty Set 1','Zimmer Biomet',155),(19,'System 8 Drill Set 1','Stryker',8),(20,'System 8 Drill Set 2','Stryker',8),(21,'Urology Set 1','Millennium Surgical',44),(22,'Urology Set 2','Millennium Surgical',44),(23,'Endoscopy Set 1','Stryker',12),(24,'Endoscopy Set 2','Stryker',12),(25,'Plastics Instrument Tray 1','V Mueller',65),(26,'Plastics Instrument Tray 2','V Mueller',65),(27,'Rhinoplasty Set 1','Depuy Synthes',24),(28,'Lipo Canula Set 1','Millennium Surgical',15),(29,'Lipo Canula Set 2','Millennium Surgical',15),(30,'Vascular Set 1','V Mueller',31),(31,'Vascular Set 2','V Mueller',31),(32,'Gen Surgery Instruments 1','V Mueller',41),(33,'Gen Surgery Instruments 1','V Mueller',41),(34,'Labroscopic Set','Stryker',17),(35,'Maxillofacial Set 1','V Mueller',55),(36,'Maxillofacial Set 2','V Mueller',55),(37,'Rhinoplasty Set 2','Depuy Synthes',24),(38,'Plastics Instrument Tray 3','V Mueller',65),(39,'Ped Instruments Set 1','V Mueller',36),(40,'Ped Instruments Set 2','V Mueller',36),(41,'Ped Instruments Set 3','V Mueller',36),(42,'Orthopedic Instrument Set 1','Depuy Synthes',26),(43,'Orthopedic Instrument Set 2','Depuy Synthes',26),(44,'Orthopedic Instrument Set 3','Depuy Synthes',26),(45,'Linos Hand Set 1','KLS',75);

INSERT INTO patient VALUES (1013,'Claire','Stephens','F','1949-08-06 00:00:00',160,'White or Caucasian'),
(1021,'Levi','Goldmann','M','1991-07-25 00:00:00',278,'Prefer not to answer'),
(1027,'Amy','Navarro','F','1949-06-13 00:00:00',192,'American Indian or Alaska Native'),
(1058,'Ben','Brown','M','1952-05-03 00:00:00',233,'American Indian or Alaska Native'),
(1060,'Alan','Zhung','M','1987-05-17 00:00:00',280,'Asian'),
(1082,'Alice','Enriquez','F','1987-07-05 00:00:00',273,'Latino or Hispanic'),(1086,'Chase','Peng','M','1984-03-15 00:00:00',181,'Pacific Islander or Hawaiian'),
(1095,'Sage','Thames','F','1946-03-05 00:00:00',114,'White or Caucasian'),(1099,'Cameron','Hsu','M','1985-10-22 00:00:00',102,'Asian'),(1108,'Nate','Moore','M','1987-05-11 00:00:00',218,'Prefer not to answer'),
(1118,'Kim','Fernandez','F','1971-02-22 00:00:00',164,'Pacific Islander or Hawaiian'),(1121,'Elizabeth','Holmes','F','1970-03-30 00:00:00',236,'White or Caucasian'),(1129,'Gia','Johnson','F','1967-11-17 00:00:00',245,'Pacific Islander or Hawaiian'),
(1171,'Ann','Gibbons','F','1973-07-08 00:00:00',195,'African American/Black'),(1213,'Caroline','Chen','F','1953-12-15 00:00:00',110,'Asian'),(1220,'Lily','Baldwin','F','2002-03-10 00:00:00',143,'White or Caucasian'),(1229,'Kay','Han','F','1966-11-24 00:00:00',227,'Asian'),(1236,'Julie','Peterson','F','1996-02-04 00:00:00',287,'White or Caucasian'),(1248,'Miley','Wan','F','1977-01-03 00:00:00',216,'Asian'),(1265,'Jenna','Kanoska','F','1953-06-30 00:00:00',120,'American Indian or Alaska Native'),
(1288,'Drew','Stewart','M','1956-06-15 00:00:00',172,'White or Caucasian'),(1291,'Ruby','Blackwell','F','1966-12-05 00:00:00',147,'White or Caucasian'),(1322,'Will','Gonzalez','M','1947-04-23 00:00:00',210,'Latino or Hispanic'),(1328,'Max','Wells','M','1958-01-26 00:00:00',165,'Prefer not to answer'),(1334,'Gianna','Garcia','F','1951-08-19 00:00:00',105,'Latino or Hispanic'),
(1365,'Beth','Blue','F','1964-06-04 00:00:00',223,'Prefer not to answer'),(1384,'Ada','Wells','F','1992-09-30 00:00:00',225,'American Indian or Alaska Native'),(1386,'Leo','Trevino','M','1956-06-25 00:00:00',106,'White or Caucasian'),(1415,'Esla','Pham','F','1949-05-24 00:00:00',281,'Asian'),(1430,'Christian','Foster','M','1986-12-17 00:00:00',220,'American Indian or Alaska Native'),(1431,'Joey','Hernandez','M','1946-09-21 00:00:00',239,'Latino or Hispanic'),(1468,'Clay','Wiley','M','1970-03-02 00:00:00',215,'White or Caucasian'),(1481,'Joe','Schmoe','M','1987-12-14 00:00:00',294,'African American/Black'),
(1482,'Lucy','Williams','M','1996-01-22 00:00:00',145,'White or Caucasian'),(1493,'Owen','Wilson','M','1969-08-26 00:00:00',265,'African American/Black'),(1494,'Elle','Fernandez','F','1953-01-28 00:00:00',233,'Latino or Hispanic'),(1497,'Quinn','McIntosh','F','1984-08-05 00:00:00',297,'Prefer not to answer'),(1505,'Kurt','Lowery','M','1943-12-13 00:00:00',240,'White or Caucasian'),
(1506,'Sandy','Wu','F','1995-02-08 00:00:00',198,'Asian'),(1509,'Ava','Jones','F','1977-07-03 00:00:00',110,'White or Caucasian'),
(1510,'Grace','Joseph','F','1941-01-31 00:00:00',175,'African American/Black'),(1516,'Robert','Fox','M','1965-07-30 00:00:00',156,'Latino or Hispanic'),(1523,'Kevin','White','M','1980-01-13 00:00:00',263,'African American/Black'),(1531,'Ian','Davis','M','1996-01-26 00:00:00',180,'Prefer not to answer'),(1559,'Abigail','Hanson','F','1998-07-23 00:00:00',103,'African American/Black'),(1569,'Brooke','Stokes','F','1953-11-04 00:00:00',240,'African American/Black'),
(1572,'Maeve','Gutierrez','F','1959-06-22 00:00:00',225,'Latino or Hispanic'),(1593,'Ann','Humphries','F','1986-08-29 00:00:00',193,'White or Caucasian'),(1618,'Jade','Torres','F','1972-07-21 00:00:00',202,'Latino or Hispanic'),(1631,'Ruth','Opal','F','1996-11-26 00:00:00',207,'White or Caucasian'),(1664,'Linda','Socorro','F','1970-08-24 00:00:00',240,'Latino or Hispanic'),(1680,'Earl','Garcia','M','1958-10-04 00:00:00',209,'Pacific Islander or Hawaiian'),(1705,'Cindy','James','F','1946-11-27 00:00:00',187,'African American/Black'),(1709,'Daisy','Owen','F','1988-06-01 00:00:00',253,'White or Caucasian'),
(1720,'Gwen ','Kern','F','1944-10-22 00:00:00',285,'African American/Black'),(1723,'Tony','Decker','M','1966-07-20 00:00:00',215,'White or Caucasian'),(1738,'Beverly','Goodwell','F','1989-05-10 00:00:00',211,'Prefer not to answer'),(1741,'Fred','Bridges','M','1951-10-14 00:00:00',210,'American Indian or Alaska Native'),(1755,'Matthew','Fisher','M','1956-10-03 00:00:00',284,'Asian'),(1759,'Mike','Williamson','M','1989-03-02 00:00:00',229,'African American/Black'),
(1763,'Kate','McGreeves','F','1998-09-21 00:00:00',110,'White or Caucasian'),
(1767,'Cole','Brown','M','2000-05-15 00:00:00',129,'White or Caucasian'),
(1769,'Zoe','OMalley','F','1944-09-07 00:00:00',160,'Prefer not to answer'),(1779,'Sean','Martin','M','1980-04-22 00:00:00',272,'Prefer not to answer'),(1806,'Ella','Kahale','F','1957-01-08 00:00:00',277,'Pacific Islander or Hawaiian'),(1808,'Lisa','Brooks','F','1944-06-01 00:00:00',148,'African American/Black'),(1840,'Betty','Williams','F','1946-11-22 00:00:00',103,'Asian'),(1850,'Tara','Jackson','F','1966-09-18 00:00:00',256,'Prefer not to answer'),(1856,'Kerry','Duncan','F','1963-01-07 00:00:00',190,'African American/Black'),(1871,'Guy','Annue','M','1940-07-18 00:00:00',107,'Prefer not to answer'),(1886,'Joan','Lambert','F','1961-03-01 00:00:00',249,'White or Caucasian'),(1889,'Eugene','Watson','M','1962-11-02 00:00:00',193,'African American/Black'),(1890,'Hope','Liu','F','1982-02-24 00:00:00',231,'Asian'),(1898,'Lexi','Shapiro','F','1982-05-21 00:00:00',119,'Prefer not to answer'),(1905,'Gina','Gonzalez','F','1970-02-26 00:00:00',254,'Latino or Hispanic'),(1909,'Erica','Short','F','1984-05-13 00:00:00',151,'Asian'),(1918,'Wayne','Collins','M','1989-03-03 00:00:00',136,'Pacific Islander or Hawaiian'),(1919,'Brad','Munoz','M','1954-12-30 00:00:00',207,'Latino or Hispanic'),(1921,'Isla','Diaz','F','1984-12-08 00:00:00',207,'Latino or Hispanic'),(1923,'John','Yuan','M','1948-12-28 00:00:00',230,'Pacific Islander or Hawaiian'),(1931,'Emma','Bradford','F','1978-08-29 00:00:00',275,'Pacific Islander or Hawaiian'),(1981,'Noah','Nguyen','M','1969-09-29 00:00:00',144,'Asian'),(2008,'Cara','Lopez','F','1966-10-17 00:00:00',244,'Latino or Hispanic'),(2014,'Liam','Kell','M','1983-04-28 00:00:00',263,'Prefer not to answer'),(2025,'Kelly','Cook','F','1961-07-13 00:00:00',230,'African American/Black'),(2028,'Olivia','Rollins','F','1959-07-13 00:00:00',206,'American Indian or Alaska Native'),(2043,'Eric','Jackson','M','1989-10-27 00:00:00',196,'African American/Black'),(2075,'Eden','Aguirre','F','1999-08-14 00:00:00',298,'Latino or Hispanic'),(2118,'Bryce','Simpson','M','1993-04-22 00:00:00',233,'Prefer not to answer'),(2123,'Jacob','Montoya','M','1958-12-24 00:00:00',240,'American Indian or Alaska Native'),(2128,'Rick','Blake','M','2002-11-14 00:00:00',204,'African American/Black'),(2133,'Patty','Long','F','1999-05-06 00:00:00',284,'American Indian or Alaska Native'),(2136,'Luke','Snyder','M','1989-04-20 00:00:00',199,'White or Caucasian'),(2141,'Ryan','Walters','M','1968-04-06 00:00:00',163,'White or Caucasian'),(2150,'Kathy','Green','F','1964-05-22 00:00:00',118,'Pacific Islander or Hawaiian'),(2163,'Glora','Red','F','1998-10-13 00:00:00',201,'Asian'),(2170,'Shanna','Song','F','1969-07-07 00:00:00',133,'Asian'),(2173,'Alyssa','Cantrell','F','1961-08-14 00:00:00',177,'American Indian or Alaska Native'),(2189,'David','Hartley','M','1966-04-30 00:00:00',174,'White or Caucasian'),(2505,'Stanley','Yelnats','M','2022-12-12 00:00:00',9,'White or Caucasian');

INSERT INTO procedures VALUES (14060,'Adjacent tissue transfer, eyelids, nose, ears, lip','Plastic',120),(15773,'Liposuction','Plastic',180),(17110,'Removal of benign skin lesion','Plastic',60),(26045,'Fasciotomy, palmar, open','Orthopedics',90),(26356,'Flexor tendon repair','Orthopedics',90),(26735,'ORIF, phalangeal shaft fracture','Orthopedics',120),(27130,'Arthroplasty, hip','Orthopedics',120),(27445,'Arthroplasty, knee, hinge prothesis','Orthopedics',120),(28055,'Neurectomy, intrinsic musculature of foot','Podiatry',60),(28060,'Plantar fasciotomy','Podiatry',60),(28110,'Partial ostectomy, fifth metatarsal head','Podiatry',90),(28285,'Correction, hammertoe','Podiatry',60),(28289,'Hallux rigidus correction with cheilectomy','Podiatry',60),(28296,'Bunionectomy with distal osteotomy','Podiatry',120),(28297,'Lapidus bunionectomy','Podiatry',150),(28820,'Digital amputation, metatarsophalangeal joint','Vascular',60),(29877,'Arthroscopy, knee, surgical','Orthopedics',60),(30400,'Rhinoplasty','Plastic',120),(30520,'Septoplasty','ENT',90),(36901,'AV fistula','Vascular',75),(42826,'Tonsillectomy','ENT',60),(43775,'Sleeve gastrectomy','General',120),(47562,'Laparoscopic cholecystectomy','General',90),(52353,'Cystourethroscopy','Urology',60),(55250,'Vasectomy','Urology',60),(55873,'Cryosurgery of the prostate gland','Urology',90),(57460,'Cervical biopsy','OBGYN',75),(58562,'Hysterectomy, surgical','OBGYN',120),(64721,'Carpal tunnel release, open','Orthopedics',60),(66982,'Extracapsular cataract removal','Ophthalmology',45),(69421,'Myringotomy, general anesthesia','Pediatrics',60),(69436,'Tympanostomy, general anesthesia','Pediatrics',60);

INSERT INTO staff VALUES (1,'Rogers','John','Anesthesiologist','M','2010-02-04 00:00:00'),(2,'McCurdy','Sarah ','Anesthesiologist','F','2010-03-16 00:00:00'),(3,'Nesmith','Tracy','Scrub Tech','F','2010-05-05 00:00:00'),(4,'Ellington','Samantha','Nurse','F','2010-08-23 00:00:00'),(5,'Sanders','Edward','Nurse','M','2011-07-05 00:00:00'),(6,'King','Matthew','Nurse','M','2011-11-15 00:00:00'),(7,'White','Ryan','Anesthesiologist','M','2012-05-06 00:00:00'),(8,'Clews','Andrew','Scrub Tech','M','2012-08-25 00:00:00'),(9,'Traeger','Shelley','Scrub Tech','F','2012-10-15 00:00:00'),(10,'Burns','Daniel','Nurse','M','2013-07-11 00:00:00'),(11,'Garfinkel','Richard','Nurse','M','2013-09-05 00:00:00'),(12,'Liu','Amanda','Scrub Tech','F','2014-03-08 00:00:00'),(13,'Cosse','Sherry','Anesthesiologist','F','2014-04-20 00:00:00'),(14,'Attwood','Ashley','Scrub Tech','F','2015-02-21 00:00:00'),(15,'Bachar','Stephanie','Scrub Tech','F','2015-07-18 00:00:00'),(16,'Barnes','Rick','Anesthesiologist','M','2016-06-06 00:00:00'),(17,'Hoffman','Jose','Anesthesiologist','M','2016-08-15 00:00:00'),(18,'Gilley','Thomas','Scrub Tech','M','2016-10-20 00:00:00'),(19,'Wilson','Nancy','Scrub Tech','F','2017-01-15 00:00:00'),(20,'Bennett','Avery','Nurse','M','2017-04-25 00:00:00'),(21,'Taylor','David','Scrub Tech','M','2017-11-19 00:00:00'),(22,'Davidson','Mark','Nurse','M','2018-03-02 00:00:00'),(23,'Holstein','Sarah ','Anesthesiologist','F','2019-09-18 00:00:00'),(24,'Woods','Elaine','Nurse','F','2020-08-26 00:00:00'),(25,'Parks','Rebecca','Scrub Tech','F','2021-05-31 00:00:00'),(26,'Dorner','Brooke','Anesthesiologist','F','2021-06-15 00:00:00'),(27,'Evans','Dominique','Anesthesiologist','M','2021-09-22 00:00:00'),(28,'Jaeger','Kaitlin','Scrub Tech','F','2021-10-08 00:00:00');

INSERT INTO surgeon VALUES (1,'John','Anderson','Podiatry','M','1970-12-06 00:00:00','2015-07-05 00:00:00'),(2,'Deepti','Patel','Podiatry','F','1987-09-23 00:00:00','2021-03-19 00:00:00'),(3,'Douglas','Moore','Urology','M','1966-10-14 00:00:00','2005-06-14 00:00:00'),(4,'Franklin','Smith','Urology','M','1984-10-07 00:00:00','2016-04-03 00:00:00'),(5,'James','Arnold','Vascular','M','1958-02-09 00:00:00','2004-12-28 00:00:00'),
(6,'Anna','Nguyen','Vascular','F','1977-09-03 00:00:00','2011-07-26 00:00:00'),(7,'Rachel','Roberts','ENT','F','1988-08-12 00:00:00','2020-11-18 00:00:00'),(8,'Bei','Wan','ENT','F','1969-12-23 00:00:00','2007-12-13 00:00:00'),
(9,'Fred ','Gaines','General','M','1982-02-28 00:00:00','2013-07-26 00:00:00'),(10,'Meredith','Grey','General','F','1971-08-10 00:00:00','2017-09-14 00:00:00'),
(11,'Kai','Zhou','General','M','1961-10-22 00:00:00','1988-08-30 00:00:00'),(12,'Chiyoko','Fujikawa','General','F','1979-06-19 00:00:00','2012-12-13 00:00:00'),(13,'Eileen','McDuff','OBGYN','F','1974-07-05 00:00:00','2002-08-25 00:00:00'),
(14,'Song','Ma','OBGYN','M','1973-09-07 00:00:00','2015-06-12 00:00:00'),(15,'John','Guzek','Ophthalmology','M','1977-11-22 00:00:00','2008-09-20 00:00:00'),(16,'Emilio','Rodriguez','Ophthalmology','M','1986-04-03 00:00:00','2021-08-07 00:00:00'),
(17,'Callie','Torres','Orthopedics','F','1961-01-08 00:00:00','1997-09-08 00:00:00'),(18,'Maverik','Avery','Orthopedics','M','1974-07-15 00:00:00','2011-05-10 00:00:00'),(19,'Michelle ','Obama','Pediatrics','F','1963-03-21 00:00:00','2017-09-08 00:00:00'),(20,'Cindy','Herman','Pediatrics','F','1975-08-29 00:00:00','2011-03-28 00:00:00'),(21,'Chakshan','Reddy','Plastic','M','1985-04-03 00:00:00','2018-01-21 00:00:00'),(22,'Helen','OMalley','Plastic','F','1976-01-11 00:00:00','2014-11-13 00:00:00');


INSERT INTO surgery_event VALUES (10001,'2022-01-03',2133,1,'Podiatry',28110,'Partial ostectomy, fifth metatarsal head',1,18,6,16,90,3,1,'2022-01-03 07:00:00','2022-01-03 07:05:00','2022-01-03 07:32:00','2022-01-03 09:05:00','2022-01-03 09:17:00'),(10002,'2022-01-03',1481,1,'Podiatry',28055,'Neurectomy, intrinsic musculature of foot',1,18,6,16,60,1,2,'2022-01-03 08:45:00','2022-01-03 09:48:00','2022-01-03 10:13:00','2022-01-03 11:01:00','2022-01-03 11:12:00'),(10003,'2022-01-03',1909,1,'Podiatry',28297,'Lapidus bunionectomy',1,18,6,16,150,0,3,'2022-01-03 10:00:00','2022-01-03 11:50:00','2022-01-03 12:20:00','2022-01-03 12:42:00','2022-01-03 12:58:00'),(10004,'2022-01-03',1755,1,'Podiatry',28296,'Bunionectomy with distal osteotomy',1,18,6,16,120,0,1,'2022-01-03 12:45:00','2022-01-03 13:29:00','2022-01-03 13:53:00','2022-01-03 14:50:00','2022-01-03 15:02:00'),(10005,'2022-01-03',1516,2,'Orthopedics',27445,'Arthroplasty, knee, hinge prothesis',17,21,11,7,120,2,15,'2022-01-03 07:00:00','2022-01-03 07:15:00','2022-01-03 07:50:00','2022-01-03 09:38:00','2022-01-03 09:51:00'),(10006,'2022-01-03',1430,2,'Orthopedics',27445,'Arthroplasty, knee, hinge prothesis',17,21,11,7,120,4,16,'2022-01-03 09:15:00','2022-01-03 10:25:00','2022-01-03 11:00:00','2022-01-03 12:34:00','2022-01-03 12:52:00'),(10007,'2022-01-03',1779,3,'Ophthalmology',66982,'Extracapsular cataract removal',15,14,22,23,45,0,8,'2022-01-03 07:00:00','2022-01-03 07:03:00','2022-01-03 07:13:00','2022-01-03 07:31:00','2022-01-03 07:38:00'),(10008,'2022-01-03',1559,3,'Ophthalmology',66982,'Extracapsular cataract removal',15,14,22,23,45,0,9,'2022-01-03 08:00:00','2022-01-03 08:00:00','2022-01-03 08:12:00','2022-01-03 08:30:00','2022-01-03 08:41:00'),(10009,'2022-01-03',1931,3,'Ophthalmology',66982,'Extracapsular cataract removal',15,14,22,23,45,0,10,'2022-01-03 09:00:00','2022-01-03 09:04:00','2022-01-03 09:15:00','2022-01-03 09:30:00','2022-01-03 09:39:00'),(10010,'2022-01-03',1889,3,'Ophthalmology',66982,'Extracapsular cataract removal',15,14,22,23,45,0,8,'2022-01-03 10:00:00','2022-01-03 10:01:00','2022-01-03 10:12:00','2022-01-03 10:26:00','2022-01-03 10:34:00'),(10011,'2022-01-03',2173,3,'Ophthalmology',66982,'Extracapsular cataract removal',15,14,22,23,45,0,9,'2022-01-03 11:00:00','2022-01-03 10:56:00','2022-01-03 11:06:00','2022-01-03 11:20:00','2022-01-03 11:28:00'),(10012,'2022-01-03',1099,3,'Ophthalmology',66982,'Extracapsular cataract removal',15,14,22,23,45,0,10,'2022-01-03 12:00:00','2022-01-03 11:49:00','2022-01-03 12:00:00','2022-01-03 12:20:00','2022-01-03 12:30:00'),(10013,'2022-01-03',1086,3,'Ophthalmology',66982,'Extracapsular cataract removal',15,14,22,23,45,0,8,'2022-01-03 13:00:00','2022-01-03 12:55:00','2022-01-03 13:06:00','2022-01-03 13:20:00','2022-01-03 13:29:00'),(10014,'2022-01-03',1213,3,'Ophthalmology',66982,'Extracapsular cataract removal',15,14,22,23,45,0,9,'2022-01-03 14:00:00','2022-01-03 13:50:00','2022-01-03 14:02:00','2022-01-03 14:20:00','2022-01-03 14:29:00'),(10015,'2022-01-03',1027,4,'OBGYN',58562,'Hysterectomy, surgical',13,19,10,27,120,0,11,'2022-01-03 07:00:00','2022-01-03 07:03:00','2022-01-03 07:23:00','2022-01-03 08:40:00','2022-01-03 08:54:00'),(10016,'2022-01-03',1171,4,'OBGYN',57460,'Cervical biopsy',13,19,10,27,75,0,12,'2022-01-03 09:15:00','2022-01-03 09:28:00','2022-01-03 09:53:00','2022-01-03 10:28:00','2022-01-03 10:42:00'),(10017,'2022-01-03',1981,4,'OBGYN',58562,'Hysterectomy, surgical',13,19,10,27,120,0,11,'2022-01-03 10:45:00','2022-01-03 11:18:00','2022-01-03 11:41:00','2022-01-03 12:58:00','2022-01-03 13:10:00'),(10018,'2022-01-03',2118,4,'OBGYN',57460,'Cervical biopsy',13,19,10,27,75,0,12,'2022-01-03 13:00:00','2022-01-03 13:39:00','2022-01-03 14:04:00','2022-01-03 14:36:00','2022-01-03 14:49:00'),(10019,'2022-01-03',2008,5,'Urology',55250,'Vasectomy',4,9,24,1,60,0,21,'2022-01-03 07:00:00','2022-01-03 07:08:00','2022-01-03 07:20:00','2022-01-03 07:59:00','2022-01-03 08:10:00'),(10020,'2022-01-03',2189,5,'Urology',55873,'Cryosurgery of the prostate gland',3,9,24,1,90,0,22,'2022-01-03 08:15:00','2022-01-03 08:39:00','2022-01-03 09:02:00','2022-01-03 10:08:00','2022-01-03 10:23:00'),(10021,'2022-01-03',2123,5,'Urology',52353,'Cystourethroscopy',3,9,24,1,60,0,21,'2022-01-03 10:00:00','2022-01-03 10:56:00','2022-01-03 11:20:00','2022-01-03 11:48:00','2022-01-03 12:02:00'),(10022,'2022-01-03',1705,5,'Urology',55250,'Vasectomy',4,9,24,1,60,0,22,'2022-01-03 11:15:00','2022-01-03 12:45:00','2022-01-03 13:12:00','2022-01-03 13:40:00','2022-01-03 13:53:00'),(10023,'2022-01-03',1013,6,'Plastic',15773,'Liposuction',21,25,5,13,180,0,25,'2022-01-03 07:00:00','2022-01-03 07:28:00','2022-01-03 07:48:00','2022-01-03 09:36:00','2022-01-03 09:49:00'),(10024,'2022-01-03',2043,6,'Plastic',15773,'Liposuction',21,25,5,13,180,0,26,'2022-01-03 10:15:00','2022-01-03 10:22:00','2022-01-03 10:44:00','2022-01-03 13:00:00','2022-01-03 13:15:00'),(10025,'2022-01-03',1918,6,'Plastic',30400,'Rhinoplasty',22,25,5,13,120,0,27,'2022-01-03 13:30:00','2022-01-03 13:44:00','2022-01-03 14:10:00','2022-01-03 15:22:00','2022-01-03 15:35:00'),(10026,'2022-01-03',1741,7,'Vascular',28820,'Digital amputation, metatarsophalangeal joint',5,8,20,17,60,0,30,'2022-01-03 07:00:00','2022-01-03 07:10:00','2022-01-03 07:25:00','2022-01-03 07:55:00','2022-01-03 08:08:00'),(10027,'2022-01-03',2025,7,'Vascular',28820,'Digital amputation, metatarsophalangeal joint',5,8,20,17,60,0,31,'2022-01-03 08:15:00','2022-01-03 08:38:00','2022-01-03 09:03:00','2022-01-03 09:39:00','2022-01-03 09:52:00'),(10028,'2022-01-03',1856,7,'Vascular',36901,'AV fistula',5,8,20,17,75,0,30,'2022-01-03 09:30:00','2022-01-03 10:20:00','2022-01-03 10:48:00','2022-01-03 11:40:00','2022-01-03 11:54:00'),(10029,'2022-01-03',2028,7,'Vascular',36901,'AV fistula',5,8,20,17,75,0,31,'2022-01-03 11:00:00','2022-01-03 12:36:00','2022-01-03 13:00:00','2022-01-03 13:58:00','2022-01-03 14:12:00'),(10030,'2022-01-03',1121,7,'Vascular',36901,'AV fistula',5,8,20,17,75,0,30,'2022-01-03 12:30:00','2022-01-03 14:34:00','2022-01-03 14:52:00','2022-01-03 15:42:00','2022-01-03 15:54:00'),(10031,'2022-01-03',1506,8,'General',43775,'Sleeve gastrectomy',10,15,4,2,120,0,32,'2022-01-03 07:00:00','2022-01-03 07:06:00','2022-01-03 07:28:00','2022-01-03 09:08:00','2022-01-03 09:23:00'),(10032,'2022-01-03',1763,8,'General',43775,'Sleeve gastrectomy',10,15,4,2,120,0,33,'2022-01-03 09:15:00','2022-01-03 09:50:00','2022-01-03 10:08:00','2022-01-03 11:40:00','2022-01-03 11:52:00'),(10033,'2022-01-03',2150,8,'General',47562,'Laparoscopic cholecystectomy',10,15,4,2,90,0,32,'2022-01-03 11:30:00','2022-01-03 12:30:00','2022-01-03 12:49:00','2022-01-03 13:37:00','2022-01-03 13:50:00'),(10034,'2022-01-04',1850,1,'Podiatry',28296,'Bunionectomy with distal osteotomy',2,18,6,23,120,0,1,'2022-01-04 07:00:00','2022-01-04 07:06:00','2022-01-04 07:28:00','2022-01-04 09:05:00','2022-01-04 09:18:00'),(10035,'2022-01-04',1680,1,'Podiatry',28289,'Hallux rigidus correction with cheilectomy',2,18,6,23,60,0,6,'2022-01-04 09:15:00','2022-01-04 09:53:00','2022-01-04 10:18:00','2022-01-04 11:00:00','2022-01-04 11:10:00'),(10036,'2022-01-04',2163,1,'Podiatry',28296,'Bunionectomy with distal osteotomy',2,18,6,23,120,0,2,'2022-01-04 10:30:00','2022-01-04 11:43:00','2022-01-04 12:10:00','2022-01-04 13:40:00','2022-01-04 13:59:00'),(10037,'2022-01-04',2014,2,'Orthopedics',29877,'Arthroscopy, knee, surgical',18,21,11,7,60,0,15,'2022-01-04 07:00:00','2022-01-04 07:15:00','2022-01-04 07:45:00','2022-01-04 08:15:00','2022-01-04 08:27:00'),(10038,'2022-01-04',1493,2,'Orthopedics',29877,'Arthroscopy, knee, surgical',18,21,11,7,60,0,16,'2022-01-04 08:15:00','2022-01-04 08:59:00','2022-01-04 09:24:00','2022-01-04 10:00:00','2022-01-04 10:15:00'),(10039,'2022-01-04',1021,2,'Orthopedics',29877,'Arthroscopy, knee, surgical',18,21,11,7,60,0,15,'2022-01-04 09:30:00','2022-01-04 10:48:00','2022-01-04 11:12:00','2022-01-04 11:48:00','2022-01-04 12:01:00'),(10040,'2022-01-04',1384,2,'Orthopedics',29877,'Arthroscopy, knee, surgical',18,21,11,7,60,0,16,'2022-01-04 10:45:00','2022-01-04 12:41:00','2022-01-04 13:08:00','2022-01-04 13:48:00','2022-01-04 14:03:00'),(10041,'2022-01-04',1509,2,'Orthopedics',29877,'Arthroscopy, knee, surgical',18,21,11,7,60,0,15,'2022-01-04 11:00:00','2022-01-04 14:30:00','2022-01-04 14:50:00','2022-01-04 15:21:00','2022-01-04 15:33:00'),(10042,'2022-01-04',1923,3,'Ophthalmology',66982,'Extracapsular cataract removal',16,14,22,16,45,0,8,'2022-01-04 07:00:00','2022-01-04 07:03:00','2022-01-04 07:13:00','2022-01-04 07:31:00','2022-01-04 07:38:00'),(10043,'2022-01-04',1386,3,'Ophthalmology',66982,'Extracapsular cataract removal',16,14,22,16,45,0,9,'2022-01-04 08:00:00','2022-01-04 08:00:00','2022-01-04 08:12:00','2022-01-04 08:30:00','2022-01-04 08:41:00'),(10044,'2022-01-04',1082,3,'Ophthalmology',66982,'Extracapsular cataract removal',16,14,22,16,45,0,10,'2022-01-04 09:00:00','2022-01-04 09:04:00','2022-01-04 09:15:00','2022-01-04 09:30:00','2022-01-04 09:39:00'),(10045,'2022-01-04',2136,3,'Ophthalmology',66982,'Extracapsular cataract removal',16,14,22,16,45,0,8,'2022-01-04 10:00:00','2022-01-04 10:01:00','2022-01-04 10:12:00','2022-01-04 10:26:00','2022-01-04 10:34:00'),(10046,'2022-01-04',1593,3,'Ophthalmology',66982,'Extracapsular cataract removal',16,14,22,16,45,0,9,'2022-01-04 11:00:00','2022-01-04 10:56:00','2022-01-04 11:06:00','2022-01-04 11:20:00','2022-01-04 11:28:00'),(10047,'2022-01-04',1523,3,'Ophthalmology',66982,'Extracapsular cataract removal',16,14,22,16,45,0,10,'2022-01-04 12:00:00','2022-01-04 11:49:00','2022-01-04 12:00:00','2022-01-04 12:20:00','2022-01-04 12:30:00'),(10048,'2022-01-04',1806,3,'Ophthalmology',66982,'Extracapsular cataract removal',16,14,22,16,45,0,8,'2022-01-04 13:00:00','2022-01-04 12:55:00','2022-01-04 13:06:00','2022-01-04 13:20:00','2022-01-04 13:29:00'),(10049,'2022-01-04',1060,3,'Ophthalmology',66982,'Extracapsular cataract removal',16,14,22,16,45,0,9,'2022-01-04 14:00:00','2022-01-04 13:50:00','2022-01-04 14:02:00','2022-01-04 14:20:00','2022-01-04 14:29:00'),(10050,'2022-01-04',1265,4,'OBGYN',58562,'Hysterectomy, surgical',14,15,10,26,120,0,11,'2022-01-04 07:00:00','2022-01-04 07:03:00','2022-01-04 07:23:00','2022-01-04 08:40:00','2022-01-04 08:54:00'),(10051,'2022-01-04',1248,4,'OBGYN',57460,'Cervical biopsy',14,15,10,26,75,0,12,'2022-01-04 09:15:00','2022-01-04 09:28:00','2022-01-04 09:53:00','2022-01-04 10:28:00','2022-01-04 10:42:00'),(10052,'2022-01-04',1769,4,'OBGYN',58562,'Hysterectomy, surgical',14,15,10,26,120,0,11,'2022-01-04 10:45:00','2022-01-04 11:18:00','2022-01-04 11:41:00','2022-01-04 12:58:00','2022-01-04 13:10:00'),(10053,'2022-01-04',1738,4,'OBGYN',57460,'Cervical biopsy',14,15,10,26,75,0,12,'2022-01-04 13:00:00','2022-01-04 13:39:00','2022-01-04 14:04:00','2022-01-04 14:36:00','2022-01-04 14:49:00'),(10054,'2022-01-04',1058,5,'ENT',42826,'Tonsillectomy',7,28,24,17,60,0,35,'2022-01-04 07:00:00','2022-01-04 07:04:00','2022-01-04 07:24:00','2022-01-04 07:49:00','2022-01-04 08:00:00'),(10055,'2022-01-04',1840,5,'ENT',30520,'Septoplasty',7,28,24,17,90,0,27,'2022-01-04 08:15:00','2022-01-04 08:30:00','2022-01-04 08:48:00','2022-01-04 09:40:00','2022-01-04 09:53:00'),(10056,'2022-01-04',2075,5,'ENT',30520,'Septoplasty',7,28,24,17,90,0,37,'2022-01-04 10:00:00','2022-01-04 10:20:00','2022-01-04 10:45:00','2022-01-04 11:38:00','2022-01-04 11:49:00'),(10057,'2022-01-04',1905,5,'ENT',42826,'Tonsillectomy',8,28,24,17,60,0,36,'2022-01-04 11:45:00','2022-01-04 12:30:00','2022-01-04 12:54:00','2022-01-04 13:26:00','2022-01-04 13:38:00'),(10058,'2022-01-04',1889,5,'ENT',42826,'Tonsillectomy',8,28,24,17,60,0,35,'2022-01-04 13:00:00','2022-01-04 14:05:00','2022-01-04 14:28:00','2022-01-04 15:00:00','2022-01-04 15:10:00'),(10059,'2022-01-04',1898,6,'Plastic',17110,'Removal of benign skin lesion',21,19,5,2,60,0,25,'2022-01-04 07:00:00','2022-01-04 07:04:00','2022-01-04 07:20:00','2022-01-04 07:54:00','2022-01-04 08:05:00'),(10060,'2022-01-04',1415,6,'Plastic',17110,'Removal of benign skin lesion',21,19,5,2,60,0,26,'2022-01-04 08:15:00','2022-01-04 08:34:00','2022-01-04 08:52:00','2022-01-04 09:18:00','2022-01-04 09:29:00'),(10061,'2022-01-04',1921,6,'Plastic',17110,'Removal of benign skin lesion',21,19,5,2,60,0,38,'2022-01-04 09:30:00','2022-01-04 09:55:00','2022-01-04 10:20:00','2022-01-04 10:58:00','2022-01-04 11:08:00'),(10062,'2022-01-04',1505,6,'Plastic',14060,'Adjacent tissue transfer, eyelids, nose, ears, lip',22,19,5,2,120,2,25,'2022-01-04 10:45:00','2022-01-04 11:36:00','2022-01-04 12:00:00','2022-01-04 13:45:00','2022-01-04 14:00:00'),(10063,'2022-01-04',1220,7,'Pediatrics',69436,'Tympanostomy, general anesthesia',20,3,20,13,60,0,39,'2022-01-04 07:00:00','2022-01-04 07:10:00','2022-01-04 07:35:00','2022-01-04 08:05:00','2022-01-04 08:18:00'),(10064,'2022-01-04',1481,7,'Pediatrics',69436,'Tympanostomy, general anesthesia',20,3,20,13,60,0,40,'2022-01-04 08:15:00','2022-01-04 08:40:00','2022-01-04 09:00:00','2022-01-04 09:34:00','2022-01-04 09:48:00'),(10065,'2022-01-04',1129,7,'Pediatrics',69436,'Tympanostomy, general anesthesia',20,3,20,13,60,0,41,'2022-01-04 09:30:00','2022-01-04 10:12:00','2022-01-04 10:40:00','2022-01-04 11:12:00','2022-01-04 11:26:00'),(10066,'2022-01-04',1334,7,'Pediatrics',69421,'Myringotomy, general anesthesia',19,3,20,13,60,0,39,'2022-01-04 10:45:00','2022-01-04 11:59:00','2022-01-04 12:11:00','2022-01-04 12:39:00','2022-01-04 12:51:00'),(10067,'2022-01-04',2170,7,'Pediatrics',69421,'Myringotomy, general anesthesia',19,3,20,13,60,0,40,'2022-01-04 12:00:00','2022-01-04 13:20:00','2022-01-04 13:47:00','2022-01-04 14:14:00','2022-01-04 14:28:00'),(10068,'2022-01-04',2141,8,'Orthopedics',27445,'Arthroplasty, knee, hinge prothesis',17,9,4,1,120,0,15,'2022-01-04 07:00:00','2022-01-04 07:06:00','2022-01-04 07:45:00','2022-01-04 09:06:00','2022-01-04 09:18:00'),(10069,'2022-01-04',1559,8,'Orthopedics',27445,'Arthroplasty, knee, hinge prothesis',17,9,4,1,120,0,16,'2022-01-04 09:15:00','2022-01-04 09:40:00','2022-01-04 10:15:00','2022-01-04 11:40:00','2022-01-04 12:01:00'),(10070,'2022-01-04',1493,8,'Orthopedics',27130,'Arthroplasty, hip',17,9,4,1,120,0,17,'2022-01-04 11:30:00','2022-01-04 12:40:00','2022-01-04 13:12:00','2022-01-04 14:40:00','2022-01-04 14:58:00'),(10071,'2022-01-05',1510,1,'Podiatry',28060,'Plantar fasciotomy',2,12,6,2,60,0,6,'2022-01-05 07:00:00','2022-01-05 07:04:00','2022-01-05 07:28:00','2022-01-05 08:05:00','2022-01-05 08:18:00'),(10072,'2022-01-05',1664,1,'Podiatry',28060,'Plantar fasciotomy',2,12,6,2,60,0,7,'2022-01-05 08:15:00','2022-01-05 08:53:00','2022-01-05 09:18:00','2022-01-05 09:50:00','2022-01-05 10:02:00'),(10073,'2022-01-05',1720,1,'Podiatry',28285,'Correction, hammertoe',1,12,6,2,60,0,6,'2022-01-05 09:30:00','2022-01-05 10:37:00','2022-01-05 11:00:00','2022-01-05 11:40:00','2022-01-05 12:00:00'),(10074,'2022-01-05',1723,1,'Podiatry',28285,'Correction, hammertoe',1,12,6,2,60,0,7,'2022-01-05 11:45:00','2022-01-05 12:38:00','2022-01-05 13:00:00','2022-01-05 13:50:00','2022-01-05 14:02:00'),(10075,'2022-01-05',1618,2,'Orthopedics',64721,'Carpal tunnel release, open',18,21,4,23,60,0,42,'2022-01-05 07:00:00','2022-01-05 07:05:00','2022-01-05 07:28:00','2022-01-05 08:05:00','2022-01-05 08:17:00'),(10076,'2022-01-05',1886,2,'Orthopedics',64721,'Carpal tunnel release, open',18,21,4,23,60,0,43,'2022-01-05 08:15:00','2022-01-05 08:42:00','2022-01-05 09:04:00','2022-01-05 09:38:00','2022-01-05 09:50:00'),(10077,'2022-01-05',1919,2,'Orthopedics',26045,'Fasciotomy, palmar, open',18,21,4,23,90,0,44,'2022-01-05 09:30:00','2022-01-05 10:28:00','2022-01-05 10:52:00','2022-01-05 11:48:00','2022-01-05 12:02:00'),(10078,'2022-01-05',1288,2,'Orthopedics',26735,'ORIF, phalangeal shaft fracture',17,21,4,23,120,0,42,'2022-01-05 11:15:00','2022-01-05 12:38:00','2022-01-05 12:59:00','2022-01-05 14:23:00','2022-01-05 14:40:00'),(10079,'2022-01-05',1572,2,'Orthopedics',26356,'Flexor tendon repair',17,21,4,23,90,0,43,'2022-01-05 13:30:00','2022-01-05 15:13:00','2022-01-05 15:34:00','2022-01-05 16:21:00','2022-01-05 16:40:00'),(10080,'2022-01-05',1229,3,'Pediatrics',69436,'Tympanostomy, general anesthesia',20,3,20,16,60,0,39,'2022-01-05 07:00:00','2022-01-05 07:10:00','2022-01-05 07:35:00','2022-01-05 08:05:00','2022-01-05 08:18:00'),(10081,'2022-01-05',1531,3,'Pediatrics',69436,'Tympanostomy, general anesthesia',20,3,20,16,60,0,40,'2022-01-05 08:15:00','2022-01-05 08:40:00','2022-01-05 09:00:00','2022-01-05 09:34:00','2022-01-05 09:48:00'),(10082,'2022-01-05',1497,3,'Pediatrics',69436,'Tympanostomy, general anesthesia',20,3,20,16,60,0,41,'2022-01-05 09:30:00','2022-01-05 10:12:00','2022-01-05 10:40:00','2022-01-05 11:12:00','2022-01-05 11:26:00'),(10083,'2022-01-05',1631,3,'Pediatrics',69421,'Myringotomy, general anesthesia',19,3,20,16,60,0,39,'2022-01-05 10:45:00','2022-01-05 11:59:00','2022-01-05 12:11:00','2022-01-05 12:39:00','2022-01-05 12:51:00'),(10084,'2022-01-05',1095,3,'Pediatrics',69421,'Myringotomy, general anesthesia',19,3,20,16,60,0,40,'2022-01-05 12:00:00','2022-01-05 13:20:00','2022-01-05 13:47:00','2022-01-05 14:14:00','2022-01-05 14:28:00'),(10085,'2022-01-05',1767,4,'Urology',55250,'Vasectomy',4,25,24,17,60,0,21,'2022-01-05 07:00:00','2022-01-05 07:08:00','2022-01-05 07:20:00','2022-01-05 07:59:00','2022-01-05 08:10:00'),(10086,'2022-01-05',1759,4,'Urology',55873,'Cryosurgery of the prostate gland',3,25,24,17,90,0,22,'2022-01-05 08:15:00','2022-01-05 08:39:00','2022-01-05 09:02:00','2022-01-05 10:08:00','2022-01-05 10:23:00'),(10087,'2022-01-05',1108,4,'Urology',52353,'Cystourethroscopy',3,25,24,17,60,0,21,'2022-01-05 10:00:00','2022-01-05 10:56:00','2022-01-05 11:20:00','2022-01-05 11:40:00','2022-01-05 11:50:00'),(10088,'2022-01-05',1365,4,'Urology',55250,'Vasectomy',4,25,24,17,60,0,22,'2022-01-05 11:15:00','2022-01-05 12:35:00','2022-01-05 13:00:00','2022-01-05 13:30:00','2022-01-05 13:43:00'),(10089,'2022-01-05',1322,4,'Urology',52353,'Cystourethroscopy',3,25,24,17,60,0,21,'2022-01-05 12:30:00','2022-01-05 14:16:00','2022-01-05 14:38:00','2022-01-05 15:00:00','2022-01-05 15:12:00'),(10090,'2022-01-05',1871,5,'ENT',42826,'Tonsillectomy',8,28,11,1,60,0,35,'2022-01-05 07:00:00','2022-01-05 07:01:00','2022-01-05 07:22:00','2022-01-05 07:50:00','2022-01-05 08:06:00'),(10091,'2022-01-05',1468,5,'ENT',42826,'Tonsillectomy',8,28,11,1,60,0,36,'2022-01-05 08:15:00','2022-01-05 08:37:00','2022-01-05 09:00:00','2022-01-05 09:27:00','2022-01-05 09:40:00'),(10092,'2022-01-05',1709,5,'ENT',42826,'Tonsillectomy',8,28,11,1,60,0,35,'2022-01-05 09:30:00','2022-01-05 10:12:00','2022-01-05 10:36:00','2022-01-05 11:00:00','2022-01-05 11:13:00'),(10093,'2022-01-05',1236,5,'ENT',42826,'Tonsillectomy',8,28,11,1,60,0,36,'2022-01-05 10:45:00','2022-01-05 11:40:00','2022-01-05 12:07:00','2022-01-05 12:37:00','2022-01-05 12:50:00'),(10094,'2022-01-05',1118,6,'Plastic',14060,'Adjacent tissue transfer, eyelids, nose, ears, lip',22,19,5,13,120,0,25,'2022-01-05 07:00:00','2022-01-05 07:06:00','2022-01-05 07:28:00','2022-01-05 08:36:00','2022-01-05 08:50:00'),(10095,'2022-01-05',2128,6,'Plastic',14060,'Adjacent tissue transfer, eyelids, nose, ears, lip',22,19,5,13,120,0,26,'2022-01-05 09:15:00','2022-01-05 09:22:00','2022-01-05 09:45:00','2022-01-05 10:40:00','2022-01-05 10:55:00'),(10096,'2022-01-05',1328,6,'Plastic',14060,'Adjacent tissue transfer, eyelids, nose, ears, lip',22,19,5,13,120,0,25,'2022-01-05 11:30:00','2022-01-05 11:28:00','2022-01-05 11:49:00','2022-01-05 13:00:00','2022-01-05 13:12:00'),(10097,'2022-01-05',1291,7,'Vascular',28820,'Digital amputation, metatarsophalangeal joint',6,14,10,26,60,0,30,'2022-01-05 07:00:00','2022-01-05 07:04:00','2022-01-05 07:25:00','2022-01-05 07:55:00','2022-01-05 08:08:00'),(10098,'2022-01-05',1808,7,'Vascular',28820,'Digital amputation, metatarsophalangeal joint',6,14,10,26,60,0,31,'2022-01-05 08:15:00','2022-01-05 08:38:00','2022-01-05 09:03:00','2022-01-05 09:39:00','2022-01-05 09:52:00'),(10099,'2022-01-05',1431,7,'Vascular',36901,'AV fistula',6,14,10,26,75,0,30,'2022-01-05 09:30:00','2022-01-05 10:20:00','2022-01-05 10:48:00','2022-01-05 11:40:00','2022-01-05 11:54:00');
