-- Drop table if it exists
DROP TABLE IF EXISTS Employees;

-- Create a sample Employees table
CREATE TABLE Employees (
    EmpID INT PRIMARY KEY,
    Name VARCHAR(100),
    Department VARCHAR(50),
    Salary INT,
    HireDate DATE,
    Gender CHAR(1)
);

-- Insert sample data
INSERT INTO Employees VALUES (1, 'Alice', 'HR', 60000, '2020-02-01', 'F');
INSERT INTO Employees VALUES (2, 'Bob', 'Engineering', 90000, '2019-07-23', 'M');
INSERT INTO Employees VALUES (3, 'Charlie', 'Engineering', 85000, '2021-01-10', 'M');
INSERT INTO Employees VALUES (4, 'Diana', 'Marketing', 70000, '2020-11-15', 'F');
INSERT INTO Employees VALUES (5, 'Evan', 'HR', 62000, '2022-05-05', 'M');
INSERT INTO Employees VALUES (6, 'Fiona', 'Marketing', 71000, '2023-04-12', 'F');
INSERT INTO Employees VALUES (7, 'George', 'Engineering', 92000, '2018-09-30', 'M');

-- 1. COUNT
SELECT COUNT(*) AS TotalEmployees FROM Employees;

-- 2. COUNT DISTINCT Departments
SELECT COUNT(DISTINCT Department) AS UniqueDepartments FROM Employees;

-- 3. SUM of Salaries
SELECT SUM(Salary) AS TotalSalaries FROM Employees;

-- 4. AVG Salary per Department
SELECT Department, AVG(Salary) AS AvgSalary FROM Employees GROUP BY Department;

-- 5. MIN and MAX Salaries
SELECT MIN(Salary) AS MinSalary, MAX(Salary) AS MaxSalary FROM Employees;

-- 6. GROUP_CONCAT / STRING_AGG (depends on RDBMS)
-- MySQL / SQLite: GROUP_CONCAT
-- PostgreSQL / SQL Server: STRING_AGG
-- Example with GROUP_CONCAT (MySQL)
SELECT Department, GROUP_CONCAT(Name) AS EmployeesInDept FROM Employees GROUP BY Department;

-- 7. HAVING clause: Departments with average salary > 70000
SELECT Department, AVG(Salary) AS AvgSalary
FROM Employees
GROUP BY Department
HAVING AVG(Salary) > 70000;

-- 8. Conditional Aggregation: Gender-wise employee count
SELECT 
    COUNT(CASE WHEN Gender = 'M' THEN 1 END) AS MaleEmployees,
    COUNT(CASE WHEN Gender = 'F' THEN 1 END) AS FemaleEmployees
FROM Employees;

-- 9. Conditional Aggregation: High earners per department
SELECT 
    Department,
    COUNT(CASE WHEN Salary > 80000 THEN 1 END) AS HighEarners
FROM Employees
GROUP BY Department;

-- 10. Count of employees hired after 2020
SELECT COUNT(*) AS RecentHires FROM Employees WHERE HireDate > '2020-12-31';

-- 11. Total salary by department, ordered by total descending
SELECT Department, SUM(Salary) AS TotalSalary
FROM Employees
GROUP BY Department
ORDER BY TotalSalary DESC;
