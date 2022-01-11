-- My movie count was 6075 it is suppose to be 6052, what did I do wrong?  I need to find 23 movies to remove
SELECT count(*) FROM movies; -- Should be 6052

-- Ratings count
SELECT count(*) FROM ratings;  -- should be 26,024, 289

-- Did any movies not get rated?  There were 42 of them
SELECT vote_count FROM movies ORDER BY vote_count ASC;
SELECT count(vote_count) as total_count FROM movies ORDER BY total_count ASC;

-- Here are the 42 movies, are any of them invalid?
SELECT count(*) FROM movies WHERE vote_count = 0;

-- 
SELECT * FROM movies WHERE vote_count = 0 ORDER BY Imdb_id ASC;

-- How many have a NULL Imdb_id?
SELECT * FROM movies WHERE imdb_id is Null; -- there are 17 that is good, I need 6 more

-- How many have NULL runtime
SELECT * FROM movies WHERE runtime is Null;  -- there are 7 here

-- How many have NULL runtime or imdb_id
SELECT * FROM movies WHERE (runtime is Null) OR imdb_id is Null;  -- this is now 18

-- How many movies are really old
SELECT * FROM movies WHERE release_date < '1965-01-01';  -- this is 7

-- Are there dupilcate imdb_ids


len(movies_df[(movies_df['release_date_wiki'] > '1996-01-01') & (movies_df['release_date_kaggle'] < '1965-01-01')].index) -- = 1




SELECT count(*) FROM movies; -- 6075 My current count ... should be 6052
SELECT * FROM movies WHERE imdb_id is Null;  --- How many have a NULL Imdb_id? 17
SELECT * FROM movies WHERE runtime is Null;  -- How many have NULL runtime? 7

6075 - 17 - 7 = 6051

-- I originally got 6051 becuase we dropped one rogue movie.  
-- The refactoring didn't ask for everything we did before so now the answer is 6075 not 6052.