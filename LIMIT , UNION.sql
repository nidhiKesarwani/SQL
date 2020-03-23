--  Query the two cities in STATION with the shortest and longest CITY names, as well as their respective lengths (i.e.: number of characters in the name). If there is more than one smallest or largest city, choose the one that comes first when ordered alphabetically.
--  https://www.hackerrank.com/challenges/weather-observation-station-5/problem

SELECT CITY,LENGTH(CITY) AS LEN
FROM STATION 
ORDER BY LEN ASC, CITY ASC
LIMIT 1; -- this, and semi colon

SELECT CITY,LENGTH(CITY) AS LEN
FROM STATION 
ORDER BY LEN DESC, CITY ASC
LIMIT 1;
