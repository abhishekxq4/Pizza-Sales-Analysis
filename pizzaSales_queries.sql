use pizza_sales_db;
desc pizza_sales;

# SQL Queries for KPIs for Year 2015

-- 1) Total Sales / Revenue

select format(sum(total_price), 0) as 'Total Sales' from pizza_sales;

-- 2) Total Orders

select count(distinct order_id) as 'Total Orders' from pizza_sales;

-- 3) Average Order value

select format(sum(total_price) / count(distinct order_id),2) as 'Average Order Value' from pizza_sales;

-- 4) Total Pizza's Sold / Total Quantity

select sum(quantity) as 'Total Quantity' from pizza_sales;

-- 5) Average Pizza Sold per Order

select format(sum(quantity) / count(distinct order_id),1) as 'Avg Pizza Per Order' from pizza_sales;

-- 6) Daily Trends for Total Orders

select 
	dayname(date_format(str_to_date(order_date, '%d-%m-%Y'),'%Y-%m-%d')) as Order_Day,
    count(distinct order_id) as No_of_Orders
from pizza_sales
group by Order_Day
order by No_of_Orders desc;

-- 7) Monthly Trends for total Orders

select
	monthname(date_format(str_to_date(order_date, '%d-%m-%Y'), '%Y-%m-%d')) as Month_Name,
    count(distinct order_id) as No_of_Orders
from pizza_sales
group by Month_Name
order by No_of_Orders desc;   

-- 8) Percentage of sales by pizza category 

select 
	pizza_category, 
    format((sum(total_price)/(select sum(total_price) from pizza_sales))*100,2) as Sales_Percentage from pizza_sales
group by pizza_category;

-- 9) Percentage of sales by pizza size

select
	pizza_size,
	format(sum(total_price)*100 / (select sum(total_price) from pizza_sales),2) as Sales_Percentage
from pizza_sales
group by pizza_size;

-- 10) Top 5 pizza by Sales

select
	pizza_name,
    sum(total_price) as Sales_Amount
from pizza_sales
group by pizza_name
order by Sales_Amount desc
limit 5;

-- 11) Bottom 5 pizza by Sales    

select
	pizza_name,
    sum(total_price) as Sales_Amount
from pizza_sales
group by pizza_name
order by Sales_Amount
limit 5;

-- 12) Top 5 pizza by Orders    

select
	pizza_name,
    count(distinct order_id) as No_of_Orders
from pizza_sales
group by pizza_name
order by No_of_Orders desc
limit 5;

-- 13) Bottom 5 pizza by Orders    

select
	pizza_name,
    count(distinct order_id) as No_of_Orders
from pizza_sales
group by pizza_name
order by No_of_Orders
limit 5;

select * from pizza_sales;






