DELIMITER //

-- Trigger to ensure the total weight of the flight does not exceed the plane's maximum capacity
CREATE TRIGGER `before_insert_flight`
BEFORE INSERT ON `erp_avioline`.`flights`
FOR EACH ROW
BEGIN
    DECLARE max_plane_weight DOUBLE;
    
    -- Get the max weight of the plane
    SELECT maxWeight INTO max_plane_weight
    FROM `erp_avioline`.`planes`
    WHERE idplanes = NEW.planes_idplanes;
    
    -- Check if the total weight exceeds the plane's capacity
    IF NEW.weight > max_plane_weight THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Flight weight exceeds plane capacity';
    END IF;
END //

DELIMITER ;
