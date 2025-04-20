-- Step 1: Create a new database
CREATE DATABASE company_db;

-- Step 2: Select the database
USE company_db;

-- Step 3: Create the employees table
CREATE TABLE employees (
    employee_id INT AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    email VARCHAR(100) UNIQUE,
    phone_number VARCHAR(15),
    date_of_birth DATE,
    gender ENUM('Male', 'Female', 'Other'),
    hire_date DATE,
    job_title VARCHAR(100),
    department VARCHAR(100),
    salary DECIMAL(10, 2),
    bonus DECIMAL(10, 2),
    is_active BOOLEAN DEFAULT TRUE,
    address TEXT,
    city VARCHAR(50),
    state VARCHAR(50),
    postal_code VARCHAR(10),
    country VARCHAR(50),
    emergency_contact_name VARCHAR(100),
    emergency_contact_phone VARCHAR(15),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Step 4: Insert sample employee data
INSERT INTO employees (
    first_name, last_name, email, phone_number, date_of_birth, gender, hire_date,
    job_title, department, salary, bonus, is_active, address, city, state, postal_code,
    country, emergency_contact_name, emergency_contact_phone
) VALUES
('John', 'Doe', 'john.doe@example.com', '1234567890', '1985-06-15', 'Male', '2010-04-20',
 'Software Engineer', 'IT', 85000.00, 5000.00, TRUE, '123 Tech Street', 'New York', 'NY', '10001',
 'USA', 'Jane Doe', '0987654321'),

('Alice', 'Smith', 'alice.smith@example.com', '2345678901', '1990-08-22', 'Female', '2012-09-15',
 'Project Manager', 'Operations', 95000.00, 7000.00, TRUE, '456 Business Ave', 'Los Angeles', 'CA', '90001',
 'USA', 'Bob Smith', '1122334455'),

('Michael', 'Brown', 'michael.brown@example.com', '3456789012', '1988-02-10', 'Male', '2015-01-10',
 'HR Specialist', 'HR', 60000.00, 3000.00, TRUE, '789 People Blvd', 'Chicago', 'IL', '60601',
 'USA', 'Emily Brown', '6677889900');
