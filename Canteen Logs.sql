--https://www.hackerearth.com/problem/sql/canteen-logs/
/*

Fredo and his friends regularly visit their college canteen. As with any group, on a day , one of the friends pays the canteen bill of all the friends. You are given a table of logs which shows the entries of transactions between friends. The table consists of three fields as described below:
1. P1: Name of the person who pays the bill.
2. P2: Name of the person whose bill is paid by P1.
3. amount: Amount paid by P1 for P2.

You have to summarise the transaction between all pairs of friends. See the sample input and output for explanation.

Table : logs

Field	 Type
P1	   text
P2	   text
amount int

*/
SELECT A.P1, A.P2, (A.net-B.net) as DIFF
FROM ( SELECT P1,P2, SUM(amount) as net
       FROM logs
       GROUP BY P1, P2
     ) AS A,
    ( SELECT P1,P2, SUM(amount) as net
      FROM logs
      GROUP BY P1, P2
    ) AS B

WHERE A.P1 = B.P2 AND A.P2 = B.P1
GROUP BY A.P1, A.P2
HAVING DIFF>0;
