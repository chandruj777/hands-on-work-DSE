# 1.	Import the csv file to a table in the database.
use cricket;
select * from icc_test_batting_figures;

# 2.	Remove the column 'Player Profile' from the table.
alter table icc_test_batting_figures RENAME COLUMN  `Player Profile` to Player_Profile;
alter table icc_test_batting_figures drop column Player_Profile;

# 3.	Extract the country name and player names from the given data and store it in seperate columns for further usage.
create table ICC as 
SELECT *, SUBSTR(player, 1,INSTR(player, "(")-1) as playername,
SUBSTR(player, INSTR(player,"(")-1, LENGTH(player)) as countryname
FROM icc_test_batting_figures;
 
select * from ICC;


# 4.	From the column 'Span' extract the start_year and end_year and store them in seperate columns for further usage.
create table years as
SELECT *, SUBSTR(Span, 1,INSTR(Span, "-")-1) as start_year,
SUBSTR(Span, INSTR(Span,"-")+1, LENGTH(Span)) as end_year
FROM icc;

select * from icc;

# 5.	The column 'HS' has the highest score scored by the player so far in any given match. 
# The column also has details if the player had completed the match in a NOT OUT status. 
# Extract the data and store the highest runs and the NOT OUT status in different columns.
create table highest_runs as
SELECT *, SUBSTR(hs,1,INSTR(hs, "*")) as highest_runs
FROM icc;

drop view years;
# 6.	Using the data given, considering the players who were active in the year of 2019, 
# create a set of batting order of best 6 players using the selection criteria of those who have a good average score across all matches for India.
 select * from years;
 
 select player, avg , countryname from years where end_year = '2019' and  countryname like '%IND%' order by avg desc limit 6 ;


# 7.	Using the data given, considering the players who were active in the year of 2019, 
# create a set of batting order of best 6 players using the selection criteria of those who have highest number of 100s across all matches for India.
select player, avg , countryname,`100` from years where end_year = '2019'and  countryname like '%IND%'  order by `100` desc limit 6 ;

# 8.	Using the data given, considering the players who were active in the year of 2019, 
# create a set of batting order of best 6 players using 2 selection criterias of your own for India.

select player, avg , countryname from years where end_year = '2019'and  countryname like '%IND%' limit 6  ;

# 9.	Create a View named ‘Batting_Order_GoodAvgScorers_SA’ using the data given, considering the players who were active in the year of 2019, 
# create a set of batting order of best 6 players using the selection criteria of those who have a good average score across all matches for South Africa.
create view Batting_Order_GoodAvgScorers_SA as 
select player, avg , countryname from years where end_year = '2019' and  countryname like '%SA%' order by avg desc limit 6 ;

# 10.	Create a View named ‘Batting_Order_HighestCenturyScorers_SA’ Using the data given, considering the players who were active in the year of 2019,
# create a set of batting order of best 6 players using the selection criteria of those who have highest number of 100s across all matches for South Africa.

create view Batting_Order_HighestCenturyScorers_SA as
select player, avg , countryname,`100` from years where end_year = '2019' and  countryname like '%SA%' order by `100` desc limit 6 ;