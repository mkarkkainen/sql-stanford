/* For all cases where the same reviewer rated the same movie twice
and gave it a higher rating the second time, return the reviewer's name and the title of the movie.
*/SELECT
    Reviewer.name,
    Movie.title
FROM
    Rating AS R1
JOIN Rating AS R2
    ON R1.mID = R2.mID
    AND R1.rID = R2.rID
    AND R1.ratingDate < R2.ratingDate
    AND R1.stars < R2.stars
JOIN Movie
    ON R1.mID = Movie.mID
JOIN Reviewer
    ON R1.rID = Reviewer.rID;
