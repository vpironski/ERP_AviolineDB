CREATE VIEW `erp_avioline`.`crew_assignments` AS
SELECT 
    c.idcrew,
    GROUP_CONCAT(e.name SEPARATOR ', ') AS employee_names
FROM 
    `erp_avioline`.`crew` c
JOIN 
    `erp_avioline`.`crew_has_employees` ce ON c.idcrew = ce.crew_idcrew
JOIN 
    `erp_avioline`.`employees` e ON ce.employees_idemployees = e.idemployees
GROUP BY 
    c.idcrew;
