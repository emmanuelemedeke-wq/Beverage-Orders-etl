/* 
  G4_Script1_ETL.sql
  DATA 635 – Assignment 6.1
  Team 4: Emmanuel Emedeke, Jasmine Franklin, Dennis Evangelista, Frank Gyasi
  Purpose: ETL for beverage orders 2021–2023
*/

-- STEP 0: Run the Category_and_Org_table.SQL script FIRST (outside this file).
-- That script creates the "beverages" database and loads the category / org tables.


USE beverages;

-- STEP 1: Drop and create the consolidated table.
-- This ensures we start fresh with no leftover data.
	
DROP TABLE IF EXISTS consolidated_beverage_data;

CREATE TABLE consolidated_beverage_data (
    ID INT,
    Product           VARCHAR(255),
    Weight            INT,
    Volume            INT,
    Caffeine          INT,
    Per_Unit_Price    DECIMAL(10,2),
    Quantity          INT,
    Volume_Quantity   INT,
    Weight_Quantity   INT,
    Revenue_Quantity  DECIMAL(12,2),
    Region            VARCHAR(50),
    State             VARCHAR(50),
    Country           VARCHAR(50),
    Category          VARCHAR(100),
    First_Name        VARCHAR(50),
    Last_Name         VARCHAR(50),
    Year              INT
);


/* -----------------------------------------------------------
   STEP 2: Load 2021 data into consolidated table
   We add a Year = 2021 column to identify the source year.
------------------------------------------------------------ */

INSERT INTO consolidated_beverage_data (
    ID, Product, Weight, Volume, Caffeine, Per_Unit_Price, Quantity,
    Volume_Quantity, Weight_Quantity, Revenue_Quantity,
    Region, State, Country, Category, First_Name, Last_Name, Year
)

SELECT
	b.ID,
    b.Product,
    b.Weight,
    b.Volume,  
    NULL AS Caffeine,        -- 2021 has no caffeine column
    b.Per_Unit_Price,
    b.Quantity,
    b.Volume * b.Quantity                  AS Volume_Quantity,
    b.Weight * b.Quantity                  AS Weight_Quantity,
    b.Per_Unit_Price * b.Quantity          AS Revenue_Quantity,
    b.Region,
    b.State,
    b.Country,
    c.Category_Name   AS Category,
    oc.First_Name,
    oc.Last_Name,
    2021           AS Year
FROM `beverage-orders-2021` AS b
LEFT JOIN category AS c
    ON b.Product = c.Product_Name
LEFT JOIN org_chart_table AS oc
    ON c.Category_Name = oc.Category_Name;


/* -----------------------------------------------------------
   STEP 3: Load 2022 data into consolidated table
   Same structure as 2021 but with Year = 2022.
------------------------------------------------------------ */

INSERT INTO consolidated_beverage_data (
   ID, Product, Weight, Volume, Caffeine, Per_Unit_Price, Quantity,
    Volume_Quantity, Weight_Quantity, Revenue_Quantity,
    Region, State, Country, Category, First_Name, Last_Name, Year
)
SELECT
    b.ID,
    b.Product,
    b.Weight,
    b.Volume,
	b.Caffeine,
    b.Per_Unit_Price,
    b.Quantity,
    b.Volume * b.Quantity                  AS Volume_Quantity,
    b.Weight * b.Quantity                  AS Weight_Quantity,
    b.Per_Unit_Price * b.Quantity          AS Revenue_Quantity,
    b.Region,
    b.State,
    b.Country,
    c.Category_Name AS Category,
    oc.First_Name,
    oc.Last_Name,
    2022                                   AS Year
FROM `beverage-orders-2022` AS b
LEFT JOIN category AS c
    ON b.Product = c.Product_Name
LEFT JOIN org_chart_table AS oc
    ON c.Category_Name = oc.Category_Name;


/* 
STEP 4: Load 2023 data into consolidated table
Same pattern with Year = 2023. */

INSERT INTO consolidated_beverage_data (
   ID, Product, Weight, Volume, Caffeine, Per_Unit_Price, Quantity,
    Volume_Quantity, Weight_Quantity, Revenue_Quantity,
    Region, State, Country, Category, First_Name, Last_Name, Year
)
SELECT
    b.ID,
    b.Product,
    b.Weight,
    b.Volume,
    b.Caffeine,
    b.Per_Unit_Price,
    b.Quantity,
    b.Volume * b.Quantity                  AS Volume_Quantity,
    b.Weight * b.Quantity                  AS Weight_Quantity,
    b.Per_Unit_Price * b.Quantity          AS Revenue_Quantity,
    b.Region,
    b.State,
    b.Country,
    c.Category_Name AS Category,
    oc.First_Name,
    oc.Last_Name,
    2023                                   AS Year
FROM `beverage-orders-2023` AS b
LEFT JOIN category AS c
    ON b.Product = c.Product_Name
LEFT JOIN org_chart_table AS oc
    ON c.Category_Name = oc.Category_Name;



/* -----------------------------------------------------------
   STEP 5: (Optional) Verify total rows loaded.
   Expected Row Count:
      2021 = 187 rows
      2022 = 72 rows
      2023 = 102 rows
      TOTAL = 361 rows
      
    -- Row counts match the imported staging tables (verified using SELECT COUNT(*)).      
Verification queries used:
    SELECT COUNT(*) FROM `beverage-orders-2021`;
    SELECT COUNT(*) FROM `beverage-orders-2022`;
    SELECT COUNT(*) FROM `beverage-orders-2023`;
------------------------------------------------------------ */

# SELECT COUNT(*) FROM consolidated_beverage_data;

------------------------------------------------------------
-- STEP 6: Final summarized output for GX_output_final.csv
-- We subtotal by Product, Region, State, Country, Category, and Vice President.
-- Quantities and derived quantities are summed; unit values are not.
------------------------------------------------------------

SELECT
    Product,
    Region,
    State,
    Country,
    Category,
    First_Name AS Vice_President,
    SUM(Quantity) AS Sum_Quantity,
    SUM(Volume_Quantity) AS Sum_Volume_Quantity,
    SUM(Weight_Quantity) AS Sum_Weight_Quantity,
    SUM(Revenue_Quantity) AS Sum_Revenue_Quantity,
    Year
FROM consolidated_beverage_data
GROUP BY
    Product,
    Region,
    State,
    Country,
    Category,
    First_Name,
    Year
ORDER BY
    Product, State, First_Name;