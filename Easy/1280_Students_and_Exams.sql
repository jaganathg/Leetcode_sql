CREATE TABLE IF NOT EXISTS Students (
    student_id INT,
    student_name VARCHAR(20)
);

CREATE TABLE IF NOT EXISTS Subjects (
    subject_name VARCHAR(20)
);

CREATE TABLE IF NOT EXISTS Examinations (
    student_id INT,
    subject_name VARCHAR(20)
);

TRUNCATE TABLE Students;

INSERT INTO Students (student_id, student_name) VALUES (1, 'Alice');
INSERT INTO Students (student_id, student_name) VALUES (2, 'Bob');
INSERT INTO Students (student_id, student_name) VALUES (13, 'John');
INSERT INTO Students (student_id, student_name) VALUES (6, 'Alex');

TRUNCATE TABLE Subjects;

INSERT INTO Subjects (subject_name) VALUES ('Math');
INSERT INTO Subjects (subject_name) VALUES ('Physics');
INSERT INTO Subjects (subject_name) VALUES ('Programming');

TRUNCATE TABLE Examinations;

INSERT INTO Examinations (student_id, subject_name) VALUES (1, 'Math');
INSERT INTO Examinations (student_id, subject_name) VALUES (1, 'Physics');
INSERT INTO Examinations (student_id, subject_name) VALUES (1, 'Programming');
INSERT INTO Examinations (student_id, subject_name) VALUES (2, 'Programming');
INSERT INTO Examinations (student_id, subject_name) VALUES (1, 'Physics');
INSERT INTO Examinations (student_id, subject_name) VALUES (1, 'Math');
INSERT INTO Examinations (student_id, subject_name) VALUES (13, 'Math');
INSERT INTO Examinations (student_id, subject_name) VALUES (13, 'Programming');
INSERT INTO Examinations (student_id, subject_name) VALUES (13, 'Physics');
INSERT INTO Examinations (student_id, subject_name) VALUES (2, 'Math');
INSERT INTO Examinations (student_id, subject_name) VALUES (1, 'Math');



select * from students;
select * from subjects;
select * from examinations;

select s.student_id, s.student_name, sb.subject_name, count(e.student_id) as attended_exams
from students as s
cross join subjects as sb
left join examinations as  e
	on s.student_id = e.student_id and sb.subject_name = e.subject_name
group by s.student_id, s.student_name, sb.subject_name
order by s.student_id, sb.subject_name;
	