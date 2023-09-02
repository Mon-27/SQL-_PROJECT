SELECT * FROM  superstore.orders;
/* How are the sales quantity and profit performance throughout the years?*/
SELECT Order_Date_Year,SUM(ROUND(Sales_price)) AS total_sales_price ,SUM(ROUND(Profit)) AS Total_profit FROM superstore.orders GROUP BY Order_Date_Year ORDER BY Order_Date_Year ASC;
/*Which region has the highest sales?*/
SELECT Region,Sales_price FROM superstore.orders GROUP BY Region ORDER BY Sales_price DESC ;
/*Which city has the highest profit?*/
SELECT City,Profit FROM superstore.orders GROUP BY City ORDER BY Profit DESC LIMIT 1 ;
/* Which segment and item have generated the most profit?*/
/*How many registered customer during 2014-2016?*/
SELECT COUNT(DISTINCT(Customer_Name)) FROM superstore.orders WHERE Order_Date_Year BETWEEN 2014 AND 2016;
/*Calculating Frequency of each order id by each customer Name in descending order*/
SELECT COUNT(Order_ID),Order_ID,Customer_Name FROM superstore.orders GROUP BY Order_ID ORDER BY Customer_Name DESC;
/*Calculate Totals Sales of each customer name?*/
SELECT Customer_Name,SUM(ROUND(Sales_price)) AS Total_amount_spent_by_customer FROM superstore.orders GROUP BY Customer_Name;
/*Display No of Customers in each region in descending order?*/
SELECT COUNT(DISTINCT(Customer_Name)) ,region  FROM superstore.orders GROUP BY region;
/*Find Sum Total Sales of Superstore?*/
SELECT SUM(ROUND(Sales_price)) AS Sum_Total_Sales_of_Superstore FROM superstore.orders;
/*Find a region having maximum number of customers?*/
SELECT COUNT(DISTINCT(Customer_Name)) AS Total_customer_count ,region  FROM superstore.orders GROUP BY region ORDER BY Total_customer_count LIMIT 1 ;
/*Display the records for customers who live in state California and postal code 90032?*/
SELECT * FROM superstore.orders WHERE  State ="California" AND Postal_Code = 90032;

