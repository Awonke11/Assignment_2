CREATE TABLE Students(
    StudentID INT PRIMARY KEY AUTO_INCREMENT,
    Name VARCHAR(30) NOT NULL,
    StudentNumber VARCHAR(9) NOT NULL UNIQUE,
    Surname VARCHAR(40) NOT NULL,
    Sex VARCHAR(1) NOT NULL,
    DOB DATETIME NOT NULL,
    Address VARCHAR(100) NOT NULL,
    StudentEmail VARCHAR(21) NOT NULL,
    Grad VARCHAR(10) NOT NULL DEFAULT "Undergrad",
    PRIMARY KEY(StudentID)
);


CREATE TABLE Telephone(
    StudentID INT NOT NULL, 
    Phone VARCHAR(15) NOT NULL,
    PRIMARY KEY(StudentID),
    FOREIGN KEY(StudentID) REFERENCES Students(StudentID)
);

CREATE TABLE Courses(
    CourseID INT NOT NULL AUTO_INCREMENT,
    CourseCredit INT NOT NULL DEFAULT 8,
    CourseName VARCHAR(30) NOT NULL,
    Semester VARCHAR(1) NOT NULL DEFAULT "W",
    CourseCode VARCHAR(8) NOT NULL,
    PRIMARY KEY(CourseID)
);

CREATE TABLE TakesACourse(
    StudentID INT NOT NULL,
    CourseID INT NOT NULL,
    CourseStatus VARCHAR(1) NOT NULL DEFAULT "F",
    YearRegistered DATETIME NOT NULL,
    PRIMARY KEY(StudentID, CourseID),
    FOREIGN KEY(StudentID) REFERENCES Students(StudentID),
    FOREIGN KEY(CourseID) REFERENCES Courses(CourseID)
);

CREATE TABLE Marks(
    StudentID INT NOT NULL,
    CourseID INT NOT NULL,
    ExamPercentage INT NOT NULL,
    TestsPercentage INT NOT NULL,
    Assignments INT NOT NULL,
    PRIMARY KEY(StudentID, CourseID),
    FOREIGN KEY(StudentID) REFERENCES Students(StudentID),
    FOREIGN KEY(CourseID) REFERENCES Courses(CourseID)
);

CREATE TABLE Assigments(
    StudentID INT NOT NULL,
    CourseID INT NOT NULL,
    AssignmentNo INT NOT NULL,
    Marks INT NOT NULL,
    DATETIMEAssigned DATETIME NOT NULL,
    DATETIMEDue DATETIME NOT NULL,
    PRIMARY KEY(StudentID, CourseID),
    FOREIGN KEY(StudentID) REFERENCES Students(StudentID),
    FOREIGN KEY(CourseID) REFERENCES Courses(CourseID)
);

CREATE TABLE Tests(
    StudentID INT NOT NULL,
    CourseID INT NOT NULL,
    TestNo INT NOT NULL,
    DATETIMETaken DATETIME NOT NULL,
    PRIMARY KEY(StudentID, CourseID),
    FOREIGN KEY(StudentID) REFERENCES Students(StudentID),
    FOREIGN KEY(CourseID) REFERENCES Courses(CourseID)
);

CREATE TABLE Exam(
    StudentID INT NOT NULL,
    CourseID INT NOT NULL,
    ExamNo INT NOT NULL,
    ExamMark INT NOT NULL,
    DATETIMETaken DATETIME NOT NULL,
    ExamType VARCHAR(5) NOT NULL DEFAULT "Final",
    PRIMARY KEY(StudentID, CourseID),
    FOREIGN KEY(StudentID) REFERENCES Students(StudentID),
    FOREIGN KEY(CourseID) REFERENCES Courses(CourseID)
);

CREATE TABLE Module(
    ModuleID INT NOT NULL AUTO_INCREMENT,
    ModuleName VARCHAR(50) NOT NULL,
    PRIMARY KEY(ModuleID)
);

CREATE TABLE Includes ( 
    ModuleID INT NOT NULL,
    CourseID INT NOT NULL,
    PRIMARY KEY( CourseID, ModuleID),
    FOREIGN KEY (CourseID) REFERENCES Courses(CourseID),
    FOREIGN KEY (ModuleID) REFERENCES Module(ModuleID)
);

CREATE TABLE Stuff(
    StuffID INT NOT NULL AUTO_INCREMENT,
    Sex VARCHAR(1) NOT NULL DEFAULT "M",
    StuffEmail VARCHAR(50) NOT NULL,
    Salary DECIMAL(8, 2) NOT NULL,
    Address VARCHAR(100) NOT NULL,
    PRIMARY KEY(StuffID)
);

CREATE TABLE TelephoneStuff ( 
    StuffID INT NOT NULL,
    telephoneStuff VARCHAR(10) NOT NULL,
    PRIMARY KEY(StuffID),
    FOREIGN KEY(StuffID) REFERENCES Stuff(StuffID) 
);

CREATE TABLE Lectures ( 
    ModuleID INT NOT NULL,
    StuffID INT NOT NULL ,
    Venue VARCHAR(30) NOT NULL,
    YearLec DATETIME NOT NULL,
    PRIMARY KEY(ModuleID, StuffID),
    FOREIGN KEY (ModuleID) REFERENCES Module(ModuleID),
    FOREIGN KEY (StuffID) REFERENCES Stuff(StuffID)
);

CREATE TABLE Tutor ( 
    StuffID INT NOT NULL,
    Period VARCHAR(10) NOT NULL,
    PRIMARY KEY(StuffID),
    FOREIGN KEY(StuffID) REFERENCES  Stuff(StuffID) 
);

CREATE TABLE Lecture (
    StuffID INT NOT NULL,   
    OfficeNumber VARCHAR(10) NOT NULL,
    PRIMARY KEY(StuffID),
    FOREIGN KEY(StuffID) REFERENCES Stuff(StuffID) 
);

CREATE TABLE Convener (
    StuffID INT NOT NULL,
    OfficeNumber VARCHAR(10) NOT NULL,
    PRIMARY KEY(StuffID),
    FOREIGN KEY(StuffID) REFERENCES Stuff(StuffID) 
);

CREATE TABLE IsATutor ( 
    StudentID INT NOT NULL,
    StuffID INT NOT NULL,
    PRIMARY KEY (StuffID, StudentID),
    FOREIGN KEY (StuffID) REFERENCES Stuff(StuffID),
    FOREIGN KEY (StudentID) REFERENCES students(StudentID)
);

CREATE TABLE Department (
    DepartmentID INT NOT NULL AUTO_INCREMENT,
    DepartmentName VARCHAR(20) NOT NULL,
    PRIMARY KEY(DepartmentID)
);

CREATE TABLE WorksIn (
    DepartmentID INT NOT NULL,
    StuffID INT NOT NULL,
    YearEmployed DATETIME NOT NULL,
    PRIMARY KEY(StuffID),
    FOREIGN KEY (StuffID) REFERENCES Stuff(StuffID),
    FOREIGN KEY (DepartmentID) REFERENCES Department(DepartmentID)
);

CREATE TABLE InDepartment( 
    DepartmentID INT NOT NULL,
    CourseID INT NOT NULL,
    PRIMARY KEY (CourseID),
    FOREIGN KEY (CourseID) REFERENCES Courses(CourseID),
    FOREIGN KEY (DepartmentID) REFERENCES Department(DepartmentID)
);