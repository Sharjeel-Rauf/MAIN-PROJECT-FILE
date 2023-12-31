-- creating courses table
 create table Courses(
  CourseID int PRIMARY KEY,
  CourseName varchar(50)
  );
-- creating students table
create table Students (
  StudentID int PRIMARY KEY,
  FirstName varchar(50),
  LastName varchar(50),
  Age int,
  CourseID int references Courses(CourseID) 
  );
-- printing the created table
 select * from Students;
 --Task 3:
 -- inserting records in courses table 
 insert into Courses (CourseID,CourseName) values 
		(1, 'Data structures'),
		(2, 'Object oriented programming'),
		(3, 'Microprocessor systems'),
		(4, 'fundamentals of computing'),
		(5, 'introduction to computing');
-- printing the courses table
select * from Courses;
-- inserting records in students table
 insert into Students (StudentID,FirstName,LastName,Age,CourseID) values 
		(1001, 'Ali','Ahmed',18,1),
		(1002, 'Maria','Sultan',19,4),
		(1003, 'Zia','Rahman',21,5),
		(1004, 'Anum','Batool',19,4),
		(1005, 'Shaheen','Nawaz',18,1),
		(1006, 'Taha','Nazeer',23,4),
		(1007, 'Maira','Ali',19,4),
		(1008, 'Muhammad','Abuzar',17,4),
		(1009, 'Raiqa','Tanveer',22,3),
		(1010, 'Hina','Yasir',18,5);
-- printing the students table
select * from Students;

--Reading operation

CREATE PROCEDURE GetAllStudents
AS
BEGIN
    SELECT * FROM Students;
END;
GO

Select *from Students;

--Creating operation
CREATE PROCEDURE StudentsAdd
    @StudentID INT,
	@FirstName VARCHAR(50),
	@LastName VARCHAR(50),
    @Age INT,
    @CourseID INT
AS
BEGIN
    INSERT INTO Students (StudentID, FirstName, LastName, Age, CourseID)
    VALUES (@StudentID, @FirstName, @LastName,@Age,@CourseID);
END;
GO
--UPDATING OPERATION
EXEC StudentsAdd 1011,'Sharjeel','Rauf',21,3

Select *from Students;

CREATE PROCEDURE UpdateStudentinfo
    @StudentID INT,
	@NewFirstName varchar(50),
    @NewLastName varchar (50),
	@NewAge INT,
	@NewCourseID INT
AS
BEGIN
    UPDATE Students
    SET FirstName=@NewFirstName, LastName=@NewLastName, Age = @NewAge, CourseID=@NewCourseID
    WHERE StudentID = @StudentID;
END;
GO

EXEC UpdateStudentinfo 1010, 'Yameen','Khan',19,3
Select *from Students;

--Deleting student
CREATE PROCEDURE DeleteStudent
    @StudentID INT
AS
BEGIN
    DELETE FROM Students
    WHERE StudentID = @StudentID;
END;
GO
EXEC DeleteStudent 1011

-- READING COURSES OPS
CREATE PROCEDURE GetAllCourses
AS
BEGIN
SELECT*FROM Courses;
END;
GO
SELECT*FROM Courses;

--CREATING COURSES OPS
CREATE PROCEDURE AddCourses
@CourseID INT,
@CourseName VARCHAR(50)
AS
BEGIN
INSERT INTO COURSES (CourseID,CourseName)
Values (@CourseID,@CourseName);
END;
GO

EXEC AddCourses 6,'Databases and design'

--UPDATING COURSES OPS
CREATE PROCEDURE UpdateCoursesinfo
	@CourseID INT,
	@NewCourseName VARCHAR(50)
AS
BEGIN
	UPDATE Courses
	set CourseName=@NewCourseName
	where CourseID=@CourseID;
END;
GO
exec UpdateCoursesinfo 6,'Digital Logic Design'

--Deleting Courses
create procedure DeleteCourses
	@CourseID INT
AS
BEGIN
	DELETE FROM Courses
	WHERE CourseID=@CourseID;
END;
GO
exec DeleteCourses 6
SELECT*FROM Courses;

--Task9 1. Listing all students older than 20
CREATE PROCEDURE Older_than_20
AS
BEGIN

SELECT FirstName,LastName FROM Students WHERE Age > 20;

END;
GO
--2. Find the total number of students for each course.
CREATE PROCEDURE ListAllStudentinCourse
AS
BEGIN

select FirstName,LastName,CourseID from Students where CourseID IN
		(select CourseID from Courses where CourseName='introduction to computing');

END;
GO
--3.	Find the most popular course (the course with the most students enrolled).
CREATE PROCEDURE Most_popular
AS
BEGIN
	SELECT TOP 1 Courses.CourseName, COUNT(*) AS EnrolledStudents
FROM Courses
JOIN Students ON Courses.CourseID = Students.CourseID
GROUP BY Courses.CourseName
ORDER BY EnrolledStudents DESC;

END;
GO