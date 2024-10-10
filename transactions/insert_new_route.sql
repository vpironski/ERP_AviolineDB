START TRANSACTION;

INSERT INTO `erp_avioline`.`routes` 
(`startPoint`, `finishPoint`, `starHour`, `finishHour`, `lenght`) 
VALUES 
('New York', 'Chicago', '2024-10-15 10:00:00', '2024-10-15 12:00:00', '790 km'),
('Los Angeles', 'Miami', '2024-10-16 14:00:00', '2024-10-16 18:00:00', '3500 km'),
('Dallas', 'San Francisco', '2024-10-17 09:00:00', '2024-10-17 12:00:00', '2500 km'),
('Seattle', 'Denver', '2024-10-18 08:00:00', '2024-10-18 11:00:00', '1600 km'),
('Houston', 'Atlanta', '2024-10-19 15:00:00', '2024-10-19 18:00:00', '1200 km');


COMMIT;
