CREATE DATABASE company;

USE company;
 
CREATE TABLE employees (
no INT NOT NULL,
dob DATE NOT NULL,
first_name VARCHAR(14) NOT NULL,
last_name VARCHAR(16) NOT NULL,
gender ENUM ('M','F') NOT NULL,
hire_date DATE NOT NULL,
PRIMARY KEY (no)
);

INSERT INTO employees (no,dob,first_name,last_name,gender,hire_date) VALUES (1011,'1985-09-02','Chava','Puckett','F','2008-10-12');
INSERT INTO employees (no,dob,first_name,last_name,gender,hire_date) VALUES (1012,'1971-12-03','Christopher','Tillman','M','2006-11-01');
INSERT INTO employees (no,dob,first_name,last_name,gender,hire_date) VALUES (1013,'1975-07-31','Judith','David','F','10-11-20');
INSERT INTO employees (no,dob,first_name,last_name,gender,hire_date) VALUES (1014,'1957-08-03','Neil','Ford','F','08-09-04');
INSERT INTO employees (no,dob,first_name,last_name,gender,hire_date) VALUES (1015,'1977-01-09','Daryl','Wolfe','M','07-09-14');
INSERT INTO employees (no,dob,first_name,last_name,gender,hire_date) VALUES (1016,'1986-03-08','Maryam','Burt','M','09-09-16');
INSERT INTO employees (no,dob,first_name,last_name,gender,hire_date) VALUES (1017,'1980-08-21','Marny','Alvarez','M','11-01-27');
INSERT INTO employees (no,dob,first_name,last_name,gender,hire_date) VALUES (1018,'1965-04-06','Wanda','Fowler','M','08-02-09');
INSERT INTO employees (no,dob,first_name,last_name,gender,hire_date) VALUES (1019,'1950-02-14','Lillian','Hancock','F','05-11-22');
INSERT INTO employees (no,dob,first_name,last_name,gender,hire_date) VALUES (1020,'1965-11-17','Tatyana','Lucas','M','09-02-16');
INSERT INTO employees (no,dob,first_name,last_name,gender,hire_date) VALUES (1021,'1973-03-13','Rooney','Sears','M','05-09-07');
INSERT INTO employees (no,dob,first_name,last_name,gender,hire_date) VALUES (1022,'1974-11-23','Ezekiel','Harding','M','10-07-02');
INSERT INTO employees (no,dob,first_name,last_name,gender,hire_date) VALUES (1023,'1961-01-26','Willa','Swanson','F','12-10-24');
INSERT INTO employees (no,dob,first_name,last_name,gender,hire_date) VALUES (1024,'1948-01-24','Eden','Mcclure','F','09-02-13');
INSERT INTO employees (no,dob,first_name,last_name,gender,hire_date) VALUES (1025,'1951-10-31','Maris','Serrano','F','11-10-04');
INSERT INTO employees (no,dob,first_name,last_name,gender,hire_date) VALUES (1026,'1972-11-11','Kyle','Jordan','M','12-10-22');
INSERT INTO employees (no,dob,first_name,last_name,gender,hire_date) VALUES (1027,'1953-10-06','Jolie','Burton','M','06-06-11');
INSERT INTO employees (no,dob,first_name,last_name,gender,hire_date) VALUES (1028,'1970-11-22','Alyssa','Black','M','11-11-10');
INSERT INTO employees (no,dob,first_name,last_name,gender,hire_date) VALUES (1029,'1952-05-23','Rahim','Noel','F','10-08-13');
INSERT INTO employees (no,dob,first_name,last_name,gender,hire_date) VALUES (1030,'1979-03-07','Roth','May','M','12-06-04');
INSERT INTO employees (no,dob,first_name,last_name,gender,hire_date) VALUES (1031,'1961-08-07','Mira','Harding','M','08-02-04');
INSERT INTO employees (no,dob,first_name,last_name,gender,hire_date) VALUES (1032,'1957-04-07','Helen','Pacheco','F','07-11-17');
INSERT INTO employees (no,dob,first_name,last_name,gender,hire_date) VALUES (1033,'1960-08-11','Evangeline','Mullen','M','13-01-25');
INSERT INTO employees (no,dob,first_name,last_name,gender,hire_date) VALUES (1034,'1971-08-07','Isadora','Walsh','F','09-07-02');
INSERT INTO employees (no,dob,first_name,last_name,gender,hire_date) VALUES (1035,'1979-02-25','Sybil','Mccarty','F','10-06-15');
INSERT INTO employees (no,dob,first_name,last_name,gender,hire_date) VALUES (1036,'1989-08-23','Emma','Cardenas','M','10-01-16');
INSERT INTO employees (no,dob,first_name,last_name,gender,hire_date) VALUES (1037,'1965-03-18','Seth','Monroe','M','06-10-16');
INSERT INTO employees (no,dob,first_name,last_name,gender,hire_date) VALUES (1038,'1954-03-21','Herrod','Noel','M','10-07-07');
INSERT INTO employees (no,dob,first_name,last_name,gender,hire_date) VALUES (1039,'1963-09-06','Devin','Howard','M','11-12-18');
INSERT INTO employees (no,dob,first_name,last_name,gender,hire_date) VALUES (1040,'1989-05-25','Kaden','Ellis','F','10-12-07');
INSERT INTO employees (no,dob,first_name,last_name,gender,hire_date) VALUES (1041,'1966-02-21','Emery','Walters','M','07-05-07');
INSERT INTO employees (no,dob,first_name,last_name,gender,hire_date) VALUES (1042,'1957-11-15','Tyrone','Gill','F','12-07-24');
INSERT INTO employees (no,dob,first_name,last_name,gender,hire_date) VALUES (1043,'1957-06-20','Uriah','Morse','M','12-04-22');
INSERT INTO employees (no,dob,first_name,last_name,gender,hire_date) VALUES (1044,'1976-11-15','Ross','Bradford','M','08-11-14');
INSERT INTO employees (no,dob,first_name,last_name,gender,hire_date) VALUES (1045,'1964-05-04','Elton','Wilkins','F','10-12-21');
INSERT INTO employees (no,dob,first_name,last_name,gender,hire_date) VALUES (1046,'1948-06-07','Lillith','Estes','M','08-04-12');
INSERT INTO employees (no,dob,first_name,last_name,gender,hire_date) VALUES (1047,'1960-04-04','Hayfa','Burch','F','06-09-25');
INSERT INTO employees (no,dob,first_name,last_name,gender,hire_date) VALUES (1048,'1966-02-26','Erin','Lane','M','05-03-01');
INSERT INTO employees (no,dob,first_name,last_name,gender,hire_date) VALUES (1049,'1985-08-23','Ella','Robinson','F','06-03-11');
INSERT INTO employees (no,dob,first_name,last_name,gender,hire_date) VALUES (1050,'1967-04-19','Wayne','Fischer','M','07-05-24');
INSERT INTO employees (no,dob,first_name,last_name,gender,hire_date) VALUES (1051,'1970-11-07','Channing','Mccoy','M','06-05-27');
INSERT INTO employees (no,dob,first_name,last_name,gender,hire_date) VALUES (1052,'1993-07-07','Rhonda','Kirby','M','06-05-19');
INSERT INTO employees (no,dob,first_name,last_name,gender,hire_date) VALUES (1053,'1978-06-04','Brenda','Hodge','M','06-05-09');
INSERT INTO employees (no,dob,first_name,last_name,gender,hire_date) VALUES (1054,'1959-10-27','Barbara','Dixon','M','12-12-05');
INSERT INTO employees (no,dob,first_name,last_name,gender,hire_date) VALUES (1055,'1949-04-28','Zephr','Lindsey','M','09-02-16');
INSERT INTO employees (no,dob,first_name,last_name,gender,hire_date) VALUES (1056,'1977-08-30','Joan','Campbell','M','12-10-14');
INSERT INTO employees (no,dob,first_name,last_name,gender,hire_date) VALUES (1057,'1957-04-14','Breanna','Leblanc','F','07-12-29');
INSERT INTO employees (no,dob,first_name,last_name,gender,hire_date) VALUES (1058,'1983-01-15','Hanna','Shaffer','M','11-04-12');
INSERT INTO employees (no,dob,first_name,last_name,gender,hire_date) VALUES (1059,'1966-01-15','Felicia','Burt','F','11-11-16');
INSERT INTO employees (no,dob,first_name,last_name,gender,hire_date) VALUES (1060,'1963-10-16','Nevada','Blackburn','M','07-08-10');
INSERT INTO employees (no,dob,first_name,last_name,gender,hire_date) VALUES (1061,'1961-12-26','Germane','Duncan','F','09-05-31');
INSERT INTO employees (no,dob,first_name,last_name,gender,hire_date) VALUES (1062,'1974-03-18','Vladimir','Becker','M','09-12-10');
INSERT INTO employees (no,dob,first_name,last_name,gender,hire_date) VALUES (1063,'1965-03-04','Stephen','Clarke','F','09-06-25');
INSERT INTO employees (no,dob,first_name,last_name,gender,hire_date) VALUES (1064,'1968-10-18','Jackson','Edwards','F','11-03-02');
INSERT INTO employees (no,dob,first_name,last_name,gender,hire_date) VALUES (1065,'1959-05-16','Brent','Dunn','M','08-01-26');
INSERT INTO employees (no,dob,first_name,last_name,gender,hire_date) VALUES (1066,'1971-10-21','Quentin','Puckett','F','08-09-15');
INSERT INTO employees (no,dob,first_name,last_name,gender,hire_date) VALUES (1067,'1950-09-26','Mona','Sosa','M','07-11-27');
INSERT INTO employees (no,dob,first_name,last_name,gender,hire_date) VALUES (1068,'1977-10-01','Nola','Dillard','F','06-10-17');
INSERT INTO employees (no,dob,first_name,last_name,gender,hire_date) VALUES (1069,'1956-08-04','Destiny','Maldonado','M','11-05-07');
INSERT INTO employees (no,dob,first_name,last_name,gender,hire_date) VALUES (1070,'1974-07-03','Levi','Dunn','M','11-12-13');
INSERT INTO employees (no,dob,first_name,last_name,gender,hire_date) VALUES (1071,'1987-09-15','Colleen','Mcpherson','M','05-02-05');
INSERT INTO employees (no,dob,first_name,last_name,gender,hire_date) VALUES (1072,'1952-12-11','Igor','Macias','M','11-10-11');
INSERT INTO employees (no,dob,first_name,last_name,gender,hire_date) VALUES (1073,'1984-07-04','Brooke','Hodge','F','06-06-22');
INSERT INTO employees (no,dob,first_name,last_name,gender,hire_date) VALUES (1074,'1969-08-30','Dillon','Stone','F','06-06-07');
INSERT INTO employees (no,dob,first_name,last_name,gender,hire_date) VALUES (1075,'1975-12-29','Marshall','Acevedo','M','11-12-22');
INSERT INTO employees (no,dob,first_name,last_name,gender,hire_date) VALUES (1076,'1965-03-29','Kylan','Richards','F','10-07-21');
INSERT INTO employees (no,dob,first_name,last_name,gender,hire_date) VALUES (1077,'1991-01-23','Luke','Howard','F','09-07-17');
INSERT INTO employees (no,dob,first_name,last_name,gender,hire_date) VALUES (1078,'1951-01-23','Chelsea','Chan','F','07-03-09');
INSERT INTO employees (no,dob,first_name,last_name,gender,hire_date) VALUES (1079,'1978-02-21','Linus','Hobbs','F','12-04-28');
INSERT INTO employees (no,dob,first_name,last_name,gender,hire_date) VALUES (1080,'1977-01-28','Burke','Ashley','F','08-07-09');
INSERT INTO employees (no,dob,first_name,last_name,gender,hire_date) VALUES (1081,'1990-11-23','Pearl','Dennis','M','10-10-10');
INSERT INTO employees (no,dob,first_name,last_name,gender,hire_date) VALUES (1082,'1981-04-27','Lyle','Myers','F','06-03-02');
INSERT INTO employees (no,dob,first_name,last_name,gender,hire_date) VALUES (1083,'1966-05-04','Kennan','Roman','M','07-07-20');
INSERT INTO employees (no,dob,first_name,last_name,gender,hire_date) VALUES (1084,'1947-12-28','Marcia','Bell','M','05-07-29');
INSERT INTO employees (no,dob,first_name,last_name,gender,hire_date) VALUES (1085,'1987-01-25','Aaron','Parrish','M','12-02-18');
INSERT INTO employees (no,dob,first_name,last_name,gender,hire_date) VALUES (1086,'1960-08-05','Madeline','Elliott','M','08-05-13');
INSERT INTO employees (no,dob,first_name,last_name,gender,hire_date) VALUES (1087,'1951-09-03','Zahir','Stevenson','M','12-06-23');
INSERT INTO employees (no,dob,first_name,last_name,gender,hire_date) VALUES (1088,'1973-01-31','Colette','Berger','F','12-01-22');
INSERT INTO employees (no,dob,first_name,last_name,gender,hire_date) VALUES (1089,'1987-11-09','Molly','Nieves','M','12-04-02');
INSERT INTO employees (no,dob,first_name,last_name,gender,hire_date) VALUES (1090,'1978-10-03','Nicole','Salas','M','07-11-08');
INSERT INTO employees (no,dob,first_name,last_name,gender,hire_date) VALUES (1091,'1955-05-08','Zane','Madden','M','09-07-01');
INSERT INTO employees (no,dob,first_name,last_name,gender,hire_date) VALUES (1092,'1949-03-26','Sydnee','Chen','F','09-11-11');
INSERT INTO employees (no,dob,first_name,last_name,gender,hire_date) VALUES (1093,'1969-02-24','Francesca','Patel','F','08-05-11');
INSERT INTO employees (no,dob,first_name,last_name,gender,hire_date) VALUES (1094,'1949-05-17','Clark','Glenn','F','08-09-25');
INSERT INTO employees (no,dob,first_name,last_name,gender,hire_date) VALUES (1095,'1984-12-07','William','Glover','F','09-12-28');
INSERT INTO employees (no,dob,first_name,last_name,gender,hire_date) VALUES (1096,'1967-10-30','Noble','Wiggins','F','08-04-08');
INSERT INTO employees (no,dob,first_name,last_name,gender,hire_date) VALUES (1097,'1977-10-15','Dai','Weeks','F','10-02-01');
INSERT INTO employees (no,dob,first_name,last_name,gender,hire_date) VALUES (1098,'1955-03-13','Ciara','Chavez','F','11-04-05');
INSERT INTO employees (no,dob,first_name,last_name,gender,hire_date) VALUES (1099,'1977-11-29','Francis','Singleton','M','10-12-07');
INSERT INTO employees (no,dob,first_name,last_name,gender,hire_date) VALUES (1100,'1993-03-25','TaShya','Mack','M','11-01-12');
INSERT INTO employees (no,dob,first_name,last_name,gender,hire_date) VALUES (1101,'1973-08-28','Jameson','Lopez','F','11-12-19');
INSERT INTO employees (no,dob,first_name,last_name,gender,hire_date) VALUES (1102,'1981-08-12','Dora','Hinton','F','07-05-26');
INSERT INTO employees (no,dob,first_name,last_name,gender,hire_date) VALUES (1103,'1948-11-13','Pascale','Ray','F','06-11-27');
INSERT INTO employees (no,dob,first_name,last_name,gender,hire_date) VALUES (1104,'1984-03-15','Abigail','Weiss','F','10-07-09');
INSERT INTO employees (no,dob,first_name,last_name,gender,hire_date) VALUES (1105,'1987-06-10','Fletcher','Underwood','M','13-01-15');
INSERT INTO employees (no,dob,first_name,last_name,gender,hire_date) VALUES (1106,'1947-12-24','Geoffrey','Meyers','M','08-04-15');
INSERT INTO employees (no,dob,first_name,last_name,gender,hire_date) VALUES (1107,'1989-01-09','Mara','Smith','M','05-07-18');
INSERT INTO employees (no,dob,first_name,last_name,gender,hire_date) VALUES (1108,'1963-05-07','Rhoda','Beard','M','10-12-02');
INSERT INTO employees (no,dob,first_name,last_name,gender,hire_date) VALUES (1109,'1964-01-22','Ali','Hanson','M','05-01-26');
INSERT INTO employees (no,dob,first_name,last_name,gender,hire_date) VALUES (1110,'1973-01-25','Vaughan','English','F','11-03-04');
INSERT INTO employees (no,dob,first_name,last_name,gender,hire_date) VALUES (1111,'1961-10-13','Marah','Pollard','M','07-10-28');
INSERT INTO employees (no,dob,first_name,last_name,gender,hire_date) VALUES (1112,'1975-08-18','Tatum','Adams','F','11-03-24');