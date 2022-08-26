use quanlysinhvien;
SELECT 
(SELECT MAX(credit) FROM subject) AS LargestPrice,
( SELECT Max(mark) FROM mark) AS LargestMark
group by LargestPrice;

SELECT student.studentid, student.studentname, mark.mark FROM mark
left JOIN student on student.studentid = mark.studentid
ORDER BY mark.mark DESC