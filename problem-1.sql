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