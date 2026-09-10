SELECT empno, ename, sal, CASE
WHEN sal < 1500 THEN 'POOR'
WHEN sal > 2500 THEN 'RICH'
ELSE 'MIDDLE'
END category
FROM emp;

--Q1 SP_for perimeter and area
DELIMITER ## 

CREATE PROCEDURE sp_compute(p_len INT, p_wid INT,
 OUT p_peri INT, OUT p_area INT) 
BEGIN 
SET p_peri = TRUNCATE(2*(p_len + p_wid), 0);
SET p_area = TRUNCATE(p_len * p_wid, 0);

END;
##

DELIMITER ;

CALL sp_compute(3,4, @perimeter, @area);

SELECT @perimeter, @area;

--Q2 

CREATE TABLE temp (square INT, cue INT);

DELIMITER ##

CREATE PROCEDURE sp_cube() 
BEGIN
DECLARE num INT;
DECLARE p_sqr INT;
DECLARE p_cube INT;
SET num = 5;
SET p_sqr = num * num;
SET p_cube = p_sqr * num;

INSERT INTO temp VALUES (p_sqr, p_cube);

END;
##

DELIMITER ;

CALL sp_cube;
SELECT * FROM temp;

--Q3

DELIMITER ##

CREATE PROCEDURE sp_temp( )
BEGIN
DECLARE F INT;
DECLARE v_cel, v_fah INT;
SET F = 32;
SET v_cel = (F-32)*5/9;
SET v_fah = 9/5*C+32;
SELECT v_cel, v_fah ;
END;
##

DELIMITER ;

