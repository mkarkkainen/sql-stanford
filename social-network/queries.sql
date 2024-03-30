/*
Q1:
Find the names of all students who are friends with someone named Gabriel.
*/

SELECT H1.name
FROM Highschooler H1
INNER JOIN Friend ON H1.ID = Friend.ID1
INNER JOIN Highschooler H2 ON H2.ID = Friend.ID2 AND H2.name = 'Gabriel';

/*
Q2:
For every student who likes someone 2 or more grades younger than themselves,
return that student's name and grade, and the name and grade of the student they like.
*/

SELECT H1.name, H1.grade, H2.name, H2.grade
FROM Highschooler H1
INNER JOIN Likes ON H1.ID = Likes.ID1
INNER JOIN Highschooler H2 ON H2.ID = Likes.ID2
WHERE (H1.grade - H2.grade) >= 2;

/*
Q3:
For every pair of students who both like each other, return the name and grade of both students.
Include each pair only once, with the two names in alphabetical order.
*/

SELECT H1.name, H1.grade, H2.name, H2.grade
FROM Highschooler H1
JOIN Likes L1 ON H1.ID = L1.ID1
JOIN Likes L2 ON H1.ID = L2.ID2 AND L1.ID2 = L2.ID1
JOIN Highschooler H2 ON L1.ID2 = H2.ID
WHERE H1.name < H2.name
ORDER BY H1.name, H2.name;

/*
Q4:
Find all students who do not appear in the Likes table (as a student who likes or is liked)
and return their names and grades. Sort by grade, then by name within each grade.
*/

SELECT name,grade
FROM Highschooler
WHERE Highschooler.ID NOT IN(SELECT ID1 FROM Likes UNION SELECT ID2 From Likes);

/*
Q5:
For every situation where student A likes student B, but we have no information
about whom B likes (that is, B does not appear as an ID1 in the Likes table), return A and B's names and grades.
*/

WITH Liked AS (
SELECT ID1, ID2
FROM Likes
WHERE ID2 NOT IN(SELECT ID1 From Likes)
)
SELECT h1.name, h1.grade, h2.name, h2.grade
FROM Highschooler h1
JOIN Liked ON h1.ID = Liked.ID1
JOIN Highschooler h2 ON h2.ID = Liked.ID2;

/*
Q6:
Find names and grades of students who only have friends in the same grade.
Return the result sorted by grade, then by name within each grade.
*/

SELECT name, grade
FROM Highschooler H1
WHERE ID NOT IN(
    SELECT ID1
    FROM Highschooler H2, Friend
    WHERE H1.ID = Friend.ID1 AND H2.ID = Friend.ID2 AND H1.grade <> H2.grade)
ORDER BY grade, name;
