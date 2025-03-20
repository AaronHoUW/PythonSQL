CREATE DATABASE company_db;
USE company_db;

CREATE TABLE employees (
    id INT IDENTITY(1,1) PRIMARY KEY, --Auto Increment
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    email VARCHAR(100) UNIQUE, --Unique
    phone_number VARCHAR(20) NULL, --Nullable
    hire_date DATETIME NOT NULL,
    job_title VARCHAR(50),
    salary DECIMAL(10, 2),
    department VARCHAR(50), --Ask if this should've been another table
    manager_id INT NULL REFERENCES employees(id) 
)
GO

CREATE OR ALTER PROCEDURE insert_employee
@FirstName VARCHAR(50),
@LastName VARCHAR(50),
@Email VARCHAR(50),
@PhoneNumber VARCHAR(50) NULL,
@HireDate DATETIME,
@JobTitle VARCHAR(50),
@Salary DECIMAL(10, 2),
@Department VARCHAR(50), 
@ManagerId INT = NULL
AS
DECLARE @M_ID INT

IF (@ManagerId IS NOT NULL)
    BEGIN
        SET @M_ID = (
            SELECT id
            FROM employees
            WHERE id = @ManagerID)
    END

BEGIN TRAN T1
    INSERT INTO employees
    VALUES(@FirstName, @LastName, @Email, @PhoneNumber, @HireDate, @JobTitle, @Salary, @Department, @M_ID)
COMMIT TRAN T1
GO

EXECUTE insert_employee
@FirstName = 'John',
@LastName = 'Doe',
@Email = 'john.doe@email.com',
@PhoneNumber = 1234567890,
@HireDate = '2024-01-10',
@JobTitle = 'Engineer',
@Salary = 70000,
@Department = 'IT', 
@ManagerId = NULL

EXECUTE insert_employee
@FirstName = 'Alice',
@LastName = 'Smith',
@Email = 'Alice.Smith@email.com',
@PhoneNumber = 0987654321,
@HireDate = '2023-06-22',
@JobTitle = 'Manager',
@Salary = 90000.00,
@Department = 'HR', 
@ManagerId = NULL

EXECUTE insert_employee
@FirstName = 'Bob',
@LastName = 'Johnson',
@Email = 'bob.johnson@email.com',
@PhoneNumber = 1231231234,
@HireDate = '2022-09-14',
@JobTitle = 'Analyst',
@Salary = 65000.00,
@Department = 'Finance', 
@ManagerId = 2

USE company_db; 

SELECT *
FROM employees

SELECT name
FROM sys.databases
WHERE name = 'company_db'

DROP TABLE employees

USE MASTER
DROP DATABASE company_db
