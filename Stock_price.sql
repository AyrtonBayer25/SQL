--Write a query that determines counts of every single column. 
--Which column has the most null values?
select count(year) as year,
    count(month) as month,
    count(open) as open,
    count(high) as high,
    count(low) as low,
    count(close) as close,
    count(volume) as volume
from tutorial.aapl_historical_stock_price;

----Write a query to calculate the average opening price (hint: you will 
---need to use both COUNT and SUM, as well as some simple arithmetic.).
select sum(open)/count(open) as avg_opening_price from tutorial.aapl_historical_stock_price;

---What was Apple's 
--lowest stock price (at the time of this data collection)?
select min(low) as lowest_price from tutorial.aapl_historical_stock_price;

--WRITE a query that calculates the average daily trade volume for Apple stock.
Select avg(volume) as avg_stock_volume from tutorial.aapl_historical_stock_price;

--Calculate the total number of shares traded each month. 
--Order your results chronologically.

SELECT year,
month,
SUM(volume) as volume_sum FROM tutorial.aapl_historical_stock_price
GROUP BY year, month
order by year, month;

---Write a query to calculate the average daily price change 
--in Apple stock, grouped by year.

select year, avg(close - open) as daily_average from tutorial.aapl_historical_stock_price
group by 1
order by 1;

---Write a query that calculates the lowest and highest prices that 
--Apple stock achieved each month.
SELECT year, 
month, 
min(low) as lowest, MAX(high) as highest from tutorial.aapl_historical_stock_price
group by 1, 2
order by 1, 2;
