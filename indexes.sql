CREATE INDEX idx_classification_name ON `erp_avioline`.`classification` (`name`);

CREATE INDEX idx_employees_name ON `erp_avioline`.`employees` (`name`);
CREATE INDEX idx_employees_classification_id ON `erp_avioline`.`employees` (`classification_idclassification`);

CREATE INDEX idx_engines_manufacturer ON `erp_avioline`.`engines` (`manufacturer`);
CREATE INDEX idx_engines_fuelConsumtion ON `erp_avioline`.`engines` (`fuelConsumtion`);

CREATE INDEX idx_planes_manufacturer ON `erp_avioline`.`planes` (`manufacturer`);
CREATE INDEX idx_planes_based ON `erp_avioline`.`planes` (`based`);

CREATE INDEX idx_routes_startPoint ON `erp_avioline`.`routes` (`startPoint`);
CREATE INDEX idx_routes_finishPoint ON `erp_avioline`.`routes` (`finishPoint`);

CREATE INDEX idx_flights_passengers ON `erp_avioline`.`flights` (`passangers`);
CREATE INDEX idx_flights_weight ON `erp_avioline`.`flights` (`weight`);

CREATE INDEX idx_airports_code ON `erp_avioline`.`airports` (`code`);
