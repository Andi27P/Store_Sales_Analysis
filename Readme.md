# Superstore Sales Data Analysis (SQL & Power BI)

## 🎯 Project Overview
This project presents a data analysis using an US Superstore sales dataset. The primary objective is to transform raw, unformatted transaction records into a clean, structured data model and extract business insights regarding regional performance, product demand and customer purchasing behavior using **SQLite** and **Power BI**.

![Dashboard Preview](Executive_Sales_Dasboard_S.png)

---

## 🛠️ Skills & Knowledge

- **Database / Environment:** SQLite, Visual Studio Code
- **Data Cleaning (SQL):** Standardized date formats using string manipulation and normalized column headers via SQL Views.
- **Advanced SQL Techniques:** 
  - Common Table Expressions (CTEs) for multi-step aggregations.
  - Subqueries for dynamic baseline comparisons.
  - Complex aggregations (`GROUP BY`, `ORDER BY`, `COUNT`, `SUM`).
- **Data Modeling & BI (Power BI):**
  - Designed a **Star Schema** with a 1-to-many relationship between a dedicated `Calendar` dimension table and the `Store_Sales_Clean` fact table.
---

## 💡 Conclusions

1. **Customer Analytics:**
   - Identified top customer segments and high-value buyers through SQL CTEs and visual filtering.
   - Filtered top 5 VIP clients contributing disproportionately to revenue for retention targeting.

2. **Regional Revenue Contribution:**
   - Calculated exact income percentages per region showing that total sales are concentrated in major states.

3. **Product & Category Dynamics (Volume vs. Revenue Trade-Off):**
   - **Technology:** Drives the highest total revenue (~$0.83M) with lower transaction volume (~1.5K orders), representing a high Average Order Value.
   - **Office Supplies:** Generates high transactional volume (3.7K orders) at a lower total revenue ($0.71M), indicating high-frequency consumable purchases.
     
4. **Isolated Market Trends:**
   - Multi-filtered analysis isolating highest-spending customers and sub-category dynamics exclusively across regional markets.

---

## 📊 Power BI Dashboard

- **KPI Header:** Dynamic card visuals tracking core metrics (`Total Revenue`: $2.26M | `Total Orders`: 5K).
- **Evolution Chart:** Continuous trend chart showing yearly revenue progression from 2015 to 2018.
- **Geographic Filtering:** Interactive US States map filled with local revenue.
- **Dual Axis Analysis:** Displaying total orders vs total revenue per product line.

---

## 📁 Project Structure
```text
├── `Store_Sales.sql`                  # Complete SQL script containing the data cleaning View, EDA queries, and business metric CTEs.
├── `Store_Sales_Clean.csv`            # Processed dataset exported from SQLite, ready for BI modeling.
├── `Executive_Sales_Dashboard.pbix`   # Interactive Power BI Dashboard file.
├── `Executive_Sales_Dasboard_S.png`   # High-resolution export of the Power BI executive layout.
└── `README.md` -                      # Project documentation.
