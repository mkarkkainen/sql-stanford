/*
Find the difference between the average rating of movies released before 1980 and the average rating 
of movies released after 1980. 
(Make sure to calculate the average rating for each movie, then the average of those averages for 
movies before 1980 and movies after. Don't just calculate the overall average rating before and after 1980.)
*/
SELECT AVG(Before1980.avg) - AVG(After1980.avg)
FROM (
 	SELECT AVG(stars) AS avg
	FROM Movie
	INNER JOIN Rating USING(mId)
	WHERE year < 1980
	GROUP BY mId
) AS Before1980, (
  	SELECT AVG(stars) AS avg
  	FROM Movie
  	INNER JOIN Rating USING(mId)
  	WHERE year > 1980
  	GROUP BY mId
) AS After1980;
