# 🍽️ Swiggy Data Analysis using SQL

## 📌 Overview

This project analyzes a Swiggy dataset using SQL to uncover insights about restaurants, cuisines, pricing, ratings, and delivery trends. It demonstrates strong SQL skills such as data filtering, aggregation, grouping, and query optimization.

---

## 📂 Dataset

The dataset includes:

* Restaurant Name
* City
* Cuisine
* Rating
* Cost for Two
* Delivery Time

---

## 🎯 Objectives

* Perform data analysis using SQL queries
* Identify top-rated restaurants
* Analyze pricing trends across cities
* Discover popular cuisines
* Evaluate delivery performance

---

## 🛠️ Tools & Technologies

* SQL (MySQL / PostgreSQL / SQL Server)
* DBMS
* CSV Dataset

---

## 🗄️ Database Schema

```sql
CREATE TABLE swiggy_data (
    restaurant_name VARCHAR(255),
    city VARCHAR(100),
    cuisine VARCHAR(255),
    rating FLOAT,
    cost_for_two INT,
    delivery_time INT
);
```

---

## 🔍 Key SQL Queries

### Top Rated Restaurants

```sql
SELECT restaurant_name, rating
FROM swiggy_data
ORDER BY rating DESC
LIMIT 10;
```

### Average Cost by City

```sql
SELECT city, AVG(cost_for_two) AS avg_cost
FROM swiggy_data
GROUP BY city;
```

### Most Popular Cuisines

```sql
SELECT cuisine, COUNT(*) AS total
FROM swiggy_data
GROUP BY cuisine
ORDER BY total DESC;
```

### Fastest Delivery Restaurants

```sql
SELECT restaurant_name, delivery_time
FROM swiggy_data
ORDER BY delivery_time ASC
LIMIT 10;
```

### High Rated & Affordable Restaurants

```sql
SELECT restaurant_name, rating, cost_for_two
FROM swiggy_data
WHERE rating > 4.0 AND cost_for_two < 500;
```

---

## 📊 Key Insights

* High ratings do not always mean higher cost
* Some cities have significantly higher average food prices
* Popular cuisines vary by location
* Faster delivery is often linked to nearby/local restaurants

---

## 🚀 How to Run

1. Import the dataset into your SQL database
2. Create the table using the schema
3. Run the queries in your SQL environment
4. Modify queries to explore more insights

---

## 📁 Project Structure

```
├── dataset/
│   └── swiggy_data.csv
├── queries/
│   └── analysis.sql
├── README.md
```

---

## 👩‍💻 Author

**Akansha Shrivastava**
📧 [akansha2632002@gmail.com](mailto:akansha2632002@gmail.com)
🔗 GitHub: https://github.com/your-username

---

## 📜 License

This project is licensed under the MIT License.
