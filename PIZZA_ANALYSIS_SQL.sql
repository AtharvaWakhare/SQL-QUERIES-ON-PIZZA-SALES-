CREATE DATABASE Pizza_Project

USE Pizza_Project

SELECT * FROM pizza_sales

//** TOTAL REVENUE ***//
SELECT SUM(total_price) AS TOTAL_REVENUE FROM pizza_sales


//**AVERAGE ORDER ID ***//

SELECT SUM(total_price)/APPROX_COUNT_DISTINCT(order_id) AS AVERAGE_ORDER_ID  FROM pizza_sales

//**Total pizza sold ***//
SELECT SUM(quantity) AS TOTAL_pizza_sold FROM pizza_sales



//**Total orders ***//
SELECT COUNT(distinct order_id) AS TOTAL_pizza_sold FROM pizza_sales



//*Average pizza per order  ***//
SELECT cast (cast (sum(quantity) as decimal(10,2))
/cast (COUNT(distinct order_id) as decimal(10,2)) as decimal (10,2)) AS Avg_pizza_order FROM pizza_sales



//**order  per day  ***//
select DATENAME(DW,order_date) AS WEEK_DAYS ,COUNT(DISTINCT order_id)  AS NO_OF_ORDERS FROM pizza_sales
GROUP BY DATENAME(DW,order_date)


//**order  per month  ***//
select DATENAME(MONTH,order_date) AS MONTHS ,COUNT(DISTINCT order_id)  AS NO_OF_ORDERS FROM pizza_sales
GROUP BY DATENAME(MONTH,order_date)
ORDER BY NO_OF_ORDERS DESC

//**PERCANTAGE OF SALES BY CATEGORY ***//

SELECT pizza_category,SUM(total_price) AS TOTAL_PRICE,SUM(total_price)*100/
(SELECT SUM(total_price) FROM pizza_sales )
AS PERCANTAGE_SALES FROM pizza_sales
GROUP BY pizza_category



/**PERCANTAGE OF SALES BY SIZE ***//
SELECT pizza_size,CAST (SUM(total_price) AS  DECIMAL (10,2)) AS TOTAL_PRICE,
CAST (SUM(total_price)*100/
 (SELECT SUM(total_price)  FROM pizza_sales) AS DECIMAL (10,2)) AS PERCANTAGE_SALES FROM pizza_sales
GROUP BY pizza_size

//**TOP 5 SELLING PIZZA */*

SELECT TOP 5  pizza_name,SUM(total_price)AS TOTAL_REVENUE FROM pizza_sales
GROUP BY pizza_name
ORDER BY TOTAL_REVENUE DESC


//**BOTTOM 5 SELLING  PIZZA */*

SELECT TOP 5  pizza_name,SUM(total_price)AS TOTAL_REVENUE FROM pizza_sales
GROUP BY pizza_name
ORDER BY TOTAL_REVENUE ASC

//**TOP 5 SELLING PIZZA PER QUANTITY */*
SELECT TOP 5  pizza_name,SUM (quantity)AS TOTAL_QUANTITY FROM pizza_sales
GROUP BY pizza_name
ORDER BY TOTAL_QUANTITY DESC

//**BOTTOM 5 SELLING PIZZA PER QUANTITY */*
SELECT TOP 5  pizza_name,SUM (quantity)AS TOTAL_QUANTITY FROM pizza_sales
GROUP BY pizza_name
ORDER BY TOTAL_QUANTITY ASC

//**TOP 5 SELLING PIZZA PER ORDER */*
SELECT TOP 5  pizza_name,COUNT(DISTINCT(order_id))AS TOTAL_ORDER FROM pizza_sales
GROUP BY pizza_name
ORDER BY TOTAL_ORDER DESC

/**BOTTOM 5 SELLING PIZZA PER ORDER */*
SELECT TOP 5  pizza_name,COUNT(DISTINCT(order_id))AS TOTAL_ORDER FROM pizza_sales
GROUP BY pizza_name
ORDER BY TOTAL_ORDER ASC


SELECT * FROM pizza_sales


