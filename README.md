# Beverage Orders ETL Project

##  Project Overview
This project develops an end-to-end ETL (Extract, Transform, Load) pipeline to integrate beverage order data from 2021–2023 into a single, clean, and analysis-ready dataset.

The goal is to standardize inconsistent data sources and enable reliable reporting for business decision-making, including category performance, regional trends, and year-over-year analysis.

## Business Problem

Beverages R Us provided three separate datasets (2021–2023), but they had several issues:

	• Inconsistent schema across years
	• Missing product-to-category mapping
	• Disconnected territory manager (VP) assignments
	• Different column structures (e.g., caffeine and coupon data inconsistencies)
	• Difficult to perform year-over-year and regional analysis
  
As a result, leadership could not generate reliable insights from the data.



##  Objective
	• Standardize all datasets into a unified schema
	• Map products to categories
	• Map categories to Vice Presidents (VPs)
	• Create calculated metrics for analysis
	• Build a consolidated dataset for reporting and decision-making

##  Dataset
- [beverage-orders-2021 (72 rows)](https://raw.githubusercontent.com/emmanuelemedeke-wq/Beverage-Orders-etl/refs/heads/main/dataset/beverage-orders-2021.csv)
- beverage-orders-2022 (187 rows)
- beverage-orders-2023 (102 rows)

All data was successfully merged into one table:
 consolidated_beverage_data

## ETL Process
![6393298e18f50e62a1657530_ETL process DataChannel](https://github.com/user-attachments/assets/4fe1587d-9d68-4f21-922d-b68435312779)


1. Extract

	• Imported CSV files:
		○ beverage-orders-2021.csv

		○ beverage-orders-2022.csv

		○ beverage-orders-2023.csv

	• Loaded into MySQL staging tables using Table Import Wizard




##  Tools & Technologies
- SQL (MySQL Workbench)
- ETL processes
- Data cleaning and transformation



## Data Model Entity Relationship Diagrams
### Original Data Structure
![ERD Original](erd_original.png)

### Updated Data Structure
![ERD Updated](erd_updated.png)





##  ETL Process
1. Extract data from multiple yearly datasets
2. Transform data (cleaning, formatting, standardization)
3. Load into a consolidated table: `consolidated_beverage_data`

##  Results
- Successfully combined datasets into a single table (~361 rows)
- Improved data consistency and structure
- Enabled easier reporting and analysis

##  Key Skills Demonstrated
- SQL querying
- Data transformation
- ETL pipeline design
- Data validation

##  Author
Emmanuel Emedeke

##   Team Contributors
- Jasmine Franklin  
- Dennis Evangelista  
- Frank Gyasi  

##  Academic Context
This project was completed as part of the DATA 635 (Data Management) course in the Master of Science in Data Analytics program at the University of Maryland Global Campus (UMGC).

## My Contribution
- Developed ETL SQL script
- Performed data consolidation
- Validated final dataset

