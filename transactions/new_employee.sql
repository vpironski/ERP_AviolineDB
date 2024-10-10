START TRANSACTION;

INSERT INTO `erp_avioline`.`employees` 
(`name`, `adress`, `age`, `gender`, `info`, `classification_idclassification`) 
VALUES 
('John Doe', '303 Birch St', 29, 'Male', 'Junior Pilot', 1);

COMMIT;
