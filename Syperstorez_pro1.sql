/*Sales manager alloted in each region*/
SELECT  sales_manager.Person,sales_manager.Region,orders.State,orders.City
FROM superstore.orders
INNER JOIN superstore.sales_manager
ON  orders.Region = sales_manager.Region ORDER BY sales_manager.Person ASC;

/*Count of city under each sales manager*/
SELECT  sales_manager.Person,COUNT(orders.City)
FROM superstore.orders
INNER JOIN superstore.sales_manager
ON  orders.Region = sales_manager.Region GROUP BY sales_manager.Person ORDER BY sales_manager.Person ASC;

/*Customer information with the returned status*/
SELECT orders.Order_ID,orders.Customer_Name,orders.Product_Name,orders.`Sub-Category`,return.Returned
FROM superstore.orders
INNER JOIN superstore.return 
ON  orders.Order_ID = return.Order_ID;

/*Numbers of order returned*/
SELECT COUNT(orders.Order_ID)
FROM superstore.orders
INNER JOIN superstore.return 
ON  orders.Order_ID = return.Order_ID;

/*Final amount paid by customer*/
SELECT`Sub-Category`,Product_Name,(SUM(Sales + Profit)) AS Final_amount  FROM superstore.orders GROUP BY `Sub-Category`;
/*Max Profit gained by Superstore by sub category*/
SELECT`Sub-Category`,Product_Name, (SUM(Profit)) AS profit_by_subcategory ,SUM(Quantity) AS Quantity FROM superstore.orders GROUP BY `Sub-Category` ORDER BY ROUND(Profit) DESC LIMIT 5;
/*Product on which Discount provided by store*/
SELECT`Sub-Category`,Product_Name,(SUM(Discount)) FROM superstore.orders GROUP BY `Sub-Category`;
/*Quantity of Product sold by store*/
SELECT`Sub-Category`,Product_Name,(SUM(Quantity)) FROM superstore.orders GROUP BY `Sub-Category`ORDER BY (SUM(Quantity)) DESC ;
/*Total days required to ship an order */
SELECT Order_ID,`Sub-Category`,Product_Name, (Ship_Date- Order_Date) AS Total_days_for_shipping_order FROM superstore.orders ;
/*Mostly used ship mode*/
SELECT Ship_Mode,(COUNT(Ship_Mode)) FROM superstore.orders GROUP BY Ship_Mode ORDER BY (COUNT(Ship_Mode)) DESC ;
/*Customer falls under first class ship mode*/
SELECT Customer_Name FROM superstore.orders WHERE Ship_Mode = "First Class" GROUP BY Customer_Name ;