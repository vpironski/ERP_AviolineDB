-- Populate the `classification` Table
INSERT INTO `erp_avioline`.`classification` (`name`) VALUES
('Pilot'),
('Co-Pilot'),
('Flight Attendant'),
('Maintenance Crew'),
('Ground Staff');

-- Populate the `employees` Table
INSERT INTO `erp_avioline`.`employees` (`name`, `adress`, `age`, `gender`, `info`, `classification_idclassification`) VALUES
('Alice Johnson', '123 Elm St', 28, 'Female', 'Experienced Flight Attendant', 3),
('Bob Smith', '456 Oak St', 35, 'Male', 'Senior Pilot with 10 years of experience', 1),
('Charlie Brown', '789 Pine St', 30, 'Male', 'Co-Pilot with extensive training', 2),
('Diana Prince', '101 Maple St', 32, 'Female', 'Pilot with a specialization in long-haul flights', 1),
('Edward Norton', '202 Cedar St', 45, 'Male', 'Senior Maintenance Crew Member', 4);

-- Populate the `crew` Table
INSERT INTO `erp_avioline`.`crew` VALUES
(1),
(2),
(3),
(4),
(5);

-- Populate the `engines` Table
INSERT INTO `erp_avioline`.`engines` (`manufacturer`, `cycleOfRepairs`, `fuelConsumtion`, `distanceTraveled`) VALUES
('Rolls Royce', '5000 hours', '3.5 L/h', 100000),
('General Electric', '6000 hours', '4.0 L/h', 150000),
('Pratt & Whitney', '4000 hours', '2.8 L/h', 80000),
('MTU Aero Engines', '5500 hours', '3.0 L/h', 120000),
('Honeywell', '7000 hours', '2.5 L/h', 180000);

-- Populate the `planes` Table
INSERT INTO `erp_avioline`.`planes` (`manufacturer`, `cruiseSpeed`, `maxSpeed`, `fuelConsumtionCruise`, `fuelConsumtionMax`, `fuelCapacity`, `maxWeight`, `weight`, `cycleOfRepairs`, `passengersInClasses`, `based`, `flownWith`, `landingPath`, `engines_idengines`, `maxDistande`) VALUES
('Boeing', 850, 950, 4.5, 5.5, 180000, 400000, 300000, '6000 hours', '180', 'JFK', 1, 1500, 1, 5000),
('Airbus', 900, 980, 4.2, 5.0, 200000, 440000, 320000, '6500 hours', '200', 'LAX', 2, 1600, 2, 5500),
('Embraer', 750, 800, 3.8, 4.5, 100000, 250000, 150000, '4000 hours', '100', 'ORD', 3, 1200, 3, 3000),
('Bombardier', 780, 820, 3.5, 4.0, 120000, 260000, 160000, '4500 hours', '110', 'ATL', 4, 1250, 4, 3500),
('Cessna', 700, 750, 2.5, 3.0, 60000, 150000, 80000, '3000 hours', '50', 'SFO', 5, 1000, 5, 2000);

-- Populate the `routes` Table
INSERT INTO `erp_avioline`.`routes` (`startPoint`, `finishPoint`, `starHour`, `finishHour`, `lenght`) VALUES
('New York', 'Los Angeles', '2024-10-15 08:00:00', '2024-10-15 11:00:00', '4000 km'),
('Chicago', 'Miami', '2024-10-16 09:30:00', '2024-10-16 12:00:00', '2500 km'),
('San Francisco', 'Seattle', '2024-10-17 07:00:00', '2024-10-17 09:00:00', '1300 km'),
('Houston', 'Dallas', '2024-10-18 14:00:00', '2024-10-18 15:00:00', '500 km'),
('Boston', 'Washington', '2024-10-19 10:30:00', '2024-10-19 12:00:00', '700 km');

-- Populate the `Flights` Table
INSERT INTO `erp_avioline`.`Flights` (`routes_idroutes`, `planes_idplanes`, `crew_idcrew`, `passangers`, `weight`) VALUES
(1, 1, 1, 150, 30000),
(2, 2, 2, 200, 40000),
(3, 3, 3, 100, 20000),
(4, 4, 4, 80, 18000),
(5, 5, 5, 50, 10000);

-- Populate the `airports` Table
INSERT INTO `erp_avioline`.`airports` (`info`, `code`, `runwayLenght`) VALUES
('John F. Kennedy International Airport', 12345, 4000),
('Los Angeles International Airport', 54321, 3800),
('Chicago O\'Hare International Airport', 67890, 3500),
('Miami International Airport', 98765, 3200),
('San Francisco International Airport', 24680, 3600);

-- Populate the `airports_has_Flights` Table
INSERT INTO `erp_avioline`.`airports_has_Flights` (`airports_idairports`, `Flights_idFlights`) VALUES
(1, 1),
(2, 2),
(3, 3),
(4, 4),
(5, 5);
