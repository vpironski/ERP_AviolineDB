# ERP for an Airline Company

## Description

This is a school project to create a avioline database.
The airline company has the following resources:

- **Aircraft**: various types with different characteristics:
  - Manufacturer
  - Range (depends on the engine)
  - Cruise speed
  - Maximum speed
  - Fuel consumption at cruise speed
  - Fuel consumption at maximum speed
  - Maximum fuel capacity
  - Maximum takeoff weight
  - Empty weight
- **Crew**: composed of members with different roles (pilot, co-pilot, navigator, flight attendants, second crew)
  - Maintenance cycle
- **Engines**:
  - Manufacturer
  - Maintenance cycle
  - Fuel consumption
- **Seating Configuration**:
  - Number of seats in different classes
  - Base location
  - Flight hours
  - Required runway length for landing
- **People**:
  - Full personal description, addresses, names, ages, gender, etc.
  - Qualifications

Operations include:

- **Route**:
  - Departure airport
  - Destination airport
  - Departure time
  - Arrival time
  - Route length
- **Airport**:
  - Airport description, code, etc.
  - Runway length
- **Flight (per route)**:
  - Aircraft used
  - Crew members assigned
  - Number of passengers
  - Weight of cargo (passengers and baggage)

## Implementation Details

- **Tables**:
  - `Aircraft`
  - `Crew`
  - `Engines`
  - `Seating Configuration`
  - `People`
  - `Routes`
  - `Airports`
  - `Flights`

- **Triggers**:
  - `employees Table`:
      - `before_insert_employee`: Trigger to automatically add a timestamp and message to the `info` column when a new employee record is         inserted.
      - `after_update_employee`: Trigger to log updates made to employee records in an audit table for tracking purposes.
  
  - `routes Table`:
      - `before_insert_route`: Trigger to ensure `startHour` is before `finishHour` when a new route is inserted. Raises an error if the          validation fails.
  
  - `flights Table`:
      - `after_insert_flight`: Trigger to increment the `flownWith` field in the `planes` table for each newly created flight.
      - `before_insert_flight`: Trigger to ensure that the total weight of a flight does not exceed the maximum weight capacity of the            assigned plane. Raises an error if the validation fails.
  
  - `crew Table`:
      - `after_assign_employee_to_crew`: Trigger to log the assignment of employees to crews in the `crew_audit` table.

  - `airports Table`:
      - `before_insert_airport`: Trigger to validate that the `runwayLenght` is at least 1000 meters before inserting a new airport record.       Raises an error if the validation fails.
      - `before_update_airport`: Trigger to ensure that the `runwayLenght` remains valid (at least 1000 meters) during updates. Raises an         error if the validation fails.

  - `planes_has_classes Table`:
      - `after_insert_plane_class`: Trigger to ensure that at least one passenger class is assigned to a plane after new records are added.

- **Views**:
  - `employee_info`: 
      - A view that combines employee data with their classification names, providing easy access to employee information.

  - `flight_details`: 
      - A view that consolidates flight information with associated route and plane details for streamlined queries regarding flights.

  - `crew_assignments`: 
      - A view that aggregates employee names assigned to each crew, allowing for a quick overview of crew compositions.

  - `plane_classes`: 
      - A view that displays planes along with their manufacturers and the classes they accommodate, enhancing the visibility of class              assignments.

  - `airport_flight_info`: 
      - A view that lists airport codes alongside the IDs of associated flights, facilitating tracking of flight operations for each                airport.


- **Users and Roles**:
  - **Roles**:
    - `Admin`: Full access to all database operations and tables in the `erp_avioline` database.
    - `Manager`: Read and write access to all tables, excluding the ability to drop tables or create users.
    - `Employee`: Read-only access to specific tables such as `employees` and `Flights`.

  - **Users**:
    - `admin_user`:
      - **Host**: `localhost`
      - **Assigned Role**: Admin
      - **Password**: `StrongPassword1!`
    
    - `manager_user`:
      - **Host**: `localhost`
      - **Assigned Role**: Manager
      - **Password**: `StrongPassword2!`
    
    - `employee_user`:
      - **Host**: `localhost`
      - **Assigned Role**: Employee
      - **Password**: `StrongPassword3!`


- **Indexes**:
  - `classification Table`:
      - `idx_classification_name`: Index on the `name` column to optimize searches for classifications by name.
  
  - `employees Table`:
      - `idx_employees_name`: Index on the `name` column to speed up searches for employees by name.
      - `idx_employees_classification_id`: Index on the `classification_idclassification` column to enhance performance for queries involving classifications.

  - `engines Table`:
      - `idx_engines_manufacturer`: Index on the `manufacturer` column to improve engine searches by manufacturer.
      - `idx_engines_fuelConsumtion`: Index on the `fuelConsumtion` column for better query performance on fuel consumption data.
  
  - `planes Table`:
      - `idx_planes_manufacturer`: Index on the `manufacturer` column to accelerate searches for planes by manufacturer.
      - `idx_planes_based`: Index on the based column to enhance searches by plane location or base.
       
  - `routes Table`:
      - `idx_routes_startPoint`: Index on the `startPoint` column to improve performance in queries filtering routes by starting location.
      - `idx_routes_finishPoint`: Index on the `finishPoint` column to optimize searches for routes by the destination.

  - `flights Table`:
      - `idx_flights_passengers`: Index on the `passengers` column to speed up queries filtering by the number of passengers.
      - `idx_flights_weight`: Index on the `weight` column to enhance performance in searches filtering by flight weight.
        
  - `airports Table`:
      - `idx_airports_code`: Index on the `code` column to optimize queries for airport searches by code.

- **Transactions**:
  - Grouping queries related to flight booking, crew assignments, etc., into transactions to ensure data consistency.

## Setup

- SQL scripts for creating tables, triggers, views, users/roles, indexes, and transactions should be stored in a version-controlled repository for easy access and collaboration among team members.
