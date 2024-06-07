CREATE TABLE employees (
    id SERIAL PRIMARY KEY,
    name VARCHAR(100),
    age INTEGER,
    position VARCHAR(100)
);
INSERT INTO employees (name, age, position) VALUES
('Daniel', 1, 'Manager'),
('Daniel1', 2, 'Developer'),
('daniel2', 3, 'Designer');


SELECT * FROM employees;


CREATE TABLE departments (
    id SERIAL PRIMARY KEY,
    name VARCHAR(100),
    location VARCHAR(100)
);

ALTER TABLE employees
ADD COLUMN department_id INTEGER;



ALTER TABLE employees
ADD CONSTRAINT fk_department
FOREIGN KEY (department_id) REFERENCES departments(id);

SELECT employees.name AS employee_name, departments.name AS department_name
FROM employees
JOIN departments ON employees.department_id = departments.id;


CREATE TABLE projects (
    id SERIAL PRIMARY KEY,
    name VARCHAR(100)
);


CREATE TABLE employee_projects (
    employee_id INTEGER,
    project_id INTEGER,
    PRIMARY KEY (employee_id, project_id),
    FOREIGN KEY (employee_id) REFERENCES employees(id),
    FOREIGN KEY (project_id) REFERENCES projects(id)
);
INSERT INTO projects (name) VALUES
('Project 1'),
('Project 2');

SELECT employees.name AS employee_name, projects.name AS project_name
FROM employees
LEFT JOIN employee_projects ON employees.id = employee_projects.employee_id
LEFT JOIN projects ON employee_projects.project_id = projects.id;

SELECT AVG(age) AS average_age FROM employees;

SELECT departments.name AS department_name, COUNT(employees.id) AS employee_count
FROM departments
LEFT JOIN employees ON departments.id = employees.department_id
GROUP BY departments.name;



SELECT departments.name AS department_name, COUNT(employees.id) AS employee_count
FROM departments
LEFT JOIN employees ON departments.id = employees.department_id
GROUP BY departments.name
ORDER BY employee_count DESC;


SELECT employees.name AS employee_name, projects.name AS project_name
FROM employees
JOIN employee_projects ON employees.id = employee_projects.employee_id
JOIN projects ON employee_projects.project_id = projects.id;



SELECT employees.name AS employee_name, projects.name AS project_name
FROM employees
LEFT JOIN employee_projects ON employees.id = employee_projects.employee_id
LEFT JOIN projects ON employee_projects.project_id = projects.id;

CREATE INDEX idx_employee_name ON employees(name);

ALTER TABLE employees ADD COLUMN created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP;

CREATE OR REPLACE FUNCTION set_created_at()
RETURNS TRIGGER AS $$
BEGIN
    NEW.created_at = CURRENT_TIMESTAMP;
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER trg_set_created_at
BEFORE INSERT ON employees
FOR EACH ROW
EXECUTE FUNCTION set_created_at();


ALTER TABLE employees ADD COLUMN last_updated TIMESTAMP;

CREATE OR REPLACE FUNCTION set_last_updated()
RETURNS TRIGGER AS $$
BEGIN
    NEW.last_updated = CURRENT_TIMESTAMP;
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER trg_set_last_updated
BEFORE UPDATE ON employees
FOR EACH ROW
EXECUTE FUNCTION set_last_updated();
