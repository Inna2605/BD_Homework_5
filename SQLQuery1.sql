USE Academy
GO
--��������� ������� Curators �� GroupsCurators, �� �� ������ ��� ����� ��
DROP TABLE Curators
GO
DROP TABLE GroupsCurators
GO
-- ������ ���������� �������� DayOfWeek
ALTER TABLE Lectures ADD DayOfWeek INT;

-- ��������� �������� ������� ��� �������� �����
UPDATE Lectures SET DayOfWeek = 4 WHERE id = 7;
GO
ALTER TABLE Lectures ADD DayOfWeek INT NOT NULL CHECK (DayOfWeek >= 1 AND DayOfWeek <= 7);
GO

--1. ������� ������� ���������� ������� �Software Development�.
SELECT Departments.Name as Department, Count (Teachers.Surname) as CountTeachers
FROM Departments, Groups, GroupsLectures, Lectures, Teachers
WHERE Departments.Name = 'Software Development' and 
Departments.id = Groups.DepartmentId and Groups.id = GroupsLectures.GroupId 
and Lectures.id = LectureId and Teachers.id = Lectures.TeacherId
GROUP BY Departments.Name
GO

--2. ������� ������� ������, �� ���� �������� �Vadim Ponomarenko�.
SELECT CONCAT (Teachers.Name, ' ', Teachers.Surname) as Teacher, 
Count (Subjects.Name) as CountLecturs
FROM Subjects, Lectures, Teachers
WHERE Teachers.Name = 'Vadim' and Teachers.Surname = 'Ponomarenko' and
Teachers.id = Lectures.TeacherId and Subjects.id = Lectures.SubjectId
GROUP BY Teachers.Name, Teachers.Surname
GO

--3. ������� ������� ������, �� ����������� � ������� �D107�.
SELECT Lectures.LectureRoom as Room, Count (Subjects.Name) as CountSubjects
FROM Subjects, Lectures
WHERE Lectures.LectureRoom = 'D107' and Subjects.id = Lectures.SubjectId
GROUP BY Lectures.LectureRoom
GO

--4. ������� ����� �������� �� ������� ������, �� ����������� � ���.
SELECT Lectures.LectureRoom as Room, COUNT(Subjects.Name) as CountSubjects
FROM Subjects, Lectures WHERE Subjects.id = Lectures.SubjectId
GROUP BY Lectures.LectureRoom
GO

--5. ������� ������� ��������, �� �������� ������ ��������� �Andrii Goryanoi�.

--6. ������� ������� ������ ���������� ���������� Computer Science.
SELECT Faculties.Name, AVG(Teachers.Salary) as AverageSalary
FROM Faculties, Departments, Groups, GroupsLectures, Lectures, Teachers
WHERE Faculties.Name = 'Computer Science' and Faculties.id = Departments.FacultyId
and Departments.id = Groups.DepartmentId and Groups.id = GroupsLectures.GroupId
and Lectures.id = GroupsLectures.LectureId and Teachers.id = Lectures.TeacherId
GROUP BY Faculties.Name
GO

--7. ������� �������� �� ����������� ������� �������� ����� ��� ����.

--8. ������� ������� ���� ������������ ������.
SELECT AVG(Departments.Financing) as AverageFinancingDepartments
FROM Departments

--9. ������� ���� ����� ���������� �� ������� ������� ���� ��������.
SELECT CONCAT (Teachers.Name, ' ', Teachers.Surname) as Teacher, 
COUNT(Subjects.Name) as CountSubjects
FROM Teachers, Lectures, Subjects
WHERE Subjects.id = Lectures.SubjectId and Teachers.id = Lectures.TeacherId
GROUP BY Teachers.Name, Teachers.Surname
GO

--10. ������� ������� ������ ����� �������� �����.
SELECT DISTINCT Lectures.DayOfWeek, COUNT (Subjects.Name) as CountSubjects
FROM Subjects, Lectures
WHERE Subjects.id = Lectures.SubjectId
GROUP BY Lectures.DayOfWeek
GO

--11. ������� ������ �������� �� ������� ������, �� ������ � ��� ���������.
SELECT Lectures.LectureRoom, COUNT (Departments.Name) as CountDepartments,
Departments.Name as Department
FROM Departments, Groups, GroupsLectures, Lectures
WHERE Departments.id = Groups.DepartmentId and Groups.id = GroupsLectures.GroupId
and Lectures.id = GroupsLectures.LectureId 
GROUP BY Lectures.LectureRoom, Departments.Name
GO

--12.������� ����� ���������� �� ������� ��������, �� �� ��� ���������.
SELECT Faculties.Name, COUNT (Subjects.Name) as CountSubject
FROM Faculties, Departments, Groups, GroupsLectures, Lectures, Subjects
WHERE Faculties.id = Departments.FacultyId and Departments.id = Groups.DepartmentId
and Groups.id = GroupsLectures.GroupId and Lectures.id = GroupsLectures.LectureId
and Subjects.id = Lectures.SubjectId
GROUP BY Faculties.Name
GO

--13. ������� ������� ������ ��� ����� ���� ��������-��������.
SELECT CONCAT (Teachers.Name, ' ', Teachers.Surname) as Teacher, 
Lectures.LectureRoom as Room, Count (Subjects.Name) as CountSubject
FROM Subjects, Lectures, Teachers
WHERE Subjects.id = Lectures.SubjectId and Teachers.id = Lectures.TeacherId
GROUP BY Teachers.Name, Teachers.Surname, Lectures.LectureRoom
GO
