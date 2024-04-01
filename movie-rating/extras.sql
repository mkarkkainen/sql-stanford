SELECT R.name
FROM Reviewer R
JOIN (
	SELECT DISTINCT Rt.rID
	FROM Rating Rt
	WHERE Rt.mID = (
		SELECT M.mID
		FROM Movie M
		WHERE M.title = "Gone with the Wind"
	)
) T ON R.rID = T.rID;

SELECT Reviewer.name, Movie.title, Rating.stars
FROM Reviewer, Movie, Rating
WHERE Reviewer.rID = Rating.rID AND Movie.mID = Rating.mID AND
Movie.director = Reviewer.name;

SELECT Reviewer.name FROM Reviewer
UNION
SELECT Movie.title FROM Movie
ORDER BY Reviewer.name;

SELECT Movie.title
FROM Movie
WHERE Movie.mID NOT IN(SELECT DISTINCT Rating.mID
FROM Rating
WHERE Rating.rID = (SELECT Reviewer.rID 
FROM Reviewer
WHERE Reviewer.name = 'Chris Jackson'));
