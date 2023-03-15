CREATE TABLE Students(
    StudentID INT NOT NULL AUTO_INCREMENT,
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

INSERT INTO Students (StudentsID, StudentNumber, Name,  Surname, Sex, DOB, Address, StudentEmail, Grad) VALUES
(128569, 'S18_1749', 'Thabo', 'Maliea', 'M', '2002-06-27', '12 Kellner St, Mowbray', 'S18_1749@myuct.ac.za', 'Undergrad'),
(128534, 'S18_2248','David', 'Moloi', 'M', '2002-04-17', '20 Durban Rd, Observatory', 'S18_22489@myuct.ac.za', 'Undergrad' ),
(128725, 'S18_4409','John', 'Johnson', 'M', '2001-09-23', '15 Browning Rd, Rodenbosch', 'S18_4409@myuct.ac.za', 'Undergrad'),
(128163, 'S24_3969', 'Salome', 'Mukwevho', 'F', '2002-02-28', '11 Waltz St, Mowbray', 'S24_3969@myuct.ac.za', 'Undergrad'),
(128309, 'S18_2325','Kate', 'Spears', 'F', '2002-01-01', '5 Victoria St, Woodstock', 'S18_2325@myuct.ac.za', 'Undergrad'),
(128442, 'S18_2795', 'Rajesh', 'Gupta', 'M', '2000-10-22', '14 Loop St, Claremont', 'S18_2795@myuct.ac.za', 'Undergrad'),
(128369, 'S24_1937','Millicent', 'Zulu', 'F', '2002-05-13', '21 Baker St, Woodstock', 'S24_1937@myuct.ac.za', 'Undergrad');

CREATE TABLE Telephone(
    StudentID INT NOT NULL, 
    Phone VARCHAR(15) NOT NULL,
    PRIMARY KEY(StudentID),
    FOREIGN KEY(StudentID) REFERENCES Students(StudentID)
);

INSERT INTO Telephone (StuffID, Phone) VALUES
(128569, '+27 21 650 1234'),
(128534, '+27 21 660 2468'),
(128725, '+27 21 650 1357'),
(128163, '+27 21 670 9182'),
(128309, '+27 21 660 1428'),
(128442, '+27 21 680 7050'),
(128369, '+27 21 650 5136');

CREATE TABLE Courses(
    CourseID INT NOT NULL AUTO_INCREMENT,
    CourseCredit INT NOT NULL DEFAULT 8,
    CourseName VARCHAR(30) NOT NULL,
    Semester VARCHAR(1) NOT NULL DEFAULT "W",
    CourseCode VARCHAR(8) NOT NULL,
    PRIMARY KEY(CourseID)
);

INSERT INTO Courses (CourseID, CourseCredit, CourseName,  Semester, CourseCode) VALUES
(2004, 16, 'Java', 'F', 'CSC2004'),
(1010, 24, 'Python', 'S', 'CSC1010'),
(1000, 18, 'Programming Ethics', 'W', 'CSC1000'),
(2032, 36, 'Informatics', 'F', 'CSC2032'),
(2016, 16, 'Javascript', 'H', 'CSC2016'),
(2001, 24, 'Unix', 'S', 'CSC2001'),
(3001, 48, 'HTML', 'W', 'CSC3001'),
(2002, 18, 'PHP', 'H', 'CSC2002');

CREATE TABLE TakesACourse(
    StudentID INT NOT NULL,
    CourseID INT NOT NULL,
    CourseStatus VARCHAR(1) NOT NULL DEFAULT "F",
    YearRegistered DATE NOT NULL,
    PRIMARY KEY(StudentID, CourseID),
    FOREIGN KEY(StudentID) REFERENCES Students(StudentID),
    FOREIGN KEY(CourseID) REFERENCES Courses(CourseID)
);

INSERT INTO TakesACourses (StudentID, CourseID, CourseStatus, YearRegistered) VALUES
(128569, 2001 , 'P', '14-03-2021'),
(128534, 2032 , 'F', '28-01-2022'),
(128725, 2016 , 'P', '10-03-2023'),
(128163, 2004 , 'F', '28-01-2022'),
(128309, 2032,'P', '28-01-2022'),
(128442, 2016 , 'P', '14-03-2021'),
(128369, 2002 ,'P', '30-02-2020');

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

INSERT INTO Marks (StudentID, CourseID, ExamPercentage, TestsPercentage, Assignments) VALUES
(128569, 2001, 60, 53, 95),
(128534, 2032, 40, 33, 40),
(128725, 2016, 80, 71, 100),
(128163, 2004, 35, 24, 30),
(128309, 2032, 94, 89, 100),
(128442, 2016, 55, 53, 70),
(128369, 2002, 76, 62, 100);

CREATE TABLE Assigments(
    StudentID INT NOT NULL,
    CourseID INT NOT NULL,
    AssignmentNo INT NOT NULL,
    Mark INT NOT NULL,
    DateAssigned DATE NOT NULL,
    DateDue DATE NOT NULL,
    PRIMARY KEY(StudentID, CourseID),
    FOREIGN KEY(StudentID) REFERENCES Students(StudentID),
    FOREIGN KEY(CourseID) REFERENCES Courses(CourseID)
);

INSERT INTO Assigments (StudentID, CourseID, AssignmentNo, Marks, DateAssigned, DateDue) VALUES
(128569, 2001, 1, 100, '01-01-2023', '07-01-2023'),
(128569, 2001, 2, 100, '07-01-2023', '14-01-2023'),
(128569, 2001, 3, 90, '14-01-2023', '21-01-2023'),
(128534, 2032, 1, 40, '01-01-2023', '07-01-2023'),
(128534, 2032, 2, 50, '07-01-2023', '14-01-2023'),
(128534, 2032, 3, 20, '14-01-2023', '21-01-2023'),
(128725, 2016, 1, 100, '01-01-2023', '07-01-2023'),
(128725, 2016, 2, 100, '07-01-2023', '14-01-2023'),
(128725, 2016, 3, 100, '14-01-2023', '21-01-2023'),
(128163, 2004, 1, 10, '01-01-2023', '07-01-2023'),
(128163, 2004, 2, 0, '07-01-2023', '14-01-2023'),
(128163, 2004, 3, 12, '14-01-2023', '21-01-2023'),
(128309, 2032, 1, 100, '01-01-2023', '07-01-2023'),
(128309, 2032, 2, 100, '07-01-2023', '14-01-2023'),
(128309, 2032, 3, 100, '14-01-2023', '21-01-2023'),
(128442, 2016, 1, 60, '01-01-2023', '07-01-2023'),
(128442, 2016, 2, 80, '07-01-2023', '14-01-2023'),
(128442, 2016, 3, 50, '14-01-2023', '21-01-2023'),
(128369, 2002, 1, 100, '01-01-2023', '07-01-2023'),
(128369, 2002, 2, 100, '07-01-2023', '14-01-2023'),
(128369, 2002, 3, 100, '14-01-2023', '21-01-2023');

CREATE TABLE Tests(
    StudentID INT NOT NULL,
    CourseID INT NOT NULL,
    TestNo INT NOT NULL,
    Mark INT NOT NULL,
    DateTaken DATE NOT NULL,
    PRIMARY KEY(StudentID, CourseID),
    FOREIGN KEY(StudentID) REFERENCES Students(StudentID),
    FOREIGN KEY(CourseID) REFERENCES Courses(CourseID)
);

INSERT INTO Tests (StudentID, CourseID, TestNo, Mark, DateTaken) VALUES
(128569, 2001, 1, 51, '01-01-2023'),
(128569, 2001, 2, 52, '14-01-2023'),
(128534, 2032, 1, 21, '01-01-2023'),
(128534, 2032, 2, 24, '14-01-2023'),
(128725, 2016, 1, 71, '01-01-2023'),
(128725, 2016, 2, 64, '14-01-2023'),
(128163, 2004, 1, 10, '01-01-2023'),
(128163, 2004, 2, 5, '14-01-2023'),
(128309, 2032, 1, 90, '01-01-2023'),
(128309, 2032, 2, 82, '14-01-2023'),
(128442, 2016, 1, 52, '01-01-2023'),
(128442, 2016, 2, 51, '14-01-2023'),
(128369, 2002, 1, 52, '01-01-2023'),
(128369, 2002, 2, 66, '14-01-2023');

CREATE TABLE Exam(
    StudentID INT NOT NULL,
    CourseID INT NOT NULL,
    ExamNo INT NOT NULL,
    ExamMark INT NOT NULL,
    DateTaken DATE NOT NULL,
    ExamType VARCHAR(5) NOT NULL DEFAULT "Final",
    PRIMARY KEY(StudentID, CourseID),
    FOREIGN KEY(StudentID) REFERENCES Students(StudentID),
    FOREIGN KEY(CourseID) REFERENCES Courses(CourseID)
);

INSERT INTO Exam (StudentID, CourseID, ExamNo, ExamMark, DateTaken, ExamType) VALUES
(128569, 2001, 12, 60, '01-01-2023', "Final"),
(128569, 2001, 24, 40, '14-01-2023', "Final"),
(128534, 2032, 45, 80, '01-01-2023', "Final"),
(128534, 2032, 21, 35, '14-01-2023', "Final"),
(128725, 2016, 56, 94, '01-01-2023', "Final"),
(128725, 2016, 76, 55, '14-01-2023', "Final"),
(128163, 2004, 14, 76, '01-01-2023', "Final"),

CREATE TABLE Module(
    ModuleID INT NOT NULL AUTO_INCREMENT,
    ModuleName VARCHAR(50) NOT NULL,
    PRIMARY KEY(ModuleID)
);

INSERT INTO Module (ModuleID, ModuleName) VALUES
(123, 'Cloud Computing'),
(124, 'Database'),
(122, 'Digital Imgage Processing'),
(127, 'Algorithm'),
(129, 'Human-Computer Interaction'),
(125, 'Network Security'),
(126, 'Analytics'),
(130, 'Program Efficiency');

CREATE TABLE Includes ( 
    ModuleID INT NOT NULL,
    CourseID INT NOT NULL,
    PRIMARY KEY( CourseID, ModuleID),
    FOREIGN KEY (CourseID) REFERENCES Courses(CourseID),
    FOREIGN KEY (ModuleID) REFERENCES Module(ModuleID)
);

INSERT INTO Includes (ModuleID, CourseID) VALUES
(123, 2004),
(124, 1010),
(122, 1000),
(127, 2032),
(129, 2016),
(125, 2001),
(126, 3001),
(130, 2002),

CREATE TABLE Stuff(
    StuffID INT NOT NULL AUTO_INCREMENT,
    Sex VARCHAR(1) NOT NULL DEFAULT "M",
    StuffEmail VARCHAR(50) NOT NULL,
    Salary DECIMAL(8, 2) NOT NULL,
    Address VARCHAR(100) NOT NULL,
    PRIMARY KEY(StuffID)
);

INSERT INTO Stuff (StuffID, Sex, StuffEmail, Salary, Address) VALUES
(028563, 'M', '028563@myuct.ac.za', 250000, '29 Battersby St, Mowbray'),
(035569, 'F', '035569@myuct.ac.za', 300000, '02  Camac St, Contsantia'),
(024639, 'M', '024639@myuct.ac.za', 500000, '16 Milton St, Rodenbosch'),
(015879, 'F', '015879@myuct.ac.za', 280000, '11 Indian Queen Ln, Bellvile'),
(042810, 'F', '042810@myuct.ac.za', 300000, '07 Phill-Ellena Av, Weinberg'),
(012845, 'M', '012845@myuct.ac.za', 350000, '04 Dicks Rd, Observatory'),
(064972, 'F', '064972@myuct.ac.za', 250000, '16 Church St,Claremont');

CREATE TABLE TelephoneStuff ( 
    StuffID INT NOT NULL,
    telephoneStuff VARCHAR(10) NOT NULL,
    PRIMARY KEY(StuffID),
    FOREIGN KEY(StuffID) REFERENCES Stuff(StuffID) 
);

INSERT INTO Stuff (StuffID, Sex, StuffEmail, Salary, Address) VALUES
(028563, '+27 21 650 1234'),
(035569, '+27 21 660 2468'),
(024639, '+27 21 650 1357'),
(015879, '+27 21 670 9182'),
(042810, '+27 21 660 1428'),
(012845, '+27 21 680 7050'),
(064972, '+27 21 650 5136');

CREATE TABLE Lectures ( 
    ModuleID INT NOT NULL,
    StuffID INT NOT NULL ,
    Venue VARCHAR(30) NOT NULL,
    YearLec DATE NOT NULL,
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
    FOREIGN KEY (StudentID) REFERENCES Students(StudentID)
);

CREATE TABLE Department (
    DepartmentID INT NOT NULL AUTO_INCREMENT,
    DepartmentName VARCHAR(20) NOT NULL,
    PRIMARY KEY(DepartmentID)
);

CREATE TABLE WorksIn (
    DepartmentID INT NOT NULL,
    StuffID INT NOT NULL,
    YearEmployed DATE NOT NULL,
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