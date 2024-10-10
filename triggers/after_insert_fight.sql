DELIMITER //

-- Trigger to automatically increment the `flownWith` count when a new flight is added
CREATE TRIGGER `after_insert_flight`
AFTER INSERT ON `erp_avioline`.`flights`
FOR EACH ROW
BEGIN
    UPDATE `erp_avioline`.`planes`
    SET flownWith = flownWith + 1
    WHERE idplanes = NEW.planes_idplanes;
END //

DELIMITER ;
