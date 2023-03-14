CREATE TABLE Students(
    StudentID INT PRIMARY KEY AUTO_INCREMENT,
    Name VARCHAR(30) NOT NULL,
    StudentNumber VARCHAR(9) NOT NULL UNIQUE,
    Surname VARCHAR(40) NOT NULL,
    Sex VARCHAR(1) NOT NULL,
    DOB DATE NOT NULL,
    Address VARCHAR(100) NOT NULL,
    StudentEmail VARCHAR(21) NOT NULL,
    Grad VARCHAR(10) NOT NULL DEFAULT "Undergrad",
    PRIMARY KEY(StudentID)
);


CREATE TABLE Telephone(
    StudentID INT NOT NULL, 
    Phone VARCHAR(15) NOT NULL,
    FOREIGN KEY(StudentID) REFERENCES Students(StudentID)
);

CREATE TABLE Courses(
    CourseID INT NOT NULL AUTO_INCREMENT,
    CourseCredit INT NOT NULL DEFAULT 8,
    CourseName VARCHAR(10) NOT NULL,
    Semester VARCHAR(1) NOT NULL,
    CourseCode VARCHAR(8) NOT NULL,
    PRIMARY KEY(CourseID)
);

CREATE TABLE TakesACourse(
    StudentID INT NOT NULL,
    CourseID INT NOT NULL,
    CourseStatus VARCHAR(1) NOT NULL DEFAULT "F",
    YearRegistered DATE NOT NULL,
    FOREIGN KEY(StudentID) REFERENCES Students(StudentID),
    FOREIGN KEY(CourseID) REFERENCES Courses(CourseID)
);

CREATE TABLE Marks(
    StudentID INT NOT NULL,
    CourseID INT NOT NULL,
    ExamPercentage INT NOT NULL,
    TestsPercentage INT NOT NULL,
    Assignments INT NOT NULL,
    FOREIGN KEY(StudentID) REFERENCES Students(StudentID),
    FOREIGN KEY(CourseID) REFERENCES Courses(CourseID)
);

CREATE TABLE Assigments(
    StudentID INT NOT NULL,
    CourseID INT NOT NULL,
    AssignmentNo INT NOT NULL,
    Marks INT NOT NULL,
    DateAssigned DATE NOT NULL,
    DateDue DATE NOT NULL,
    FOREIGN KEY(StudentID) REFERENCES Students(StudentID),
    FOREIGN KEY(CourseID) REFERENCES Courses(CourseID)
);

CREATE TABLE Tests(
    StudentID INT NOT NULL,
    CourseID INT NOT NULL,
    TestNo INT NOT NULL,
    DateTaken DATE NOT NULL,
    FOREIGN KEY(StudentID) REFERENCES Students(StudentID),
    FOREIGN KEY(CourseID) REFERENCES Courses(CourseID)
);

CREATE TABLE Exam(
    StudentID INT NOT NULL,
    CourseID INT NOT NULL,
    ExamNo INT NOT NULL,
    ExamMark INT NOT NULL,
    DateTaken DATE NOT NULL,
    ExamType VARCHAR(5) NOT NULL DEFAULT "Final",
    FOREIGN KEY(StudentID) REFERENCES Students(StudentID),
    FOREIGN KEY(CourseID) REFERENCES Courses(CourseID)
);