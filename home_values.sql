
--How many distinct zip codes are in this dataset?
SELECT COUNT(DISTINCT zip_code) FROM home_value_data;



--How many zip codes are from each state?
SELECT COUNT(DISTINCT zip_code), state 
FROM home_value_data
GROUP BY state;


--What range of years are represented in the data?
--        Hint: The date column is in the format yyyy-mm. Try taking a look at using the substr() function to help extract just the year.
SELECT MIN (substr(date, 1,4)) AS start_year, MAX (substr(date, 1,4)) AS end_year
FROM home_value_data;

--Using the most recent month of data available, what is the range of estimated home values across the nation?
--        Note: When we imported the data from a CSV file, all fields are treated as a string. Make sure to convert the value field into a numeric type if you will be ordering by that field. See here 687 for a hint.
SELECT MIN(CAST(value AS INT)) AS min_value, MAX(CAST(value AS INT)) AS max_value
FROM home_value_data
WHERE date = '2018-11'


--Analysis: Explore how home value differ by region as well as change over time.

--Using the most recent month of data available, which states have the highest average home values? How about the lowest?
SELECT AVG(CAST(value AS INT)) AS avg_value, state
FROM home_value_data
WHERE date = '2018-11'
GROUP BY state
ORDER BY avg_value

--Which states have the highest/lowest average home values for the year of 2017? What about for the year of 2007? 1997?
		-- For 2017:
SELECT AVG(CAST(value AS INT)) AS avg_value, state, substr(date, 1,4) AS year
FROM home_value_data
WHERE year ='2017'
GROUP BY state
ORDER BY avg_value
		-- For 2007:
SELECT AVG(CAST(value AS INT)) AS avg_value, state, substr(date, 1,4) AS year
FROM home_value_data
WHERE year ='2007'
GROUP BY state
ORDER BY avg_value
		-- For 1997:
SELECT AVG(CAST(value AS INT)) AS avg_value, state, substr(date, 1,4) AS year
FROM home_value_data
WHERE year ='1997'
GROUP BY state
ORDER BY avg_value


--What is the percent change 180 in average home values from 2007 to 2017 by state?
--How about from 1997 to 2017?
--Hint: We can use the WITH clause to create temporary tables containing the average home values for each of those years, then join them together to compare the change over time.

WITH year1997 AS (
	SELECT state, substr(date,1,4) AS  "year", AVG(value) AS "avg"
	FROM home_value_data
	WHERE year = "1997"
	GROUP BY state
	), year2007 AS (
	SELECT state, substr(date,1,4) AS  "year", AVG(value) AS "avg"
	FROM home_value_data
	WHERE year = "2007"
	GROUP BY state
	), year2017 AS ( 
	SELECT state, substr(date,1,4) AS  "year", AVG(value) AS "avg"
	FROM home_value_data
	WHERE year = "2017"
	GROUP BY state
	)
SELECT year1997.state, ((year2017.avg - year2007.avg)/year2007.avg)*100 AS "2007 - 2017 % change", 
((year2017.avg - year1997.avg)/year1997.avg)*100 AS "1997 - 2017 % change"
FROM year2007
JOIN year2017
ON year2007.state = year2017.state
JOIN year1997
ON year2007.state = year1997.state;






--How would you describe the trend in home values for each state from 1997 to 2017? How about from 2007 to 2017? Which states would you recommend for making real estate investments?

--Overtime there home values have been increasing. While from 2007 to 2017 there have been some states with decreasing vlues, from  1997 to 2017 the trend is generally increasing. Home values in CA and DC have risen the most.
-- 	


