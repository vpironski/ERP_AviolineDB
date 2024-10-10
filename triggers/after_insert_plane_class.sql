DELIMITER //

-- Trigger to ensure a plane has at least one class assigned when inserting a record
CREATE TRIGGER `after_insert_plane_class`
AFTER INSERT ON `erp_avioline`.`planes_has_classes`
FOR EACH ROW
BEGIN
    DECLARE class_count INT;
    
    -- Count the number of classes assigned to the plane
    SELECT COUNT(*) INTO class_count
    FROM `erp_avioline`.`planes_has_classes`
    WHERE planes_idplanes = NEW.planes_idplanes;
    
    -- Ensure there's at least one class assigned
    IF class_count = 0 THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'A plane must have at least one class assigned';
    END IF;
END //

DELIMITER ;
