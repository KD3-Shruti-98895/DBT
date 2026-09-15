DELIMITER ##

CREATE TRIGGER trig_updatebal
AFTER UPDATE ON accounts
FOR EACH ROW
BEGIN
IF NEW.tx_type = 'Deposit ' THEN
UPDATE accounts SET balance = balance + NEW.amount WHERE id = NEW.acc_id;
ELSE 
UPDATE accounts SET balance = balance - NEW.amount WHERE id = NEW.acc_id;
END IF;
END;
##
DELIMITER ;


DELIMITER ##
CREATE PROCEDURE sp_capitalize
RETURN VARCHAR(20)
DETERMINISTIC 
BEGIN 
DECLARE y_first VARCHAR(2) DEFAULT LEFT(p_str, 1);
DECLARE v_rest VARCHAR(20) DEFAULT SUBSTRING(p_str,2);
DECLARE v_result VARCHAR(20);
SET v_result = CONCAT( UPPER(v_first), LOWER(v_rest));
RETURN v_result;
END;
##
DELIMITER ;

 