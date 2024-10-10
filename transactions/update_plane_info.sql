START TRANSACTION;

UPDATE `erp_avioline`.`planes` 
SET 
    `manufacturer` = 'Boeing',
    `maxSpeed` = 900, 
    `fuelCapacity` = 200000 
WHERE 
    `idplanes` = 1;

COMMIT;
