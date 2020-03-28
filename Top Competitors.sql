/*
https://www.hackerrank.com/challenges/full-score/problem
*/

SELECT H.hacker_id, H.name
FROM Hackers H
INNER JOIN Submissions S
ON H.hacker_id = S.hacker_id
INNER JOIN Challenges C
ON S.challenge_id = C.challenge_id 
INNER JOIN Difficulty D
ON C.difficulty_level = D.difficulty_level

WHERE S.score = D.score
GROUP BY H.hacker_id, H.name
HAVING COUNT(S.challenge_id)>1    -- we can use aggregate  function in HAVING clause
ORDER BY COUNT(S.challenge_id) DESC, H.hacker_id   -- and ORDER BY 
