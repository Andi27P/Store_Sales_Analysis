/* Create a new view called Store_SalesV2 that cleans up the date format
   Renames columns to remove spaces. 
*/
CREATE VIEW Store_SalesV2 AS
SELECT 
    "Row ID" AS Row_ID,
    "Order ID" AS Order_ID,

    -- Clean up the date format to be YYYY-MM-DD   
    SUBSTR("Order Date", 7, 4) || '-' || SUBSTR("Order Date", 4, 2) || '-' || SUBSTR("Order Date", 1, 2) AS Order_Date,
    SUBSTR("Ship Date", 7, 4) || '-' || SUBSTR("Ship Date", 4, 2) || '-' || SUBSTR("Ship Date", 1, 2) AS Ship_Date,
    
    -- Rename columns to remove spaces
    "Ship Mode" AS Ship_Mode,
    "Customer ID" AS Customer_ID,
    "Customer Name" AS Customer_Name,
    "Product ID" AS Product_ID,
    "Sub-Category" AS Sub_Category,
    "Product Name" AS Product_Name,
    "Postal Code" AS Postal_Code,

    -- Columns that do not need to be renamed or cleaned up
    Segment,
    City,
    State,
    Region,
    Category,
    Sales
FROM Superstore_sales;


-- Display the Customer who has sales greater than the average
SELECT Customer_Name, Sales FROM Store_SalesV2
WHERE Sales > (SELECT AVG(Sales) FROM Store_SalesV2)
ORDER BY Sales DESC;


-- Who are the top 10 customers by number of orders?
SELECT Customer_Name, count(Customer_Name) AS CustomerN_Count 
FROM Store_SalesV2
GROUP BY Customer_Name
ORDER BY count(Customer_Name) DESC
LIMIT 10;


-- Sales Ranking per Region and Year
SELECT round(Sum(Sales),2) AS Total_sales, Region, Substr(Order_Date, 1,4) AS Year 
FROM Store_SalesV2
GROUP BY Region, Year
ORDER BY Total_sales DESC;


-- What is the total sales per year?
SELECT round(Sum(Sales),2) AS Total_sales, Substr(Order_Date, 1,4) AS Year 
FROM Store_SalesV2
GROUP BY Year
ORDER BY Total_sales DESC;


/* Most demanding product per Region */
SELECT count(Order_ID) AS Order_Count, Category, Sub_Category, Region 
FROM Store_SalesV2
GROUP BY Region, Sub_Category
ORDER BY Order_Count DESC;


/* Most demanding category per Region */
SELECT count(Order_ID) AS Order_Count, Category, Region 
FROM Store_SalesV2
GROUP BY Region, Category
ORDER BY Order_Count DESC;


/* Most demanding product per sales */
SELECT Sub_Category, Category, round(Sum(Sales),2) AS Total_Sales 
FROM Store_SalesV2
GROUP BY Sub_Category
ORDER BY Total_Sales DESC;


/* Region Isolated TOP 5 Customer Sales */
WITH West_Sales AS (
    SELECT Customer_Name, Category, Sales 
    FROM Store_SalesV2
    WHERE Region = 'West'
)
SELECT Customer_Name,
       round(Sum(Sales) ,2) AS Total_West_Sales
FROM West_Sales
GROUP BY Customer_Name
ORDER BY Total_West_Sales DESC
LIMIT 5;


/* Percent of Total Income per each Region */
WITH Regional_Sales AS (
    SELECT Region,
           Sum(Sales) AS Total_regional_sales 
    FROM Store_SalesV2
    GROUP BY Region        
),
Total_Income AS (
    SELECT Sum(sales) AS Total_company_income 
    FROM Store_SalesV2
)
SELECT R.Region,
       round(R.Total_regional_sales,2) AS Sales_Volume,
       round((R.Total_regional_sales / T.Total_company_income) * 100, 2) AS Percent_Reg
FROM Regional_Sales R, Total_Income T
ORDER BY Percent_Reg DESC;