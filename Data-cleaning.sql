
-- data clening

CREATE TABLE temp_table(
frist_name VARCHAR(50),
last_name  VARCHAR(50),
id INT,
salary INT,
favorite_movie VARCHAR(50)
);
SELECT*
FROM temp_table;
INSERT INTO temp_table
VALUES('sowmya','Golla',1,95000,'Lord of the ring:the two towers'),
        ('mahesh','Golla',2,85000,'Lord of the ring:the two towers'),
        ('maha','kuruba',3,90000,'Lord of the ring:the two towers'),
        ('ruchitha','chappidi',4,75000,'Lord of the ring:the two towers'),
         ('bhavya','Golla',5,500000,'Lord of the ring:the two towers');
   

SELECT*
FROM temp_table;

-- stored procedures
DROP TEMPORARY TABLE IF EXISTS salary_over_50k;
CREATE TEMPORARY TABLE salary_over_50k AS
SELECT *
FROM temp_table
WHERE salary > 50000;



CREATE  TEMPORARY TABLE salary_over_50k
SELECT*
FROM temp_table
WHERE salary>50000;
 
SELECT*
FROM salary_over_50k;


CREATE PROCEDURE large_salaries()
SELECT*
FROM salary_over_50k
WHERE salary>= 50000;
CALL large_salaries();


DROP TABLE IF EXISTS temp_table; 
DELIMITER $$
CREATE PROCEDURE large_salaries_b2()
BEGIN
SELECT*
FROM salary_over_50k
WHERE salary >= 50000;
SELECT *
FROM salary_over_50k
WHERE salary >= 10000;
END $$
SHOW PROCEDURE STATUS
WHERE Name = 'large_salaries';
DELIMITER ;
CALL large_salariers_b2;

SELECT*
FROM temp_table
WHERE salary >=90000;

DROP  TABLE IF EXISTS temp_table;
CREATE TEMPORARY TABLE temp_table 
(first_name VARCHAR(50),
last_name VARCHAR(50),
favorite_movie VARCHAR(50)
);
SELECT *
FROM temp_table;

-- EVENTS 

   SHOW VARIABLES LIKE 'event%';
   SELECT*
FROM temp_table;
SHOW VARIABLES LIKE 'event%';

DELIMITER $$




CREATE EVENT delete_retirees
ON  SCHEDULE EVERY 30 SECOND 
DO
 BEGIN
 DELETE
 FROM temp_table
 WHERE  salary >= 70000;
 END $$
 DELIMITER ;

   
SHOW TABLES;
SHOW DATABASES;

CREATE TABLE temp_table;
USE temp_table;
SELECT*,
ROW_NUMBER() OVER() AS rn
FROM temp_table;


WITH duplicate_cte AS
(
SELECT*,
ROW_NUMBER() OVER(
PARTITION BY frist_name,last_name,id,salary,favorite_movie)AS row_num
FROM temp_table
)
SELECT*
FROM duplicate_cte
WHERE row_num>1;
SELECT*
FROM temp_table
WHERE frist_name='sowmya';



SHOW CREATE TABLE temp_table;
SHOW INDEX FROM temp_table;

SET SQL_SAFE_UPDATES = 1;
DROP TABLE IF  EXISTS temp_table;
DELETE 
FROM temp_table
WHERE id>1;



DROP TABLE IF EXISTS temp_table;
CREATE TABLE temp_table(
id int);
SELECT*
FROM temp_table;
SET SQL_SAFE_UPDATES=0;

SET SQL_SAFE_UPDATES =1;
DELETE
FROM temp_table
WHERE id > 1 ;

SELECT*
FROM temp_table
WHERE id>1;
SET SQL_SAFE_UPDATES =1;

WITH CTE AS(
SELECT *,
       ROW_NUMBER() OVER (PARTITION BY  id ORDER BY  id) AS row_num
FROM temp_table)
DELETE 
FROM CTE
WHERE row_num > 1;
SELECT*
FROM temp_table;
DROP TABLE IF EXISTS temp_table;




DROP TABLE IF EXISTS temp_table3;


CREATE TABLE temp_table3
(
id INT,
name VARCHAR(50)
);
INSERT INTO temp_table3(id,name)VALUES
(1,'sowmya'),
(2,'mahi'),
(3,'maha'),
(4,'madhu')

;



UPDATE temp_table3
SET name = TRIM(name);
SELECT*
FROM temp_table3;

DELETE 
FROM temp_table3
WHERE id > 1;

SET SQL_SAFE_UPDATES = 0;


DESC temp_table3;

ALTER TABLE temp_table3
DROP COLUMN row_num;
ALTER TABLE temp_table3
ADD COLUMN row_num INT;
SET SQL_SAFE_UPDATES = 0;
WITH CTE AS(

SELECT id,name,                                                  
ROW_NUMBER() OVER(
PARTITION BY id,name ORDER BY id)AS row_num
FROM temp_table3
WHERE id >= 5

)
UPDATE temp_table3 t
JOIN cte c
ON t.id=c.id
AND t.name=c.name
SET t.row_num=c.row_num;

-- standardizing data
SELECT name,TRIM(name)
FROM temp_table3;

SELECT TRIM(name)
FROM temp_table3;

UPDATE temp_table3
SET name = TRIM(name);

SELECT name
FROM temp_table3;


SELECT DISTINCT id
FROM temp_table3
ORDER BY 1;



DROP  TABLE IF EXISTS temp_table;


DROP  TABLE IF EXISTS temp_table4;

CREATE TABLE temp_table4(
frist_name VARCHAR(50),
last_name  VARCHAR(50),
id INT,
salary INT,
favorite_movie VARCHAR(50)
);

INSERT INTO temp_table4(frist_name,last_name,id,salary,favorite_movie)VALUES
      ('sowmya','Golla',1,95000,'Lord of the ring:the two towers'),
        ('mahesh','Golla',2,85000,'Lord of the ring:the two towers'),
        ('maha','kuruba',3,95000,'Lord of the ring:the two towers'),
        ('ruchitha','chappidi',4,75000,'Lord of the ring:the two towers'),
         ('bhavya','Golla',5,56000,'Lord of the ring:the two towers');
         
         
         SELECT *FROM temp_table4;
SELECT DISTINCT id
FROM temp_table4
ORDER BY 1;

SELECT*
FROM temp_table4
WHERE  favorite_movie LIKE 'Lord of the ring:the two towers'
ORDER BY 1;


SELECT*
FROM temp_table4
WHERE  frist_name LIKE 'sowmya';

UPDATE temp_table4
SET  frist_name = 'sowmya'
WHERE frist_name LIKE 'sowmya';


SELECT DISTINCT frist_name
FROM temp_table4
;
UPDATE temp_table4
SET frist_name='maha'
WHERE frist_name LIKE 'maha';

SELECT DISTINCT id
FROM temp_table4;

SELECT DISTINCT salary
FROM temp_table4
ORDER BY 1;

SELECT *
FROM temp_table4
WHERE salary LIKE 55000
ORDER BY 1;

SELECT DISTINCT last_name,TRIM(frist_name)
FROM temp_table
ORDER BY 1;


SELECT DISTINCT frist_name,TRIM(TRAILING '_'FROM frist_name) 
FROM temp_table4
ORDER BY 1;
 UPDATE temp_table4
 SET frist_name = TRIM(TRAILING '_' FROM frist_name)
 WHERE frist_name LIKE 'sowmy%';








SELECT DATABASE();
DESC temp_table4;
DESC temp_table6;
SELECT*
FROM temp_table4 t4
JOIN temp_table6 t6
ON t4.frist_name = t6.frist_name
AND t4.id = t6.id
WHERE t4.salary IS NULL
AND t6.salary IS NOT NULL; 
         
         
         
SELECT* 
FROM temp_table5
WHERE dob = NULL ;

SELECT dob
FROM temp_table5;


SELECT dob,
STR_TO_DATE(dob,'Y/%m/%d')AS dob
FROM temp_table4;


SELECT dob,
STR_TO_DATE(dob,'%Y/%m/%d')AS dob
FROM temp_table4;
  UPDATE temp_table4
  SET dob = STR_TO_DATE(dob,'%Y/%m/%d')

  ;
  
  SELECT*
  FROM temp_table4;

ALTER TABLE temp_table4
MODIFY COLUMN dob DATE;

SELECT*
FROM temp_table4;


SELECT salary
FROM temp_table4
WHERE salary >= 55000;
 
 

CREATE TABLE temp_table6(
frist_name VARCHAR(50),
last_name  VARCHAR(50),
id INT,
salary INT,
favorite_movie VARCHAR(50),
dob DATE
);

INSERT INTO temp_table6(frist_name,last_name,id,salary,favorite_movie,dob)VALUES
      ('sowmya','Golla',1,95000,'Lord of the ring:the two towers','2007-06-07'),
        ('mahesh','Golla',2,85000,'Lord of the ring:the two towers','2003-08-16'),
        ('maha','kuruba',3,95000,'Lord of the ring:the two towers','2007-09-07'),
        ('ruchitha','chappidi',4,75000,'Lord of the ring:the two towers','2005-09-02'),
         ('bhavya','Golla',5,56000,'Lord of the ring:the two towers','2004-03-05');

SELECT*
FROM temp_table6;

SELECT  salary
FROM temp_table6
WHERE salary IS NULL;

SELECT salary
FROM temp_table6
WHERE salary =null;

ALTER TABLE temp_table6
MODIFY COLUMN dob DATE;
SELECT* 
FROM temp_table6
WHERE dob  IS NULL 
;
ALTER TABLE temp_table6
MODIFY COLUMN dob DATE;
SELECT*
FROM temp_table6
WHERE salary IS NULL
OR id IS NULL
OR dob IS NULL;



SELECT DISTINCT salary
FROM temp_table6
WHERE salary IS NULL
OR salary ='';

SELECT*
FROM temp_table6
WHERE frist_name= 'sowmya';



SELECT*
FROM temp_table4 t4
JOIN temp_table6 t6
    ON t4.frist_name = t6.frist_name
   AND t4.id = t6.id
WHERE t4.salary IS NULL
AND t6.salary IS NOT NULL; 




SHOW TABLES;
DESC temp_table4;
DESC temp_table6;
SELECT*
FROM temp_table4 t4
JOIN temp_table6 t6
    ON t4.frist_name = t6.frist_name
WHERE (t4.id IS NULL )
AND t6.id IS NOT NULL; 

SELECT frist_name,last_name,salary,id
FROM temp_table6
;
SELECT *FROM temp_table6;



DESC temp_table4;
DESC temp_table6;
SELECT temp_table4.salary,temp_table6.salary
FROM temp_table4
JOIN temp_table6
  ON temp_table4.frist_name = temp_table6.frist_name
  WHERE (temp_table4.salary IS NULL OR temp_table4.salary = '')
  AND temp_table6.salary IS NOT NULL ;
  

SET SQL_SAFE_UPDATES = 0;

UPDATE temp_table4 t4
JOIN temp_table6 t6
ON t4.frist_name = t6.frist_name
SET t4.salary = t6. salary
WHERE (t4.salary IS NULL OR t4.salary = '')
AND t6.salary IS NOT NULL;
SET SQL_SAFE_UPDATES = 1;

SET SQL_SAFE_UPDATES = 0;
UPDATE temp_table t4
JOIN temp_table t6
ON t4.frist_name = t6.frist_name
SET t4.id = t6.id
WHERE (t4.id IS NULL OR t4.id = '')
AND t6.id IS NOT NULL;
SET SQL_SAFE_UPDATES = 1;



SELECT *
FROM temp_table4
WHERE id IS NULL
AND favorite_movie IS NULL;
 
 UPDATE temp_table4
 SET frist_name = NULL
 WHERE frist_name ='';
 
 SELECT*
 FROM temp_table4
 WHERE frist_name IS NULL;

  SELECT *
FROM temp_table4
WHERE id IS NULL
AND favorite_movie IS NULL;

SET SQL_SAFE_UPDATES = 0;

DELETE
 FROM temp_table4
WHERE id IS NULL
AND salary IS NULL;
SET SQL_SAFE_UPDATES = 1;


SELECT temp_table10
FROM temp_table4;

ALTER TABLE temp_table4
DROP COLUMN id;