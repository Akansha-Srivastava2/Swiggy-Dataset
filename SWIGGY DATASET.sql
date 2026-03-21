-- name: akansha shrivastava
-- project of SQL real data set of SWIGGY.
USE swiggy;
-- 	Q1 Select all columns from the restaurant table.
SELECT * FROM  restaurants;

-- Q2 Display the names and cities of all restaurants.
SELECT name,city FROM restaurants;

-- Q3 Find all restaurants located in Bangalore.
SELECT * FROM restaurants 
WHERE city = "Bangalore";

-- Q4 List the names and ratings of restaurants with a rating greater than 4.0.
SELECT name, rating FROM restaurants 
WHERE rating >4.0;

-- Q5 Find restaurants where the cost is less than or equal to 300.
SELECT * FROM restaurants
WHERE cost <=300;

-- Q6 Display all distinct cuisine types available in the dataset.
SELECT DISTINCT cuisine FROM restaurants;

-- Q7 Find all restaurants serving Biryani cuisine.

SELECT cuisine ,name FROM restaurants 
WHERE cuisine = "Biryani";

--  Q8 Show the top 5 restaurants with the highest ratings.
SELECT * FROM restaurants
order by rating DESC 
LIMIT 5;

-- Q9 List restaurants with a rating count greater than 1000.
SELECT * FROM restaurants
WHERE rating_count >1000;

-- Q10 Count the total number of restaurants in the dataset.
SELECT count(*) FROM restaurants;

-- Q11 Find the average cost of all restaurants.
SELECT avg(cost) FROM restaurants;
select * , avg(cost) FROM resturants;

--  Q12 Display restaurant names and costs ordered by cost in ascending order.
SELECT name , cost FROM restaurants
order by cost ASC;

--  Q13 Find the average rating of restaurants for each city.
SELECT city,avg(rating) AS AVG_RATING_CITY FROM restaurants
GROUP BY city;

-- Q14 Count the number of restaurants available in each city.
SELECT city, count(name) AS NO_OF_RESTAURANTS FROM restaurants 
GROUP BY city ;

--  Q15 Find the maximum and minimum cost of restaurants for each cuisine.
SELECT cuisine, max(cost) AS MAX_COST,  min(cost) AS MIN_COST fROM restaurants
GROUP BY cuisine;

--  Q16 List cuisines that have more than 10 restaurants.
SELECT cuisine from restaurants
GROUP BY cuisine HAVING count(name)>10;

-- Q17 find the top 3 cities with the highest number of restaurants.
SELECT city , count(name) AS HIGHEST_NO_RES FROM restaurants
GROUP BY city
ORDER BY HIGHEST_NO_RES DESC
LIMIT 3;
 
-- Q18 Display the average cost of restaurants for each cuisine.
SELECT cuisine ,AVG(cost) FROM restaurants
GROUP BY cuisine; -- not correct 

update restaurants
set cost = 100
where cost < 100 ;


-- Q19 Find cities where the average restaurant rating is greater than 4.0.
SELECT city, avg(rating) AS AVG_RATING FROM restaurants
GROUP BY city
having rating >4.0;

-- Q20 List restaurants whose cost is higher than the average cost of all restaurants.

SELECT name ,cost 
FROM restaurants 
where cost > (select avg(cost) 
               from restaurants);


--  Q21 Find the total number of ratings (rating_count) for each city.
SELECT city,sum(rating_count) AS TOTAL_RATING_COUNT
 FROM restaurants
GROUP BY city;

-- Q22 Display cuisines ordered by their average rating in descending order.

SELECT cuisine ,AVG(rating) AS AVG_RATING
 FROM restaurants
GROUP BY cuisine
ORDER BY AVG_RATING DESC;

-- Q23 Find restaurants that have the highest rating within their city.
with best_res as(
SELECT name,city, AVG(rating) as Highest_rating 
FROM restaurants
GROUP BY name ,city
)
SELECT * FROM best_res 
WHERE Highest_rating =( SELECT MAX(Highest_rating) FROM best_res
                         order by Highest_rating DESC );

--  Q24 List cities that have more than one cuisine type available.
SELECT city, count(cuisine) FROM restaurants
GROUP BY city HAVING count(cuisine)>1;

-- Q25 Find the restaurant(s) with the maximum rating_count in the dataset.
SELECT name,max(rating_count) FROM restaurants
GROUP BY name;

-- Q26 which restaurants of dehli is visited by least number of people?
SELECT * FROM restaurants 
where city= "Delhi"
AND rating_count=(SELECT MIN(rating_count) FROM restaurants
				  where city = "Delhi");

-- Q27.which restaurants has generated maximum revenue all over india ?
SELECT * FROM restaurants;

SELECT rating_count*cost  AS Revenue FROM restaurants;

-- Q28 how many restaurants are having rating more than the average rating?

select count(*) FROM restaurants
where rating > (SELECT avg(rating)  FROM restaurants);

-- 	Q29 which restaurnats of delhi has genrated most revenue?
SELECT name, sum(rating_count * cost) as revenue 
FROM restaurants
WHERE city = "Delhi"
GROUP BY name
HAVING MAX(rating_count * cost);

SELECT name, sum(rating_count * cost) as revenue 
FROM restaurants
WHERE city = "Delhi"
GROUP BY name
ORDER BY revenue DESC
LIMIT 1 ;


-- Q30 which restaurants chain has maximum number of restaurnats?

SELECT * FROM restaurants ;
-- cte comman table expression
with result as(
select name , count(*) as chains
from restaurants 
GROUP BY name
)
select * FROM result 
where chains = ( SELECT max(revenue) from result);

-- Q31 which resturants chain has generated maximum revenue?
with max_rev as(
select name , sum(rating_count * cost) as revenue
from restaurants 
GROUP BY name
)
select * FROM max_rev
where revenue = ( SELECT max(revenue) from max_rev);

-- Q32 which city has mix number if res
with max_res as (
SELECT city , COUNT(*) as Name_of_res
FROM restaurants
Group by city)
select city From max_res
where Name_of_res=(select max(Name_of_res) from max_res);

-- Q33 which city has generated maximum revenue all over inida?
with city_max_rev as(
select city, SUM(rating_count * cost) as revenue
FROM resturants
group by city) 
select city FROM city_max_rev 
WHERE revenue =(SELECT MAX(revenue)from  city_max_rev);

-- Q34 which city has maximum foot fall all over india ?
with max_foot_fall as(
select city, SUM(rating_count) as foot_fall
FROM restaurants
group by city) 
select city FROM max_foot_fall 
WHERE foot_fall =(SELECT MAX(foot_fall)from  max_foot_fall);

-- Q35 list 10 least expensive cuisines?

SELECT  cuisine, max(cost)
FROM restaurants
GROUP BY cuisine
order by cuisine DESC
LIMIT 10;

-- Q36 What is the city is having Biryani as most popular cuisine
SELECT city, SUM( rating_count) AS POPULAR_CUISINE
FROM restaurants
WHERE cuisine = "Biryani"
GROUP BY city
ORDER BY POPULAR_CUISINE DESC
limit 1;

-- Q37 List top 10 unique restaurants with unique name only throughout the dataset 
-- as per generate maximum revenue (Single restaurant with that name)
WITH best_res as(
SELECT  name , rating_count*cost as revenue
FROM restaurants
GROUP BY name 
 )
SELECT name 
FROM best_res
WHERE revenue = (SELECT max(revenue) FROM best_res)
order by revenue desc
limit 10;

SELECT distinct name, max(rating_count * cost ) as revenue 
FROM restaurants 
GROUP BY name 
order by revenue desc
limit 10;

-- Q38 ROW_NUMBER 
SELECT * , ROW_NUMBER()
OVER(ORDER BY cost DESC) AS ROW_NUMBERS
FROM restaurants;
 -- 39 rank every restaurants form most expensive and least expensive 
 SELECT * ,RANK()
 OVER(order by cost DESC ) AS RANKING 
 FROM restaurants;
 
 -- Q39 Rank every restaurant from most visited to least visited.
 SELECT * , RANK()
 OVER(ORDER BY rating_count DESC) AS RANKING_VISITED
 FROM restaurants;
 
 -- Q40  Rank every restaurant from most expensive to least expensive as per their city.

SELECT name, city, RANK()
OVER(partition by city  ORDER BY cost DESC  ) AS BEST_CITY_RES
FROM restaurants;

-- Q41 Dense-rank every restaurant from most expensive to least expensive as per their city.
SELECT name, city, cost , DENSE_RANK()
OVER (PARTITION BY city ORDER BY cost DESC ) AS BEST_CITY 
FROM restaurants;

-- Q42Row-number every restaurant from most expensive to least expensive as per their city.
SELECT name , cost , city ,ROW_NUMBER()
OVER( PARTITION BY city ORDER BY cost DESC ) AS BEST_CITY_RES_ROW_NUM
FROM restaurants;

-- Q43 Rank the restaurant based on their prices (most to least expensive) 
-- as per cuisine using rank, dense_rank, and row_number.

SELECT name, cost , cuisine , rank()
over (PARTITION BY cuisine ORDER BY cost DESC) AS CUISINE_RANKING
FROM restaurants;

SELECT name, cost , cuisine , dense_rank()
over (PARTITION BY cuisine ORDER BY cost DESC) AS dense_CUISINE_RANKING
FROM restaurants;

SELECT name, cost , cuisine , row_number()
over (PARTITION BY cuisine ORDER BY cost DESC) AS row_num_CUISINE_RANKING
FROM restaurants;


-- IF condition 
SELECT name , cost ,
IF ( cots > 2000 , " expensive" , " moderate " ) 
from restaurnats ;

-- fine-dine,QSR,FASTFOOD(USING CASE WHEN)
SELECT name , cost ,
CASE 
    WHEN cost>=1000 THEN "FINE-DINE"
    WHEN  cost>=600 THEN " QSR"
    ELSE "FAST FOOD"
END AS type_of_res
FROM restaurants;

SELECT name,cost,rating,
CASE
    WHEN rating >=4 THEN " MOST POPULAR"
    WHEN rating>=2 THEN "POPULAR"
    ELSE " LEAST POPULAR"
END AS POPULALITY_OF_RES
FROM restaurants;
-- numerical function also apply 
SELECT name , cost, 
case
     when cost < 100 THEN cost + 100
     else cost 
END AS NEW_COST 
FROM restaurants;

-- Q44 Find top 5 restaurants of every city as per their revenue.
SELECT name, city, rating_count*cost as revenue ,DENSE_RANK()
OVER(PARTITION BY city  ORDER BY rating_count*cost ASC) AS best_5_res_of_each_city
FROM restaurants;

-- Q45 Find top 5 restaurants of every cuisine as per their revenue.
SELECT name, cuisine, rating_count*cost as revenue ,DENSE_RANK()
OVER(PARTITION BY rating_count*cost  order by cuisine ASC) AS best_5_res
FROM restaurants
limit 5;

