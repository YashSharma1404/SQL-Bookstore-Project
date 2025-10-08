# 📘 Bookstore Sales & Customer Analysis (SQL Project)

## 🔍 Overview  
This project simulates a **Bookstore Management Database** and demonstrates how SQL can be used for **data analysis**, **sales tracking**, and **customer insights**.  
It includes multiple business-oriented SQL queries to analyze **sales performance**, **customer behavior**, and **marketing ROI**.

---

## 🧱 Database Schema  
The database consists of **four relational tables**:

| Table | Description |
|--------|--------------|
| **Books** | Contains details about books (title, genre, price, stock). |
| **Customers** | Stores customer information including city and signup date. |
| **Orders** | Records all book purchases with quantity and order date. |
| **MarketingSpend** | Tracks marketing expenses associated with each customer. |

---

## 📊 Key SQL Analyses Performed

### 🛍️ Sales Analysis
- Calculated total **units sold** and **revenue** per book.
- Identified **top-selling books** based on total revenue.

### 📦 Inventory Insights
- Found books with **low stock** for restocking decisions.

### 👥 Customer Behavior (RFM Analysis)
- Calculated **Recency**, **Frequency**, and **Monetary** metrics per customer.
- Identified **high-value customers** based on purchase activity.

### 💰 Marketing ROI
- Compared **marketing spend** vs. **customer revenue** to calculate profit.

### 📅 Monthly Trends
- Aggregated **monthly sales** and **revenue** trends.

### 🔁 Customer Retention
- Found **inactive customers** who haven’t purchased in over a year.

### 💵 Average Order Value
- Computed the **average revenue per order**.

---

## ⚙️ Tools & Technologies
- **Database:** SQLite / MySQL (compatible)
- **Language:** SQL
- **Concepts Used:**  
  JOIN, GROUP BY, CTE, Aggregate Functions, Date Functions, Subqueries

---

## 🚀 How to Run This Project
1. Create a new database in **MySQL** or **SQLite**.
2. Copy and paste all commands from `BookStore.sql`.
3. Run the table creation and data insertion queries.
4. Execute the analytical queries at the end of the file.
5. Observe insights such as sales trends, RFM analysis, and profitability.

---

## 📈 Learning Outcomes
- Strengthened understanding of **SQL for business analytics**.  
- Learned to perform **data-driven decision making** using queries.  
- Practiced combining **marketing, sales, and customer data** to extract insights.  

---

## 📎 Project File
📂 [`BookStore.sql`](BookStore.sql)

---

⭐ *If you found this project helpful, consider giving it a star on GitHub!*
