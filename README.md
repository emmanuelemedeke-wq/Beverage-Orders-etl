# Beverage Orders ETL Project

## Table of Contents

- [Project Overview](#project-overview)
- [Business Problem](#business-problem)
- [Objective](#objective)
- [Dataset](#dataset)
- [ETL Process](#etl-process)
- [Data Model Entity Relationship Diagrams](#data-model-entity-relationship-diagrams)
- [Final Output & Analysis](#final-output--analysis)
- [Tools & Technologies](#tools--technologies)


##  Project Overview
This project develops an end-to-end ETL (Extract, Transform, Load) pipeline to integrate beverage order data from 2021–2023 into a single, clean, and analysis-ready dataset.

The goal is to standardize inconsistent data sources and enable reliable reporting for business decision-making, including category performance, regional trends, and year-over-year analysis.

## Business Problem

Beverages R Us provided three separate datasets (2021–2023), but they had several issues:

- Inconsistent schema across years
- Missing product-to-category mapping
- Disconnected territory manager (VP) assignments
- Different column structures (e.g., caffeine and coupon data inconsistencies)
- Difficult to perform year-over-year and regional analysis
  
As a result, leadership could not generate reliable insights from the data.



##  Objective
- Standardize all datasets into a unified schema
- Map products to categories
- Map categories to Vice Presidents (VPs)
- Create calculated metrics for analysis
- Build a consolidated dataset for reporting and decision-making

##  Dataset

The following datasets were used in this project:


- [beverage-orders-2021 (72 rows)](https://raw.githubusercontent.com/emmanuelemedeke-wq/Beverage-Orders-etl/refs/heads/main/dataset/beverage-orders-2021.csv)
- [beverage-orders-2022 (187 rows)](https://raw.githubusercontent.com/emmanuelemedeke-wq/Beverage-Orders-etl/refs/heads/main/dataset/beverage-orders-2022.csv)
- [beverage-orders-2023 (102 rows)](https://raw.githubusercontent.com/emmanuelemedeke-wq/Beverage-Orders-etl/refs/heads/main/dataset/beverage-orders-2023.csv)

**Download ALL datasets (ZIP):**  
[Download dataset.zip](https://raw.githubusercontent.com/emmanuelemedeke-wq/Beverage-Orders-etl/main/dataset.zip)



All data was successfully merged into one table:
 consolidated_beverage_data

## ETL Process
![6393298e18f50e62a1657530_ETL process DataChannel](https://github.com/user-attachments/assets/4fe1587d-9d68-4f21-922d-b68435312779)


# 1. Extract

	• Imported CSV files:

		○ beverage-orders-2021.csv

		○ beverage-orders-2022.csv 

		○ beverage-orders-2023.csv

	• Loaded into MySQL staging tables using Table Import Wizard


# 2. Transform

Key transformations included:

- Standardizing column structure across all years
- Handling missing fields (e.g., caffeine values)
- Mapping:
- 
		○ Product → Category
		○ Category → Vice President (VP)
  
	• Adding calculated fields:
```sql
Volume_Quantity = Quantity * Volume
Weight_Quantity = Quantity * Weight
Revenue_Quantity = Quantity * Per_Unit_Price
```


- Adding a Year column for time-based analysis
- Ensuring consistent data types and naming conventions



# 3. Load

- Merged all cleaned datasets into:
	 consolidated_beverage_data
- Verified total row count:

```sql
SELECT COUNT(*) FROM consolidated_beverage_data;
```

**Result:** 361 rows successfully loaded





## Data Model Entity Relationship Diagrams
### Original Data Structure
- Separate tables for each year
- Inconsistent columns
- No clear relationships
- Missing analytical structure

![ERD Original](erd_original.png)

### Updated Data Structure
- Introduced structured tables:
  
		○ Product_Data
		○ Beverage_Orders
		○ category
		○ org_chart_table
  
- Implemented foreign keys
- Improved scalability and data integrity

![ERD Updated](erd_updated.png)

## Final Output & Analysis

The final dataset supports:

- Year-over-year performance analysis
-  Category-level insights
- Regional and state-level comparisons
- VP (territory manager) accountability
- Revenue, volume, and weight analysis

Example query:
```sql
SELECT Category, Year, SUM(Revenue_Quantity)
FROM consolidated_beverage_data
GROUP BY Category, Year;
```


##  Tools & Technologies
- SQL (MySQL Workbench)
- ETL (Extract, Transform, Load) processes
- Data cleaning and transformation
- Data Modeling (ERD)
- CSV Data Integration 



##  Key Skills Demonstrated
- SQL querying and data manipulation
- Data transformation and standardization
- ETL pipeline design and implementation
- Data validation and quality checks

## Project Outcome
Successfully integrated multiple datasets into a unified dataset containing 361 records, enabling consistent analysis across years.



##  Author
Emmanuel Emedeke
Graduate student - Data  Analytics (UMGC)

##   Team Contributors
- Jasmine Franklin  
- Dennis Evangelista  
- Frank Gyasi  


## My Contribution
- Developed ETL SQL script
- Performed data consolidation
- Validated final dataset


##  Academic Context
Completed as part of the DATA 635 (Data Management) course in the Master of Science in Data Analytics program at the University of Maryland Global Campus (UMGC).
