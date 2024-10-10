-- Drop users if they exist
DROP USER IF EXISTS admin_user;
DROP USER IF EXISTS manager_user;
DROP USER IF EXISTS employee_user;

-- Create User for Admin
CREATE USER admin_user IDENTIFIED BY 'root1234';
GRANT 'Admin' TO admin_user;

-- Create User for Manager
CREATE USER manager_user IDENTIFIED BY 'root1234';
GRANT 'Manager' TO manager_user;

-- Create User for Employee
CREATE USER employee_user IDENTIFIED BY 'root1234';
GRANT 'Employee' TO employee_user;
