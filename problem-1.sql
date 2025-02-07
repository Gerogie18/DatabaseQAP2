--Create TABLES
-- Create Student Table
CREATE TABLE students (
    id SERIAL PRIMARY KEY,
    first_name VARCHAR(100) NOT NULL,
    last_name VARCHAR(100) NOT NULL,
    email VARCHAR(100) NOT NULL,
    school_enrollment_date Date NOT NULL,
)

-- Create Professor Table
CREATE TABLE professors (
    id SERIAL PRIMARY KEY,
    first_name VARCHAR(100) NOT NULL,
    last_name VARCHAR(100) NOT NULL,
    department VARCHAR(100) NOT NULL,
)

-- Create Course Table
CREATE TABLE courses (
    id SERIAL PRIMARY KEY,
    course_name VARCHAR(100) NOT NULL,
    course_description VARCHAR(250) NOT NULL,
    professor_id INT NOT NULL REFERENCES professors(id),
)

-- Create Enrollment Table
CREATE TABLE enrollments (
    student_id INT NOT NULL REFERENCES students(id),
    course_id INT NOT NULL REFERENCES courses(id),
    enrollment_date DATE NOT NULL,
    PRIMARY KEY (student_id, course_id)
)

-- INSERT Data
-- Insert Students (5)
INSERT INTO students (first_name, last_name, email, school_enrollment_date)
VALUES
    ('Brad', 'Majors', 'brad.majors@dentonhigh.edu', '2020-09-01'),
    ('Janet', 'Weiss', 'janet.weiss@dentonhigh.edu', '2020-09-01'),
    ('Riff', 'Raff', 'riff.raff@transylvaniaschool.edu', '2022-01-01'),
    ('Columbia', 'Cantrell', 'columbia.cantrell@transylvaniaschool.edu', '2022-01-01'),
    ('Eddie', 'Quinlan', 'eddie.quinlan@deliveryboy.edu', '2021-06-01');

-- Insert Professors (4)
INSERT INTO professors (first_name, last_name, department)
VALUES
    ('Frank-N-Furter', 'PhD', 'Theater'),
    ('Dr. Everett', 'V. Scott', 'Science'),
    ('Magenta', 'Usher', 'Music'),
    ('The', 'Criminologist', 'Criminology');

-- Insert courses (4)
INSERT INTO courses (course_name, course_description, professor_id)
VALUES
    ('Sweet Transvestite Studies', 'An exploration of the intersection of identity, performance, and self-expression.', 1),
    ('The Science of Reanimation', 'A study of the scientific principles behind bringing the dead back to life, with a focus on practical applications.', 2),
    ('Time Warp Theory and Practice', 'An examination of the physics and philosophy of time travel, with a focus on the Time Warp as a case study.', 3),
    ('Criminology of the Damned', 'A survey of the darker corners of human nature, with a focus on the crimes and misdeeds of the denizens of Transylvania.', 4);
    ('physics 101', 'An introduction to the basic principles of physics.', 2);

-- Insert enrollments (15)
-- Insert Enrollments
INSERT INTO enrollments (student_id, course_id, enrollment_date)
VALUES
    (1, 1, '2025-01-01'),  
    (1, 2, '2025-01-01'),  
    (1, 5, '2025-01-01'),  
    (2, 3, '2025-01-01'),  
    (2, 4, '2025-01-01'),  
    (2, 1, '2025-01-01'),  
    (3, 2, '2025-01-01'),  
    (3, 5, '2025-01-01'),  
    (3, 3, '2025-01-01'),  
    (4, 1, '2025-01-01'),  
    (4, 4, '2025-01-01'), 
    (4, 2, '2025-01-01'),
    (5, 3, '2025-01-01'),  
    (5, 2, '2025-01-01'), 
    (5, 1, '2025-01-01');  

-- SQL QUERIES
-- full namees of students
SELECT CONCAT(students.first_name, ' ', students.last_name) AS full_name
FROM enrollments;
JOIN courses ON enrollments.course_id = courses.id
JOIN students ON enrollments.student_id = students.id;
where courses.course_name = 'Physics 101';

-- retrive a list of courses as well as professors full name
SELECT 
    course_name, 
    CONCAT(professors.first_name, ' ', professors.last_name) AS professor_name
FROM courses
JOIN professors ON courses.professor_id = professors.id;

