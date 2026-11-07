# 📊 Sales Analysis using SQL

## 📌 Project Overview
**Project Title:** Sales Analysis 
**Database:** `project_1`
**SQL Language:** PostgreSQL
**Project Level:** Beginner
**Domain:** Retail & Sales Analytics

This project uses SQL to turn raw sales data into business insights about products, customers, cities and revenue trends. It covers database creation, handling missing values, and 10 business-driven SQL queries using JOINs, GROUP BY and HAVING.

---

## 🎯 Project Objectives
1. **Database Creation:** Build a relational sales database with three tables.
2. **Data Quality:** Identify and handle missing values (NULL quantity).
3. **Business Analysis:** Answer 10 practical business questions using SQL.
4. **Insight Generation:** Find top products, cities, categories and monthly trends.

---

## 🛠️ Tools & Technologies

| Tool | Purpose |
|------|---------|
| PostgreSQL | Database management |
| pgAdmin 4 | SQL development environment |
| GitHub | Project documentation and version control |

---

## 🧠 SQL Concepts Covered
- SELECT, WHERE, ORDER BY
- Aggregate functions (COUNT, SUM)
- GROUP BY and HAVING
- JOINs (multiple tables)
- NULL handling (IS NULL)
- Date functions (TO_CHAR, BETWEEN)

---

## 📂 Project Structure
```
sales-data-analysis-sql/
│
├── README.md
├── sales_analysis.sql    (table setup and all 10 queries)
└── *.png                 (output screenshot of every query)
```

---

## 🗄️ Database Setup
**Database Name:** `project_1`

The project uses 3 related tables:

| Table | Columns |
|-------|---------|
| customers | customer_id, customer_name, city |
| products | product_id, product_name, category, price |
| sales | sale_id, customer_id, product_id, quantity, sale_date |

`sales` is linked to `customers` and `products` through `customer_id` and `product_id`.

---

---

## ❓ Business Questions and SQL Solutions

### Query 1: Products with price above 5000
**Question:** Which products cost more than 5000? Show product name, category and price, from highest to lowest.
```sql
SELECT product_name, category, price
FROM products
WHERE price > 5000
ORDER BY price DESC;
```
**Result:** Laptop (45000), Smartphone (18000), Study Table (8000), Office Chair (6500)

### Query 2: Sales summary
**Question:** How many sales were made, how many have a quantity recorded, and what is the total quantity sold?
```sql
SELECT COUNT(*) AS total_sales,
       COUNT(quantity) AS quantity_filled,
       SUM(quantity) AS total_quantity
FROM sales;
```
**Result:** 24 sales, 23 with quantity, 51 units sold

### Query 3: Total quantity sold per product
**Question:** How many units of each product were sold?
```sql
SELECT product_id, SUM(quantity) AS total_quantity_sold
FROM sales
GROUP BY product_id
ORDER BY total_quantity_sold DESC;
```
**Result:** Product 6 sold the most (25 units), then product 3 (8) and product 2 (6)

### Query 4: Best-selling products
**Question:** Which products sold more than 5 units in total?
```sql
SELECT product_id, SUM(quantity) AS total_quantity_sold
FROM sales
GROUP BY product_id
HAVING SUM(quantity) > 5
ORDER BY total_quantity_sold DESC;
```
**Result:** Products 6, 3 and 2

### Query 5: Top customers in October 2026
**Question:** Which customers bought more than 3 units in October 2026?
```sql
SELECT customer_id, SUM(quantity) AS total_quantity
FROM sales
WHERE sale_date BETWEEN '2026-10-01' AND '2026-10-31'
GROUP BY customer_id
HAVING SUM(quantity) > 3
ORDER BY total_quantity DESC;
```
**Result:** Customer 5 (9 units) and customer 1 (4 units)

### Query 6: Revenue per product
**Question:** How much revenue did each product generate?
```sql
SELECT p.product_name, SUM(s.quantity * p.price) AS total_revenue
FROM sales s
JOIN products p ON s.product_id = p.product_id
GROUP BY p.product_name
ORDER BY total_revenue DESC;
```
**Result:** Laptop 180,000, Smartphone 108,000, Study Table 32,000, Office Chair 26,000, Headphones 20,000, Notebook Pack 7,500

### Query 7: Missing quantity check
**Question:** Which sales have no quantity recorded?
```sql
SELECT sale_id, customer_id, product_id, sale_date
FROM sales
WHERE quantity IS NULL;
```
**Result:** Sale 22 has a NULL quantity

### Query 8: Revenue by city
**Question:** Which city generated the most revenue?
```sql
SELECT c.city, SUM(s.quantity * p.price) AS total_revenue
FROM sales s
JOIN customers c ON s.customer_id = c.customer_id
JOIN products p ON s.product_id = p.product_id
GROUP BY c.city
ORDER BY total_revenue DESC;
```
**Result:** Faridabad leads with 89,000, followed by Bangalore (81,000)

### Query 9: Revenue by category
**Question:** Which product category earns the most?
```sql
SELECT p.category, SUM(s.quantity * p.price) AS total_revenue
FROM sales s
JOIN products p ON s.product_id = p.product_id
GROUP BY p.category
ORDER BY total_revenue DESC;
```
**Result:** Electronics 308,000, Furniture 58,000, Stationery 7,500

### Query 10: Monthly revenue
**Question:** What is the total revenue for each month?
```sql
SELECT TO_CHAR(s.sale_date, 'YYYY-MM') AS sale_month,
       SUM(s.quantity * p.price) AS total_revenue
FROM sales s
JOIN products p ON s.product_id = p.product_id
GROUP BY TO_CHAR(s.sale_date, 'YYYY-MM')
ORDER BY sale_month;
```
**Result:** 2026-09: 116,000, 2026-10: 173,200, 2026-11: 84,300

---

## ▶️ How to Run This Project
1. Install **PostgreSQL** and **pgAdmin 4**.
2. Open pgAdmin and create a new database named `project_1`.
3. Open the Query Tool for `project_1`.
4. Open `sales_analysis.sql` from this repository.
5. Run the table creation and INSERT queries first.
6. Run each analysis query one by one and compare with the screenshots.

---

## 👩‍💻 About the Author
**Tanya Saini**
Aspiring Data Analyst and diploma student at Government Polytechnic Nilokheri. I am learning SQL, Excel, Power BI, Tableau and Python (Pandas, NumPy), and building projects to practice real business analysis.

- GitHub: [tanya20saini](https://github.com/tanya20saini)
- LinkedIn: [Tanya Saini](https://www.linkedin.com/in/tanya-saini-65378a434/)
- Email: tanya20saini@gmail.com

## 🤝 Support & Community
If you found this project useful:
- ⭐ Star this repository
- Share your feedback or suggestions
- Connect with me on LinkedIn
  
## 💡 Key Business Insights

| Business Area | Analysis |
|---------------|----------|
| Overall Revenue | Total revenue is 373,500 |
| Category Performance | Electronics contributes 308,000 (about 82%) |
| Top Product | Laptop earns the most (180,000) |
| Volume vs Revenue | Notebook Pack sells the most units (25) but earns the least (7,500) |
| City Performance | Faridabad leads (89,000), followed by Bangalore (81,000) |
| Data Quality | One sale has a NULL quantity, handled using IS NULL |

---

## 📸 Sample Output
![Sales table](sales_table.png)
![Revenue per product](query6_expensive_products.png)
![Revenue by city](query8_expensive_products.png)

---

## 🎯 Project Outcome
Built a relational database and performed end-to-end sales analysis using SQL, including JOINs, aggregations and NULL handling. This project demonstrates SQL skills for Data Analyst roles.
