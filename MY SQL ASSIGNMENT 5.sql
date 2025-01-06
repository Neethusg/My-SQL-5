-- CREATE DATABASE 
CREATE DATABASE ASSIGNMENT5;
USE ASSIGNMENT5;

-- CREATING TABLES

CREATE TABLE COUNTRY
(
COUNTRY_ID INT AUTO_INCREMENT PRIMARY KEY,
COUNTRY_NAME VARCHAR(100),
POPULATION BIGINT,
AREA DECIMAL (10,2));

CREATE TABLE PERSONS
(
ID INT AUTO_INCREMENT PRIMARY KEY,
FNAME VARCHAR (50) NOT NULL,
LNAME VARCHAR(50),
POPULATION BIGINT,
RATING DECIMAL (3,2),
COUNTRY_ID INT,
COUNTRY_NAME VARCHAR(100));

DESC COUNTRY;
DESC PERSONS;

-- INSERTING VALUES INTO TABLE

INSERT INTO COUNTRY
VALUES 
(1, 'USA', '500000', '643801.0'),
(2, 'CANADA', '800000', '683547.4'),
(3, 'AUSTRALIA', '1000000', '45781255.0'),
(4, 'INDIA', '30000000', '3287263.0'),
(5, 'UK', '1500000', '543801.2'),
(6, 'JAPAN', '126300000', '377975.0'),
(7, 'BRAZIL', '211000000', '8515767.0'),
(8, 'MOSCOW', '126300000', '377975.0'),
(9, 'ROME', '60245946', '301340.0'),
(10, 'OTTAWA', '37742154', '9984670.0');

SELECT * FROM COUNTRY;

INSERT INTO PERSONS
VALUES
(DEFAULT, 'JOHN', 'DOE', '500000', '1.0', '1', 'USA'),
(DEFAULT, 'SOPHIA', 'WILLIAMS', '800000', '2.0', '2', 'CANADA'),
(DEFAULT, 'JAMES', 'TAYLOR', '1000000', '3.0', '3', 'AUSTRALIA'),
(DEFAULT, 'AALIYA', 'MILLER', '30000000', '4.0', '4', 'INDIA'),
(DEFAULT, 'EMMA', 'YOUNG', '1500000', '5.0', '5', 'UK'),
(DEFAULT, 'ISABELLA', 'KING', '126300000', '2.0', '6', 'JAPAN'),
(DEFAULT, 'DANIEL', 'HALL', '211000000', '3.0', '7', 'BRAZIL'),
(DEFAULT, 'LILY', 'LEWIS', '126300000', '1.0', '8', 'MOSCOW'),
(DEFAULT, 'MIA', 'NELSON', '60245946', '4.0', '9', 'ROME'),
(DEFAULT, 'MILA', 'MURPHY', '37742154', '5.0', '10', 'OTTAWA');

SELECT * FROM PERSONS;

#1. FIRST 3 CHARACTER OF COUNTRY NAME FROM TABLE COUNTRY
SELECT LEFT (COUNTRY_NAME, 3) AS  FIRST_THREE_CHARACTER FROM COUNTRY;

#2. CONCATENATE FIRST NAME AND LAST NAME FROM PERSONS TABLE
SELECT CONCAT(FNAME, ' ', LNAME) AS FULLNAME FROM PERSONS;

#3. TO COUNT NUMBER OF UNIQUE COUNTRY NAMES FROM TABLE PERSONS
SELECT COUNT(DISTINCT COUNTRY_NAME) AS UNIQUE_COUNTRY_NAME FROM PERSONS;

#4. MAXIMUM POPULATION FROM COUNTRY TABLE
SELECT MAX(POPULATION) AS MAX_POPULATION FROM COUNTRY;

#5. MINIMUM POPULATION FROM PERSONS TABLE
SELECT MIN(POPULATION) AS MIN_POPULATION FROM PERSONS;

#6. TWO NEW ROWS TO PERSONS TABLE MAKING LAST NAME NULL THEN COUNT LAST NAME FROM PERSONS TABLE
INSERT INTO PERSONS
VALUES
(DEFAULT, 'JONY', NULL, '550000', '1.0', '1', 'USA'),
(DEFAULT, 'JACOB', NULL, '70500000', '1.0', '1', 'USA');

SELECT * FROM PERSONS;

SELECT COUNT(LNAME) AS LAST_NAME_COUNT FROM PERSONS;

#7. FIND NUMBER OF ROWS IN THE PERSONS TABLE
SELECT COUNT(*) AS TOTAL_ROWS FROM PERSONS;

#8. QUERY TO SHOW POPULATION OF THE COUNTRY TABLE FOR THE FIRST 3 ROWS
SELECT POPULATION FROM COUNTRY ORDER BY COUNTRY_NAME DESC LIMIT 3;
SELECT POPULATION FROM COUNTRY LIMIT 3;

#9. QUERY TO PRINT 3 RANDOM ROWS OF COUNTRIES
SELECT * FROM COUNTRY ORDER BY RAND() LIMIT 3;

#10. LIST ALL PERSONS ORDER BY THEIR RATING IN DESCENDING ORDER
SELECT * FROM PERSONS ORDER BY RATING DESC;

#11. TOTAL POPULATION FOR EACH COUNTRY IN THE PERSONS TABLE
SELECT COUNTRY_NAME, SUM(POPULATION) AS TOTAL_POPULATION FROM PERSONS GROUP BY COUNTRY_NAME;

#12. COUNTRIES IN THE PERSONS TABLE WITH A TOTAL POPULATION > 50000
SELECT COUNTRY_NAME, SUM(POPULATION) AS TOTAL_POPULATION FROM PERSONS GROUP BY COUNTRY_NAME HAVING TOTAL_POPULATION >50000;

#13. TOTAL NO. OF PERSONS AND AVERAGE RATING FOR EACH COUNTRY, BUT ONLY FOR COUNTRIES WITH MORE THAN 2 PERSOS, ORDER BY AVERAGE RATING IN ASCENDING OREDER
SELECT COUNTRY_NAME, COUNT(*) AS TOTAL_PERSONS, AVG(RATING) AS AVERAGE_RATING FROM PERSONS GROUP BY COUNTRY_NAME HAVING COUNT(*) > 2 
ORDER BY AVERAGE_RATING ASC;
