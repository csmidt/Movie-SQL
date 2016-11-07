/*Select all columns and rows from the movies table*/
select *
from movies;

--Select only the title and id of the first 10 rows
select title, movieid
from movies
where movieid < '10';

--Find the movie with the id of 485
select title, movieid
from movies
where movieid ='485';

--Find the id (only that column) of the movie Made in America (1993)
select movieid
from movies
where title like '%Made in America%';
--489

--Find the first 10 sorted alphabetically
select movieid, title
from movies
where movieid <'11'
order by title ASC;

--Find all movies from 2002
select title, movieid
from movies
where title like'% (2002)';

--Find out what year the Godfather came out
select title, movieid
from movies
where title like '%Godfather%';

--Without using joins find all the comedies
select title, genres
from movies
where genres like '%Comedy%';

--Find all comedies in the year 2000
select title, genres
from movies
where genres like'%Comedy%' and title like '%(2000)%'

--Find any movies that are about death and are a comedy
select title, genres
from movies
where genres like '%Comedy%' and title like '%Death%';

--Find any movies from either 2001 or 2002 with a title containing super
select title
from movies
where title like '%Super%' and (title like '%(2001)%' or title like '%(2002)%');

--Find all the ratings for the movie Godfather, show just the title and the rating
select title, rating
from movies
  join ratings on movies.movieid = ratings.movieid
where movies.title like 'Godfather, The%';

--Order the previous objective by newest to oldest
select title, rating, timestamp
from movies
  join ratings on movies.movieid = ratings.movieid
where movies.title like 'Godfather, The%'
order by timestamp ASC;

--Find the comedies from 2005 and get the title and imdbid from the links table
select title, links.imdbid
from movies
  join links ON movies.movieid = links.movieid
where genres like '%Comedy%' and title like '%(2005)%';

--Find all movies that have no ratings
select title, ratings.rating
from movies
 left join ratings ON movies.movieid = ratings.movieid
where rating ISNULL;

--Find all fantasy movies using the many to many join between movies and genres through movie_genre table.
select title, genre.genres
from movies
  left OUTER JOIN (movie_genre JOIN genre ON (movie_genre.genre_id = genre.id))
where genres = '%Fantasy%';





