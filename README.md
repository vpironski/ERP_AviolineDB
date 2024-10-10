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
  - Insert and update triggers to maintain data integrity and enforce business rules.

- **Views**:
  - Views for generating reports on flights, crew schedules, etc.

- **Users and Roles**:
  - Roles for different levels of access (database, table, column) to manage security.
  - Users assigned to roles based on their responsibilities.

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
