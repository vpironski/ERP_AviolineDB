-- Admin Role: Full access to all tables and operations
GRANT ALL PRIVILEGES ON `erp_avioline`.* TO 'Admin';

-- Manager Role: Can read and write to all tables but not drop tables or create users
GRANT SELECT, INSERT, UPDATE, DELETE ON `erp_avioline`.* TO 'Manager';

-- Employee Role: Limited to reading data from specific tables
GRANT SELECT ON `erp_avioline`.`employees` TO 'Employee';
GRANT SELECT ON `erp_avioline`.`Flights` TO 'Employee';
