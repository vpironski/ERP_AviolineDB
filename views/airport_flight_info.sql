CREATE VIEW `erp_avioline`.`airport_flight_info` AS
SELECT 
    a.idairports,
    a.code,
    a.info,
    GROUP_CONCAT(f.idFlights SEPARATOR ', ') AS flight_ids
FROM 
    `erp_avioline`.`airports` a
JOIN 
    `erp_avioline`.`airports_has_Flights` af ON a.idairports = af.airports_idairports
JOIN 
    `erp_avioline`.`Flights` f ON af.Flights_idFlights = f.idFlights
GROUP BY 
    a.idairports;
