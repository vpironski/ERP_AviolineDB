START TRANSACTION;

UPDATE `erp_avioline`.`Flights` 
SET `crew_idcrew` = 1 
WHERE `idFlights` = 2; 
-- Assuming idFlights 2 corresponds to a specific flight

COMMIT;
