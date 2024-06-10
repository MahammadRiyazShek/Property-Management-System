-- Create a new database
CREATE DATABASE property_management_system;

-- Switch to the newly created database
USE property_management_system;

-- Create tables to store property, tenant, maintenance, and financial data
CREATE TABLE Property (
    property_id INT PRIMARY KEY,
    location VARCHAR(100),
    size_sqft INT,
    amenities VARCHAR(255)
);

CREATE TABLE Tenant (
    tenant_id INT PRIMARY KEY,
    property_id INT,
    lease_start_date DATE,
    lease_end_date DATE,
    rent DECIMAL(10, 2),
    CONSTRAINT fk_property_id FOREIGN KEY (property_id) REFERENCES Property(property_id)
);

CREATE TABLE Maintenance (
    maintenance_id INT PRIMARY KEY,
    property_id INT,
    tenant_id INT,
    request_date DATE,
    completion_date DATE,
    issue_description VARCHAR(255),
    CONSTRAINT fk_property_id_maintenance FOREIGN KEY (property_id) REFERENCES Property(property_id),
    CONSTRAINT fk_tenant_id FOREIGN KEY (tenant_id) REFERENCES Tenant(tenant_id)
);

CREATE TABLE Financial (
    financial_id INT PRIMARY KEY,
    property_id INT,
    rental_income DECIMAL(10, 2),
    expenses DECIMAL(10, 2),
    CONSTRAINT fk_property_id_financial FOREIGN KEY (property_id) REFERENCES Property(property_id)
);

-- Example queries

-- 1. Get property details along with tenant information
SELECT p.*, t.*
FROM Property p
LEFT JOIN Tenant t ON p.property_id = t.property_id;

-- 2. Calculate total rental income and expenses for each property
SELECT property_id, SUM(rental_income) AS total_rental_income, SUM(expenses) AS total_expenses
FROM Financial
GROUP BY property_id;

-- 3. Identify maintenance issues and their resolution times
SELECT m.*, DATEDIFF(completion_date, request_date) AS resolution_time
FROM Maintenance m;

-- 4. Analyze tenant demographics and behavior patterns
SELECT 
    t.*, 
    COUNT(*) AS total_maintenance_requests
FROM 
    Tenant t
LEFT JOIN 
    Maintenance m ON t.tenant_id = m.tenant_id
GROUP BY 
    t.tenant_id;

-- 5. Forecast rental income using predictive modeling techniques (not implemented here)
