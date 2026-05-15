USE fraud_detection_db;

-- Cursor Procedure
DELIMITER $$
CREATE PROCEDURE analyze_user_transactions(IN p_user_id INT)
BEGIN
   -- cursor code
END$$
DELIMITER ;



-- Trigger
DELIMITER $$
CREATE TRIGGER before_transaction_insert
BEFORE INSERT ON transactions
FOR EACH ROW
BEGIN
   -- validation
END$$
DELIMITER ;

DELIMITER $$

DROP FUNCTION IF EXISTS calculate_risk $$

CREATE FUNCTION calculate_risk(amount DECIMAL(10,2))
RETURNS INT
DETERMINISTIC
BEGIN
    DECLARE risk INT;

    IF amount > 50000 THEN
        SET risk = 80;
    ELSEIF amount > 20000 THEN
        SET risk = 60;
    ELSEIF amount > 10000 THEN
        SET risk = 40;
    ELSE
        SET risk = 10;
    END IF;

    RETURN risk;
END$$

DELIMITER ;