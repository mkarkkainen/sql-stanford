/*
For each movie that has at least one rating, find the highest number of stars that movie received.
Return the movie title and number of stars. Sort by movie title.
*/SELECT
    Movie.title,
    Max(R.stars)
FROM
    Movie
JOIN
    Rating AS R ON R.mID = Movie.mID
GROUP BY
    Movie.title
ORDER BY
    Movie.title;
