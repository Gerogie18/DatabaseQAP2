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
