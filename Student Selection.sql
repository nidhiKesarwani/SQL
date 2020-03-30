--               https://www.hackerearth.com/problem/sql/student-selection/description/


/*

You have been given 3 pieces of Information about the Students studying at XYZ University in the form of a 'Students' Table. The 3 pieces of information include their 'Name','Age' and 'Height'.

Now, there are a total of N students studying at the University, where N equals the number of rows in the 'Students' table. Now, the University has an Annual Sports day coming up, and for that, they need to select 3 students among the N students  for the final event.

The University Dean considers the strength of a group of students to be the summation of the heights of all students within the group. Now, the Sports president of the university selects a group of exactly 3 students at random among the N students, where the probability of each student being selected for the final event is the same.

Now, you are required to find the Expected Value of the Strength of the group of 3 students selected for the final event. Round of your answer to 2 decimal places.

Can you do it ?

Input Format:
Table : Students

Field	  Type
Name	  text
Age	    int
Height	int

*/

SET @N = (SELECT COUNT(*) FROM Students);  -- total N
SET @frequency     = ((@N-1)*(@N-2))/2;    /* frequency of some element, in total summation of groups, choose this element, choose rest of two from remaining N-1 i.e. (N-1)C2  */
SET @combinations  = ((@N)*(@N-1)*(@N-2))/6;    -- NC3
SET @total = (@frequency)*(SELECT SUM(Height) FROM Students) ;
SET @ans = @total / @combinations;

SELECT ROUND(@ans, 2) AS answer;
