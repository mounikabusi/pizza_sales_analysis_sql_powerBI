# pizza_sales_analysis_sql_powerBI
SQL-based pizza sales analysis project using PostgreSQL to analyze revenue trends, customer ordering patterns, top-selling pizzas, peak sales hours, and business performance insights.

# Dashboard Preview
<img width="1320" height="743" alt="pizza_sales_analysis" src="https://github.com/user-attachments/assets/425c64d3-d7b6-4cb1-99f6-a19d5fd834b8" />


# Pizza Sales Analysis Project 🍕

## Overview
This project focuses on analyzing pizza sales data using SQL and Power BI to generate meaningful business insights. The analysis helps understand customer ordering behavior, revenue trends, peak sales periods, and top-performing pizza categories.

---

## Tools & Technologies Used
- SQL (PostgreSQL/MySQL)
- Power BI
- Excel
- GitHub

---

## Project Objectives
- Analyze overall sales performance
- Identify top and bottom-selling pizzas
- Track monthly revenue trends
- Find peak ordering hours
- Study customer purchasing behavior
- Generate business insights for decision-making

---

## Dataset Information
The dataset contains:
- Orders data
- Order details
- Pizza details
- Pizza categories
- Pricing information

---

## Key SQL Concepts Used
- Joins
- Aggregate Functions
- GROUP BY
- ORDER BY
- Window Functions
- Subqueries
- CTEs
- Date & Time Functions

---

## Key Business Insights 📊

- Peak sales occur during afternoon and evening hours, indicating high customer demand during meal times.
- Large-sized pizzas contribute significantly to total revenue.
- A few pizza categories generate the majority of total sales.
- Some pizzas consistently underperform and may require promotional strategies.
- Monthly sales trends indicate seasonal fluctuations in customer demand.
- High-volume orders suggest opportunities for combo offers and group meal promotions.

---

## Dashboard Features
- Total Revenue
- Total Orders
- Top 5 Best-Selling Pizzas
- Bottom 5 Pizzas
- Revenue by Category
- Sales by Pizza Size
- Monthly Revenue Trend
- Peak Order Hours

---
## Sample queries in this project
## Top Pizza in Each Category
```sql
WITH ranked_pizzas AS(
SELECT pt.name,pt.category,SUM(od.quantity*p.price) AS total_revenue,
RANK() OVER (partition by  pt.category ORDER BY SUM(od.quantity*p.price) DESC) AS pizza_rank
FROM order_details od
Join pizzas p ON 
od.pizza_id=p.pizza_id
join pizza_types pt ON
pt.pizza_type_id=p.pizza_type_id
GROUP BY pt.category,pt.name
)
SELECT * FROM ranked_pizzas
WHERE pizza_rank=1 ;
```
## Result:
<img width="429" height="123" alt="image" src="https://github.com/user-attachments/assets/34ba71cc-7af2-4780-b3d9-d44caf71fc06" />

 ## Peak Order Hour
```sql
SELECT 
    EXTRACT(HOUR FROM time) AS order_hours,
    COUNT(order_id) AS orders
FROM orders
GROUP BY order_hours
ORDER BY orders DESC
LIMIT 1;
```

## Result:
<img width="212" height="50" alt="image" src="https://github.com/user-attachments/assets/67ee651a-4caa-424e-8e07-34a2e3268f2e" />

## Revenue Contribution Percentage
```sql
SELECT pt.category,ROUND(SUM(od.quantity*p.price)) AS total_revenue,

ROUND((SUM(od.quantity*p.price)/
(SELECT (SUM(od2.quantity*p2.price)) FROM
order_details od2 JOIN pizzas p2 ON
od2.pizza_id=p2.pizza_id))*100) AS total_percentage
FROM order_details od 
JOIN pizzas p ON 
od.pizza_id=p.pizza_id
JOIN pizza_types pt ON
p.pizza_type_id=pt.pizza_type_id
GROUP BY pt.category
ORDER BY total_revenue;
```
# Result:
<img width="329" height="119" alt="image" src="https://github.com/user-attachments/assets/5ae44d4b-5e11-4875-bdaa-57da7ad16677" />

# Key Insights
- Peak pizza sales occurred during afternoon and evening hours, indicating high customer demand during meal times.
- Large-sized pizzas contributed significantly to overall revenue.
- A few pizza categories generated the majority of total sales.
- Certain pizzas consistently underperformed and may require promotional strategies.
- Revenue trends showed fluctuations across different months, indicating seasonal demand patterns.
- High-volume orders suggested opportunities for combo offers and group meal promotions.


## Author
Mounika Busi
