SELECT mark.Mark, student.StudentName, subjectt.subname 
from mark, student, subjectt
where mark.StudentID = student.StudentID and mark.SubID = subjectt.SubID
order by StudentName DESC;

SELECT S.StudentId, S.StudentName, C.ClassName
FROM Student S join Class C on S.ClassId = C.ClassID;
