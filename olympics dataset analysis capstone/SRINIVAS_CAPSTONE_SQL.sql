-- Queries:

-- 1. Find the average number of medals won by each country

-- Answer: for geeting the average number of medals won by each country:
-- 		   We need to groupby country to get each country and select average function for getting average medals won by that country.
SELECT country ,AVG(total_medal) as 'Average Medals won' from `olympix_master_2` GROUP BY country;

-- 2. Display the countries and the number of gold medals they have won in decreasing order

-- Answer: we need to use sum function to get total gold medals and groupby on countries to get number of gold medals by that country.
-- 		   also we have to use orderby SUM(gold_medal) DESC to get number of gold medals in decreasing order.
SELECT country ,SUM(gold_medal) as 'Gold Medals won' from `olympix_master_2`
GROUP BY country
ORDER BY SUM(gold_medal) DESC;


-- 3. Display the list of people and the medals they have won in descending order, grouped by their country

-- Answer: we need to use sum function on all medals to get the total medals and groupby on country and name to get list of people and the medals they have won.
-- 		   also we have to use orderby SUM(total_medal) DESC to get medals they have won in descending order. 
SELECT name, country ,
SUM(gold_medal) as 'Gold Medals' ,
SUM(silver_medal) as 'Silver Medals',
SUM(brone_medal) as 'Bronze Medals',
SUM(total_medal) as 'Total Medals' from `olympix_master_2`
GROUP BY country, name
ORDER BY SUM(total_medal) desc;


-- 4. Display the list of people with the medals they have won according to their their age

-- Answer: we need to use sum function on all medals to get the total medals and groupby on name,age to get list of people and the medals they have won with age.
-- 		   also we have to use orderby age and sum(total_medal) DESC to get medals they have won in descending order of age. 
SELECT name, age ,
SUM(gold_medal) as 'Gold Medals' ,
SUM(silver_medal) as 'Silver Medals',
SUM(brone_medal) as 'Bronze Medals',
SUM(total_medal) as 'Total Medals' from `olympix_master_2`
GROUP BY name,age
ORDER BY age desc,SUM(total_medal) desc;

-- 5. Which country has won the most number of medals (cumulative)
-- Answer: for getting the country with maximum number of medals we have to group by country and select sum(total_medal) and 
-- then order by in decreasing order of sum(total_medal) and use limit 1 function to get country has won the most number of medals (cumulative)
select country, sum(total_medal) as max_medal from `olympix_master_2` 
group by country 
order by max_medal desc  limit 1;
