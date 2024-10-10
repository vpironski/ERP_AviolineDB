CREATE VIEW `erp_avioline`.`employee_info` AS
SELECT 
    e.idemployees,
    e.name AS employee_name,
    e.adress,
    e.age,
    e.gender,
    c.name AS classification_name,
    e.info
FROM 
    `erp_avioline`.`employees` e
JOIN 
    `erp_avioline`.`classification` c ON e.classification_idclassification = c.idclassification;
