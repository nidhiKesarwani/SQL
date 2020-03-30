
--      https://www.hackerearth.com/challenges/competitive/march-sql-challenge/problems/

/*

Mishki is the principal of a school and she wants the names of some of the exceptional students who study in her school..

She has 2 tables with details about each student.

First:
It will comprise the following information related to the first semester:
ID (Student's Id)
Student (Student's Name)
Subject (Subject Name)
Marks (Marks scored in a subject)

Second:
It will comprise the following information related to the second semester:
ID (Student's Id)
Subject (Subject Name: refers to a lecture)
Test (contains “Yes” (without quotes) if a test took place for a lecture, else “No” (without quotes))

She needs to determine the student names of the first semester, who attended lectures on their favorite subjects in the second semester and have given more than or equal to 2 tests (in that subject)
“Favorite subject” refers to the subject in which the student has scored the highest marks (as against other subjects) in the first semester.

Help her for the same, and output the Student Names in the lexicographically increasing order.

Note:
1) In the First table, no student will have same marks in 2 subjects.
2) In the Second table, there can be multiple same rows. Refer Sample data for more clarity. 3) All the Student ID will be unique

Table : First

Field	   Type
ID	     int
Student	 int
Subject	 Text
Marks	   int

Table: Second

Field	  Type
ID	    int
Subject	Text
Test	  Text


*/



SELECT max_marks.Student
FROM (SELECT ID, Student, MAX(Marks) as m
     FROM First
     GROUP BY ID, Student) AS max_marks JOIN  (SELECT ID, subject, COUNT(Test) AS num
                                               FROM Second
                                               WHERE Test = "Yes"
                                               GROUP BY ID, subject
                                              ) AS count_test
ON max_marks.ID = count_test.ID 
WHERE count_test.subject = ( SELECT subject
                             FROM First
                             WHERE ID=max_marks.ID AND Marks = max_marks.m)  AND count_test.num>=2;
