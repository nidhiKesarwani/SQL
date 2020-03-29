--  https://www.hackerearth.com/problem/sql/little-shino-and-swaps/

/*

Teachers of ByteSchool created a table of score of students in two exams. Since the data is manually created, the teachers of the school have accidentally swapped the marks of some students. Swapping means score of exam 1 is written in score of exam 2 and vice versa. Teachers don't want to correct it manually again so they ask for your help.

You are given two tables.

Marks: Contains the student ids and scores of students in two exams.
Students: Contains the student ids whose entries are swapped ( all the student ids are unique ).

Using these two tables you have to correct the entries of Marks.

The output table should be in increasing order of StudentId.

*/


UPDATE Marks M1, Marks M2, Students 
SET M1.score1 = M2.score2, M1.score2 = M2.score1 
WHERE M1.StudentId = M2.StudentId and M1.StudentId=Students.StudentId; 


SELECT * 
FROM Marks;
