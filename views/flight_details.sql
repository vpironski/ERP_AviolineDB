CREATE VIEW `erp_avioline`.`flight_details` AS
SELECT 
    f.idFlights,
    r.startPoint,
    r.finishPoint,
    r.starHour,
    r.finishHour,
    p.manufacturer AS plane_manufacturer,
    p.cruiseSpeed,
    f.passangers,
    f.weight
FROM 
    `erp_avioline`.`Flights` f
JOIN 
    `erp_avioline`.`routes` r ON f.routes_idroutes = r.idroutes
JOIN 
    `erp_avioline`.`planes` p ON f.planes_idplanes = p.idplanes;
