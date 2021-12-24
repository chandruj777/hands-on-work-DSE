CREATE SCHEMA IF NOT EXISTS Video_Games;
USE Video_Games;
SELECT * FROM Video_Games_Sales;

# 1. Display the names of the Games, platform and total sales in North America for respective platforms.
select name,platform,na_sales+eu_sales+jp_sales+global_sales+other_sales as total_sales from video_games_sales group by platform;

# 2. Display the name of the game, platform , Genre and total sales in North America for corresponding Genre as Genre_Sales,total sales for the given platform as Platformm_Sales and also display the global sales as total sales .
# Also arrange the results in descending order according to the Total Sales.


# 3. Use nonaggregate window functions to produce the row number for each row 
# within its partition (Platform) ordered by release year.
select *,row_number() over (partition by platform order by year_of_release) from video_games_sales;

# 4. Use aggregate window functions to produce the average global sales of each row within its partition (Year of release). 
#Also arrange the result in the descending order by year of release.
select name,year_of_release,global_sales,avg(global_sales) over (partition by year_of_release order by year_of_release desc) from video_games_sales;#agg fun are count,min,max,sum. 

# 5. Display the name of the top 5 Games with highest Critic Score For Each Publisher. 
select * from 
(select name,platform,dense_rank() over (partition by publisher order by critic_score desc) as critic_rank 
from video_games_sales) as A where critic_rank<=5;
#select name from video_games_sales where critic_score in (select max(critic_score) from video_games_sales group by publisher);
#each and every publisher ka  highest critic score ka coresponding name of game is displayed.


------------------------------------------------------------------------------------
# Dataset Used: website_stats.csv and web.csv
------------------------------------------------------------------------------------
select * from website_stats;
# 6. Write a query that displays the opening date two rows forward i.e. the 1st row should display the 3rd website launch date

# 7. Write a query that displays the statistics for website_id = 1 i.e. for each row, show the day, the income and the income on the first day.
select day,income,first_value(income) over (order by day) from website_stats where website_id=1;
#select distinct publisher from video_games_sales;
-----------------------------------------------------------------
# Dataset Used: play_store.csv 
-----------------------------------------------------------------
select * from play_store;
# 8. For each game, show its name, genre and date of release. In the next three columns, show RANK(), DENSE_RANK() and ROW_NUMBER() sorted by the date of release.
select  name,genre,released,rank() over (order by released asc) ,
dense_rank() over (order by released),row_number() over (order by released) from  play_store;#select distinct name can be used too.
