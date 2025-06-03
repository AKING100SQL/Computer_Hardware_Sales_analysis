# SQL Portfolio Project: Computer Hardware Store

## Project Overview

This project explores customer and transaction data for a fictional computer hardware store. Using MySQL, I have performed brief to thorough data analysis tehcniques within Excel and mostly MySQL to uncover customer behavior, spending patterns, and business insights that can support decision-making.

---

## Database Structure

The database consists of two main tables:

- **`customers`**: Contains demographic and location information for each customer.
- **`transactions`**: Includes data about each sale, such as transaction date and amount.

A foreign key links each transaction to a customer.
Primary keys highlight Customer ID's and Transaction ID's.

---

## Key Objectives

- Identify consistent spenders by region and gender
- Analyze spending patterns across different days and time periods
- Rank customers by total spending
- Determine gaps between purchases
- Measure and compare variability in transaction amounts

---

## Sample questions answered in a seperate file (filename.doc)

---

## Tools Used

- **Microsoft Excel** - Cleaned, transformed and validated raw datasets, in order use within SQL and Tableau
- **MySQL Workbench** — SQL querying and schema management
- **Markdown** — Project documentation
- **Tableau** - Presented general finidings visually, to aid to the understanding of non-technical users
- *(Optional: Excel / Power BI / Python — for visualizations or additional analysis)* 

---

## File Contents

- `queries.sql`: All SQL queries used in this project, organized by difficulty
- `schema.png`: Entity Relationship Diagram (ERD) showing tables and relationships
- `insights_report.docx`: Summary of analysis and business insights
- `README.md`: Project description and walkthrough

---

## What I Learned

- Writing complex SQL queries using JOIN, GROUP BY, and subqueries
- Using aggregate functions like `AVG()`, `COUNT()`, and `STDDEV()` for analysis
- Creating calculated fields and filtering with `HAVING`
- Understanding data relationships through primary and foreign keys
- Interpreting standard deviation to find consistent or volatile spenders

---

## Future Improvements

- Add more customer attributes for deeper segmentation (e.g. age groups)
- Automate analysis with Python or R
  
---

>  Questions or feedback? Feel free to connect with me on GitHub or LinkedIn!
