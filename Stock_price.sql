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