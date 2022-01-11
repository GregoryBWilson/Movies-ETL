# Movies-ETL

## 1 Propose

Britta, who works for Amazing Prime, a large online movie provider wants to run a hackathon but doesn't want to use proprietary data in the process.  We have helped her develop a clean data set, from publicly available sources ,and have spent a great deal of time cleaning that data in preparation for the hackathon.  Britta like the outcome of our original work so much that she now wants to automate the process.  This project involved a scripted (I will explain this late), refactoring of the code developed through the earlier process to achieve automation.  As you are likely well aware, full automation of the Extract, Transform, Load (ETL) process would normally require the addition of at least some level of artificial intelligence, you will see that the results nevertheless are quite good. 

## 2 Deliverables

The original manual ETL process is documented, with markdown notes, in the Jupyter Notebook file Movies-ETL.ipynb found in this repoitory.  While this file is not a defined deliverable, it was used as a reference in the development of the following deliverable files:

- ETL_function_test.ipynb
- ETL_clean_wiki_movies.ipynb
- ETL_clean_kaggle_data.ipynb
- ETL_create_database.ipynb

Sequentially,  these files form the basis of moving information from a raw form to a form that can be used in further analysis or service delivery.  We will now go through the development of these files quickly so that we can get to the part where we discuss the observations and recommendations that will be provided to Britta and Amazing Prime.

### 2.1 Write an ETL Function to Read Three Data Files

While the figures in this report are available in the above referenced Jupyter Notebook file, they have be extracted for your convenience and for discussion purposes in this document.

Reading in the raw Wikipedia JSON,  wikipedia.movies.json file we are able to construct the wiki_movies_df dataframe file shown in figure 1.

![/Resources/1_ETL_function_test_wiki_movies_df_DataFrame.png](C:/Users/Greg/Carleton/Movies-ETL/Resources/1_ETL_function_test_wiki_movies_df_DataFrame.png "Figure 1  - Wiki Movies DataFrame")

***Figure 1  - Wiki Movies DataFrame***

A movies_metadata.csv file, from Kaggle, was read in to construct the kaggle_metadata dataframe shown in figure 2 below.

![/Resources/2_ETL_function_test_kaggle_metadata_df_DataFrame.png](C:/Users/Greg/Carleton/Movies-ETL/Resources/2_ETL_function_test_kaggle_metadata_df_DataFrame.png "Figure 2  - Kaggle Metadata DataFrame")

***Figure 2  - Kaggle Metadata DataFrame***

A huge csv file of more than 26 million movie rates where read in to create the dataframe of ratings shown in figure 3.

![/Resources/3_ETL_function_test_ratings_DataFrame.png](C:/Users/Greg/Carleton/Movies-ETL/Resources/3_ETL_function_test_ratings_DataFrame.png "Figure 3  - Ratings DataFrame")

***Figure 3  - Ratings DataFrame***

### 2.2 Extract and Transform the Wikipedia Data

This part of the ETL process is truly the heavy lifting.  This is the part where the data is analyzed in detail to determine appropriate patterns that can be used to extract and transform the data.  The objective is to take the best possible data from the most relevant sources and combine it into a simple entity that will be of use.  I truth, if done correctly, the whole is worth more than the sum of the parts.  Wikipedia data is particularly difficult to manage as it is built by a number of different contributors.  Figure 4 below shows the results of the cleaned wiki data.

![4_ETL_clean_wiki_movies_wiki_movies_Dataframe.png](C:/Users/Greg/Carleton/Movies-ETL/Resources/4_ETL_clean_wiki_movies_wiki_movies_Dataframe.png "Figure 4  - Clean Wiki Movies DataFrame")

***Figure 4  - Clean Wiki Movies DataFrame***

Wiki data also includes a large number of columns, the useful and well populated ones where kept and are listed in figure 5 below.

![5_ETL_clean_wiki_movies_wiki_movies_column_list.png](C:/Users/Greg/Carleton/Movies-ETL/Resources/5_ETL_clean_wiki_movies_wiki_movies_column_list.png "Figure 5  - Wiki Movies Column List")

***Figure 5  - Wiki Movies Column List***

### 2.3 Extract and Transform the Kaggle Data

Kaggle data is somewhat more structured, however, it does need to be matched up with available data from Wikipedia.  This information is show in figures 6 and 7 below.

![/Resources/6_ETL_clean_kaggle_data_movies_with_ratings_df_DataFrame.png](C:/Users/Greg/Carleton/Movies-ETL/Resources/6_ETL_clean_kaggle_data_movies_with_ratings_df_DataFrame.png "Figure 6  - Clean Kaggle Data with Ratings DataFrame")

***Figure 6  - Clean Kaggle Data with Ratings DataFrame***



![/Resources/7_ETL_clean_kaggle_data_movies_df_DataFrame.png](C:/Users/Greg/Carleton/Movies-ETL/Resources/7_ETL_clean_kaggle_data_movies_df_DataFrame.png "Figure 7  - Clean Kaggle Data Movies DataFrame")

***Figure 7  - Clean Kaggle Data Movies DataFrame***

### 2.4 Create the Movie Database

The final product is then loaded into a Postgres database.  For this section I will be reviewing  both the pre and post refactoring results.  In figure 8 we can see that the original cleaning work that was done on the data resulted in a file containing 6051 movies as shown in figure 8 below.  This is one less than the 6052, and I suspect that that is due to the manual rejection of one outlier movie.

![/Resources/movies_query_original.png](C:/Users/Greg/Carleton/Movies-ETL/Resources/movies_query_original.png "Figure 8 - Movies Query from Manual Process")

***Figure 8 - Movies Query from Manual Process***

In figure 9 you can see that the refactored and automated cleaning produce a list of 6075.  It can be expected that full automation would not clean to the same degree, but it is pretty good.  Later I will discuss observations that may improve this outcome.

![/Resources/movies_query.png](C:/Users/Greg/Carleton/Movies-ETL/Resources/movies_query.png "Figure 9  - Movies Query from Automation")

Figure 9  - Movies Query from Automation

Being much more structure you can see that the cleaning of ratings data for the original manual process, figure 10 and the automated process figure 11 resulted in the same 26, 024, 289 results.

![/Resources/ratings_query_original.png](C:/Users/Greg/Carleton/Movies-ETL/Resources/ratings_query_original.png "Figure 10  - Ratings Query from Manual Process")

***Figure 10  - Ratings Query from Manual Process***



![/Resources/ratings_query.png](C:/Users/Greg/Carleton/Movies-ETL/Resources/ratings_query.png "Figure 11  - Ratings Query from Automation")

***Figure 11  - Ratings Query from Automation***





## 3 Discussion and Recommendations

As I mentioned in the opening section of this document, the automation of the cleaning process was scripted - meaning that we were provided with the steps that would be used to determine the outcome.  Having spent a great deal of time working with the data while developing the original cleaning process I know that it is possible to clean down to 6051.  In order to verify that the automation was consistent with my initial thought process I would normally have taken exactly the same steps in the same order as I did originally, thus being able to verify the outcomes at every decision point.  Never the less, this automation did present a valuable challenge and I did spend a lot more time writing new code to test my questioning of the final product.

I have two tools that I used:

- A small number of short SQL Queries can be found in the Analysis folder in file verfication_testing.sql .  These queries provide information that can be extracted from the original and the automated databases to test assumptions about what, if anything, could have been missed in the automated cleaning process.
- In the main Movies-ETL folder, along with the other Jupyter Notebook files, is the file Compare_Movie_Automation_to_Manual.ipynb that I developed to use the power of dataframes to really see what was going on with the two files.

The difference between the 6075 in the automation and the 6051 of my original cleaning are 24 files, all of which can be accounted for.  If deemed worthwhile, in terms of time, it is possible that most if not all could be handled by an automated procees.

The automation of the movie data resulted in the following outcomes

### 3.1 Movies remaining after cleaning

- I ran this query to get the total count, SELECT count(*) FROM movies;

- Before automation 6051

- After automation 6075

- Conclusion 24 movies were not cleaned through automation


What movies are they and why were they not cleaned - 17 look like they have null imdb_id numbers, one is an outlier (manual), and I have imdb_id number and other data for the 6 remaining rows if further investigation is warranted.

### 3.2 One Movie was an Outlier

The use of plots to conduct reasonability checks on ratings data, as shown in figure 12, was quite an enlightening revelation for me.  It is so easy to see that while that data is not exact between Kaggle and Wikipedia, it is very consistent.  The one outlier is very easy to see.  AI could also see it, but may not be worth that effort.



<img src="C:/Users/Greg/Carleton/Movies-ETL/Resources/Outliner_Movie.png" alt="/Resources/Outliner_Movie.png" title="Figure 12  - Identification of Outliers" style="zoom:150%;" />

***Figure 12  - Identification of Outliers***

Here is the entry in the original code that removes that outlier.  

movies_df = movies_df.drop(movies_df[(movies_df['release_date_wiki'] > '1996-01-01') & (movies_df['release_date_kaggle'] < '1965-01-01')].index)

A simple comparison of the ratio of Kaggle to Wikipedia could also be implemented if desired. 

### 3.3 Resolving missing data

Table 1 below was developed, in the original analysis of cleaning, in order to decide what to keep and how to resolve differences. 

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

***Table 1 - Resolution Table***

I the next few sections I looked at what, if anything, has been missed from this table.

#### 3.3.1 Title is Null

- SELECT count(*) FROM movies WHERE title IS Null;

- No Titles are missing from either database.


#### 3.3.2 Runtime is Null

- SELECT count(*) FROM movies WHERE runtime IS Null;

- Seven Runtimes are missing from the automated cleaning database.

- One Runtime was missed in the original database.

- A difference of 6.


#### 3.3.3 Budget is Null

- SELECT count(*) FROM movies WHERE budget IS Null;

- 1440 from the original database have zero budget.

- 1459 from the automated database have zero budget.

- A difference of 19 were missed.


#### 3.3.4 Revenue is Null

- SELECT count(*) FROM movies WHERE revenue IS Null;

- 800 are missing from the original database.

- 903 are missing from the automated database.

- A difference of 103.


#### 3.3.5 Release_date is Null

- SELECT count(*) FROM movies WHERE release_date IS Null;

- 0 are missing from the original database.

- 3 are missing from the automated database.

#### 3.3.6 Original_language is Null

- SELECT count(*) FROM movies WHERE original_language IS Null;

- 0 are missing from the original database.

- 0 are missing from the automated database.

- This is an odd outcome - I need to investigate.


#### 3.3.7 Production_companies is Null

- SELECT count(*) FROM movies WHERE production_companies IS Null;

- 0 are missing from the original database.

- 0 are missing from the automated database.

- This is an odd outcome - I need to investigate.


#### 3.3.8 Null imdb

- SELECT count(*) FROM movies WHERE imdb_id is Null; 

- 0 are missing from the original database.

- 17 are missing from the automated database

## 4 Summary

I didn't get the 6052 number that was listed as the expected outcome of the refactoring.  I did however identify that of the 6075 that were cleaned I could add to the code to get the number down by 18 i.e. 17 nulls and 1 automated outlier.  In order to resolve the remaining 6 I would need to review the identified rows to see why they remained and either add to or modify the existing code.

I understand that the challenge process had to be scripted, but my recommendation to Britta would be of me to walk through my original code and in order extract code into new function, like the one presented in the challenge, that way each and every step could be verfiy.

It can be seen in section 3 above that a lot of the data resolution has not been completed in the automation - most of that required manual intervention - however it could be added now if we believe (for example) that the Kaggle data will always be better than Wikipedia.  Bottom-line,  the ETL process is a much needed process that requires a great deal of thought to do correctly and Amazing Prime should protect their investment by making sure they have the right people on thegit stat job.
