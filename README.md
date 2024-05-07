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
  - Indexes on commonly queried columns to improve query performance.

- **Transactions**:
  - Grouping queries related to flight booking, crew assignments, etc., into transactions to ensure data consistency.

## Setup

- SQL scripts for creating tables, triggers, views, users/roles, indexes, and transactions should be stored in a version-controlled repository for easy access and collaboration among team members.
