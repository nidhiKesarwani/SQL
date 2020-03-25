---   https://www.hackerrank.com/challenges/the-report/problem

/*

Ketty gives Eve a task to generate a report containing three columns: Name, Grade and Mark. Ketty doesn't want the NAMES of 
those students who received a grade lower than 8. The report must be in descending order by grade -- i.e. higher grades are
entered first. If there is more than one student with the same grade (8-10) assigned to them, order those particular students 
by their name alphabetically. Finally, if the grade is lower than 8, use "NULL" as their name and list them by their grades 
in descending order. If there is more than one student with the same grade (1-7) assigned to them, order those particular 
students by their marks in ascending order.

*/




/*
Enter your query here.
*/

SELECT CASE WHEN G.Grade>=8 THEN S.Name
            ELSE 'NULL'
       END,                              G.Grade , S.Marks
FROM   Students S, Grades G
WHERE  G.Grade = (Select P.Grade
                  FROM Grades P
                  WHERE S.Marks >= P.Min_Mark AND S.Marks <= P.Max_Mark)
ORDER BY G.Grade DESC, S.Name;
