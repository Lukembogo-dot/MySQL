-- Student table
CREATE TABLE Student (
    StudentID INT PRIMARY KEY,
    Name VARCHAR(100),
    Age INT,
    Email VARCHAR(100)
);

-- Instructor table
CREATE TABLE Instructor (
    InstructorID INT PRIMARY KEY,
    Name VARCHAR(100),
    Department VARCHAR(100)
);

-- Course table
CREATE TABLE Course (
    CourseID INT PRIMARY KEY,
    Title VARCHAR(100),
    Credits INT,
    InstructorID INT,
    FOREIGN KEY (InstructorID) REFERENCES Instructor(InstructorID)
);

-- Enrollment table (bridge)
CREATE TABLE Enrollment (
    EnrollID INT PRIMARY KEY,
    StudentID INT,
    CourseID INT,
    Grade VARCHAR(5),
    FOREIGN KEY (StudentID) REFERENCES Student(StudentID),
    FOREIGN KEY (CourseID) REFERENCES Course(CourseID)
);

-- Students
INSERT INTO Student VALUES (1, 'Luke', 22, 'luke@mail.com');
INSERT INTO Student VALUES (2, 'Mary', 21, 'mary@mail.com');
INSERT INTO Student VALUES (3, 'John', 23, 'john@mail.com');
INSERT INTO Student VALUES (4, 'Grace', 20, 'grace@mail.com');
INSERT INTO Student VALUES (5, 'Paul', 24, 'paul@mail.com');

-- Instructors
INSERT INTO Instructor VALUES (1, 'Dr. Smith', 'Computer Science');
INSERT INTO Instructor VALUES (2, 'Dr. Jane', 'Business');
INSERT INTO Instructor VALUES (3, 'Dr. Mike', 'Mathematics');
INSERT INTO Instructor VALUES (4, 'Prof. Ann', 'History');
INSERT INTO Instructor VALUES (5, 'Dr. Peter', 'Engineering');

-- Courses
INSERT INTO Course VALUES (101, 'Database Systems', 3, 1);
INSERT INTO Course VALUES (102, 'Business Management', 4, 2);
INSERT INTO Course VALUES (103, 'Calculus I', 3, 3);
INSERT INTO Course VALUES (104, 'World History', 2, 4);
INSERT INTO Course VALUES (105, 'Software Engineering', 3, 5);

-- Enrollments
INSERT INTO Enrollment VALUES (1, 1, 101, 'A');
INSERT INTO Enrollment VALUES (2, 1, 103, 'B');
INSERT INTO Enrollment VALUES (3, 2, 101, 'B+');
INSERT INTO Enrollment VALUES (4, 3, 104, 'A-');
INSERT INTO Enrollment VALUES (5, 4, 105, 'B');

select * from student;

-- Students enrolled in Database Systems
SELECT s.Name, c.Title, e.Grade
FROM Student s
JOIN Enrollment e ON s.StudentID = e.StudentID
JOIN Course c ON e.CourseID = c.CourseID
WHERE c.Title = 'Database Systems';

-- Update a grade
UPDATE Enrollment
SET Grade = 'A+'
WHERE EnrollID = 2;

select * from Enrollment;

-- Remove a student from a course
DELETE FROM Enrollment
WHERE EnrollID = 5;

select * from Enrollment;