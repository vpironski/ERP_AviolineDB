DELIMITER //

-- Trigger to log a message when an employee is assigned to a crew
CREATE TRIGGER `after_assign_employee_to_crew`
AFTER INSERT ON `erp_avioline`.`crew_has_employees`
FOR EACH ROW
BEGIN
    INSERT INTO `erp_avioline`.`crew_audit` (crew_id, employee_id, action, action_time)
    VALUES (NEW.crew_idcrew, NEW.employees_idemployees, 'Employee Assigned', NOW());
END //

DELIMITER ;
