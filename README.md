# Movies-ETL

The automation of the movie data resulted in the following outcomes



## Movies remaining after cleaning

I ran this query to get the total count

SELECT count(*) FROM movies;

Before automation 6051

After automation 6075

Conclusion 24 movies were not cleaned through automation

what movies are they and why were they not cleaned?



## Reasonability Checks on Ratings Data

### One Movie was an Outlier

I clearly remember manually dropping at least one movie, because the data was corrupted.

![](C:\Users\Greg\Carleton\Movies-ETL\Resources\Outliner_Movie.png)

movies_df = movies_df.drop(movies_df[(movies_df['release_date_wiki'] > '1996-01-01') & (movies_df['release_date_kaggle'] < '1965-01-01')].index)

### Resolving missing data

|                       |                      |                                                 |
| :-------------------- | :------------------- | :---------------------------------------------- |
| **Wikipedia**         | **Kaggle**           | **Resolution**                                  |
| title_wiki            | title_kaggle         | Drop Wikipedia.                                 |
| running_time          | runtime              | Keep Kaggle; fill in zeros with Wikipedia data. |
| budget_wiki           | budget_kaggle        | Keep Kaggle; fill in zeros with Wikipedia data. |
| box_office            | revenue              | Keep Kaggle; fill in zeros with Wikipedia data. |
| release_date_wiki     | release_date_kaggle  | Drop Wikipedia.                                 |
| Language              | original_language    | Drop Wikipedia.                                 |
| Production company(s) | production_companies | **Drop Wikipedia.**                             |

## 

### See what, if anything, has been missed 

#### Title is Null

SELECT count(*) FROM movies WHERE title IS Null;

No Titles are missing from either database.

#### Runtime is Null

SELECT count(*) FROM movies WHERE runtime IS Null;

Seven Runtimes are missing from the automated cleaning database.

One Runtime was missed in the original database.

A difference of 6.

#### Budget is Null

SELECT count(*) FROM movies WHERE budget IS Null;

1440 from the original database have zero budget.

1459 from the automated database have zero budget.

A difference of 19 were missed.

#### Revenue is Null

SELECT count(*) FROM movies WHERE revenue IS Null;

800 are missing from the original database.

903 are missing from the automated database.

A difference of 103.

#### Release_date is Null

SELECT count(*) FROM movies WHERE release_date IS Null;

0 are missing from the original database.

3 are missing from the automated database.

#### Original_language is Null

SELECT count(*) FROM movies WHERE original_language IS Null;

0 are missing from the original database.

0 are missing from the automated database.

This is an odd outcome - I need to investigate.

#### Production_companies is Null

SELECT count(*) FROM movies WHERE production_companies IS Null;

0 are missing from the original database.

0 are missing from the automated database.

This is an odd outcome - I need to investigate.

#### Null imdb

SELECT count(*) FROM movies WHERE imdb_id is Null; 

0 are missing from the original database.

17 are missing from the automated database.

Why?



