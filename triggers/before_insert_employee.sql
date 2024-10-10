DELIMITER //

-- Trigger to automatically add a timestamp to the `info` column when an employee is inserted
CREATE TRIGGER `before_insert_employee`
BEFORE INSERT ON `erp_avioline`.`employees`
FOR EACH ROW
BEGIN
    SET NEW.info = CONCAT('Added on ', NOW(), ': ', NEW.info);
END //

-- Trigger to log employee updates in an audit table (you need to create an audit table first)
CREATE TRIGGER `after_update_employee`
AFTER UPDATE ON `erp_avioline`.`employees`
FOR EACH ROW
BEGIN
    INSERT INTO `erp_avioline`.`employee_audit` (employee_id, action, action_time)
    VALUES (OLD.idemployees, 'Updated', NOW());
END //

DELIMITER ;
