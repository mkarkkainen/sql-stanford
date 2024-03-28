/*
For each movie, return the title and the 'rating spread', that is, the difference between highest
and lowest ratings given to that movie. Sort by rating spread from highest to lowest, then by movie title.
*/

SELECT
    Movie.title,
    MAX(Rating.stars) - MIN(Rating.stars) AS RatingSpread
FROM
    Movie
JOIN
    Rating ON Rating.mID = Movie.mID
GROUP BY
    Movie.title
ORDER BY
    RatingSpread DESC, Movie.title;
