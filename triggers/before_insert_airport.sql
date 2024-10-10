DELIMITER //

-- Trigger to validate runway length before inserting a new airport
CREATE TRIGGER `before_insert_airport`
BEFORE INSERT ON `erp_avioline`.`airports`
FOR EACH ROW
BEGIN
    IF NEW.runwayLenght < 1000 THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Runway length must be at least 1000 meters';
    END IF;
END //

-- Trigger to validate runway length before updating an airport
CREATE TRIGGER `before_update_airport`
BEFORE UPDATE ON `erp_avioline`.`airports`
FOR EACH ROW
BEGIN
    IF NEW.runwayLenght < 1000 THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Runway length must be at least 1000 meters';
    END IF;
END //

DELIMITER ;
