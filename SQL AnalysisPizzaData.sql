Select * from pizza_sales

/* Sum of the total price of pizza order */
Select SUM(total_price) AS Total_Revenue
from pizza_sales

/* Average order value: dividing the total revenue by the total numbers of orders */
Select SUM(total_price) / COUNT(DISTINCT order_id) AS Average_order_value
from pizza_sales

/* Total pizza sold: Sum of quantity */
Select SUM(quantity) AS Total_Pizza_Sold
From pizza_sales

/* Total orders: COunt distinct order_id */
Select COUNT(DISTINCT order_id) AS Total_orders 
from pizza_sales

/* Average pizza per order: Dividing sum of quantity by count distinct order_id */
Select CAST(CAST(SUM(quantity) AS decimal(10,2)) / CAST(COUNT(DISTINCT order_id) AS decimal(10,2)) AS DECIMAL(10,2)) AS Avg_pizza_per_order
From pizza_sales






/* Chart Requirements */
/* 1. Daily trend of order: Number of orders per each week day */
Select * from pizza_sales

Select DATENAME(DW,order_date) AS order_day, COUNT(DISTINCT order_id) AS Total_orders
from pizza_sales
Group by DATENAME(DW,order_date)

/* 2. Daily trend order per month */
Select DATENAME(MONTH,order_date) AS Order_month, COUNT(DISTINCT order_id) AS Total_orders
from pizza_sales
Group by DATENAME(MONTH,order_date) 
ORDER by Total_orders DESC

/* 3. Percentage of Sales by Pizza category */
Select pizza_category, SUM(total_price) AS Total_Sales, SUM(total_price) * 100 / (Select SUM(total_price) from pizza_sales) AS Percentage_cate
from pizza_sales
WHERE MONTH(order_date) = 1 /* Cụ thể xem dữ liệu tháng 1 (MONTH(order_date) = tên tháng=số ) */
Group by pizza_category

/* 4. Percentage of Sales by Pizza sizes */
Select pizza_size, CAST(SUM(total_price) * 100 / (Select SUM(total_price) from pizza_sales) AS DECIMAL(10,2)) AS Percentage_Size
from pizza_sales
Group by pizza_size
Order by Percentage_Size

/* 5. Total pizza sold per type of pizza */
Select pizza_name, SUM(quantity) AS Total_sold
from pizza_sales
Group by pizza_name
Order by Total_sold

 /*6. Select top 5 pizza highest revenue */
 Select top 5 pizza_name, SUM(quantity) AS Total_sold
from pizza_sales
Group by pizza_name
Order by Total_sold DESC

