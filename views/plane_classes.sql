CREATE VIEW `erp_avioline`.`plane_classes` AS
SELECT 
    p.idplanes,
    p.manufacturer,
    c.name AS class_name,
    p.passengersInClasses
FROM 
    `erp_avioline`.`planes` p
JOIN 
    `erp_avioline`.`planes_has_classes` pc ON p.idplanes = pc.planes_idplanes
JOIN 
    `erp_avioline`.`classes` c ON pc.classes_idclasses = c.idclasses;
