select * from car_scrape

---Checking for distinct value
SELECT DISTINCT title FROM car_scrape;   ---nice to plot

---Checking for distinct value in location
SELECT DISTINCT location FROM car_scrape;

---Checking for distinct value
SELECT DISTINCT paint FROM car_scrape; ---nice to plot



---ANALYSIS
----Let's start by grouping cars revenue
select title, sum(price) Revenue
from car_scrape
group by title
order by 2 desc

-----Avergae price for each make and transmission
SELECT title, transmission, AVG(price) as avg_price
FROM car_scrape
GROUP BY title, transmission;

Group by fuel
SELECT title, fuel
FROM car_scrape
GROUP BY title, fuel;


---convert the price table data type to bigint so it can handle large number
ALTER TABLE car_scrape
ALTER COLUMN price bigint


---Find the average price for each unique combination of values in the fuel, engine, and transmission columns:
SELECT fuel, engine, transmission, AVG(price) as avg_price 
FROM car_scrape 
GROUP BY fuel, engine, transmission;


----Find the total number of cars for each unique combination of values in the fuel and engine columns:
SELECT fuel, engine, COUNT(*) 
FROM car_scrape GROUP BY fuel, engine;


----Find the total number of cars for each unique value in the engine column:
SELECT engine, COUNT(*) 
FROM car_scrape GROUP BY engine;

----Find the average price for each unique value in the year column:
SELECT year, AVG(price) as avg_price 
FROM car_scrape GROUP BY year;


----Find the average price for each unique value in the paint column:
SELECT paint, AVG(price) as avg_price 
FROM car_scrape GROUP BY paint;

----Find the average price for each unique value in the location column:
SELECT location, AVG(price) as avg_price 
FROM car_scrape GROUP BY location;

----Find the average price for cars with a manual transmission:
SELECT AVG(price) 
FROM car_scrape 
WHERE transmission = 'manual';


----Find the average price for cars with a automativ transmission:
SELECT AVG(price) 
FROM car_scrape 
WHERE transmission = 'automatic';


---find the total number of manual cars
SELECT COUNT(*) 
FROM car_scrape 
WHERE transmission = 'manual';


---find the total number of automatic cars
SELECT COUNT(*) 
FROM car_scrape 
WHERE transmission = 'automatic';

----new, locally or foreign used
SELECT isimported, COUNT(*) 
FROM car_scrape GROUP BY isimported;

----Find the average, minimum, and maximum values for the odometer column:
SELECT AVG(odometer) as avg_odometer, MIN(odometer) as min_odometer, MAX(odometer) as max_odometer 
FROM car_scrape;


----- Fuel type count
SELECT fuel, COUNT(*) 
FROM car_scrape GROUP BY fuel;



-----List unique values in the fuel column
SELECT DISTINCT fuel FROM car_scrape;

-----Most Expensive car
SELECT * FROM
(
    SELECT *, ROW_NUMBER() OVER (ORDER BY price DESC) as row_number
    FROM car_scrape
) as temp_table
WHERE row_number <= 10;

-----cars with highest odometer reading
SELECT * 
FROM car_scrape 
ORDER BY odometer DESC;


---Lowest odometer reading
SELECT * 
FROM car_scrape 
ORDER BY odometer ASC;


----Find the cars with the highest price-to-odometer ratio:
SELECT title, price, odometer, price / odometer as price_to_odometer 
FROM car_scrape ORDER BY price_to_odometer DESC;

----cos i have odometer values with zero, the above code returned with an error. alternatively;
SELECT title, price, odometer,
    CASE
        WHEN odometer = 0 THEN 0
        ELSE price / odometer
    END as price_to_odometer
FROM car_scrape ORDER BY price_to_odometer DESC;























