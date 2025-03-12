# Banking Data Warehouse & Dashboard

## Project Overview
This project builds a data warehouse and dashboard to analyse customer banking data. It uses **dbt** for data transformation and **Metabase** for visualisation.

The dataset includes customer attributes like **credit scores, balances, estimated salaries, satisfaction scores, and card types**. 

The goal is to **derive key business insights** and precompute summary metrics for performance optimisation.

## Project Structure
The project follows a structured approach with dbt models, tests and macros:

```
RAW_BANKING_DATA_PROJECT/
│── dbt_packages/                  # dbt dependencies
│── dbt_raw_bank_venv/              # Virtual environment
│── logs/                           # dbt run logs
│── macros/                         # Custom dbt tests
│   │── is_alphabetical.sql         # Validates text-based fields
│   │── is_numeric.sql              # Validates numeric fields
│── models/                         # dbt models
│   │── sources/                    # Source definitions
│   │   │── sources.yml             # Defines raw data sources
│   │── summaries/                  # Precomputed summary tables
│   │   │── cardtype_for_poor_customers.sql
│   │   │── cardtype_for_rich_customers.sql
│   │   │── creditscore_balance_satisfaction.sql
│   │   │── estimatesalary_by_customer.sql
│   │   │── most_popular_card.sql
│   │   │── total_money_in_bank.sql
│   │── customers.sql                # Main customer fact table
│   │── schema.yml                    # Schema & tests for customer data
│── target/                          # Compiled dbt models
│── .user.yml                        # dbt user config
│── dbt_project.yml                  # dbt project config
│── packages.yml                     # dbt package dependencies
│── profiles.yml                      # dbt connection settings
│── README.md                        # Project documentation
```

## Key Features

### ✅ Conceptual, Logical and Physical Data Modelling
![alt text](image.png)

The data has been kept denormalised in a single table. This was a conscious design decision justified below:

- **Optimised for Analytical Queries** The dataset is intended for a read-heavy workload in a Data Warehouse (DWH). Keeping all relevant customer information in one table reduces the need for costly joins, improving query performance.

- **Logical Cohesion** The raw data is tightly coupled to individual customers. Splitting it into multiple tables would introduce unnecessary complexity without a clear business benefit.

- **Precomputed Summary Tables** Instead of normalisation, performance optimisations have been applied at the summary table level in dbt to ensure quick retrieval of key insights.

- **Simplifies Dashboard Implementation** Since Metabase is used to visualise data, a flat structure ensures that queries are simpler, making dashboard development more efficient.


### ✅ Data Transformation with dbt
- **Source Data:** Stored in `raw_banking` table
- **Fact Table:** `customers.sql` contains all customer attributes
- **Summary Tables:** Precomputed insights for dashboard queries
- **Data Quality Tests:** Used dbt's built-in tests (checking for unique values, nulls and accepted values from predefined lists) and built custom `is_numeric` and `is_alphabetical` tests ensure data integrity

### 📊 Dashboard Implementation (Metabase)
- **Visualises summary tables** for performance
- Includes key business metrics:
  - Total money in the bank
  - Most popular card type
  - Estimated salaries of customers
  - Credit score, balance, satisfaction by geography
  - Card types for wealthiest customers
- Uses a combination of **bar charts, pie charts, and tables**

### 🚀 Performance Considerations
- Data remains **denormalised** since it is a read-heavy workload
- Summary tables (instead of views) are used for precomputed metrics, ensuring faster queries in the dashboard.git 
- Raw data is tightly coupled with customers, making **denormalisation logical**

## Dashboard Screenshots
![alt text](<Screenshot1.png>) 

![alt text](<Screenshot2.png>)


---

This project enables efficient banking analytics with a structured dbt pipeline and an interactive, user-friendly Metabase dashboard.

