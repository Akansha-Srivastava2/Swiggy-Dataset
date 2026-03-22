# 🍽️ Swiggy Data Analysis using SQL

## 📌 Overview

This project analyzes a Swiggy dataset using SQL to uncover insights about restaurants, cuisines, pricing, ratings, and delivery trends. It demonstrates strong SQL skills such as data filtering, aggregation, grouping, and query optimization.

---

## 📂 Dataset

The dataset includes:

*  Name
* City
* Cuisine
* Rating
* Cost 
* link
* rating_count
* id

---

## 🎯 Objectives

* Perform data analysis using SQL queries
* Identify top-rated restaurants
* Analyze pricing trends across cities
* Discover popular cuisines
* Evaluate delivery performance

---

## 🛠️ Tools & Technologies

* SQL (MySQL)

---

## 🗄️ Database Schema

```sql
CREATE TABLE restaurants (
    name VARCHAR(255),
    city VARCHAR(100),
    cuisine VARCHAR(255),
    rating FLOAT,
    rating_count INT,
     id INT,
     cost INT ,
     LINK VARCHAR(255)
);
```

---

## 🔍 Key SQL Queries

### Top Rated Restaurants

```sql
SELECT name, rating
FROM restaurants
ORDER BY rating DESC
LIMIT 10;
```

### Average Cost by City

```sql
SELECT city, AVG(cost) AS avg_cost
FROM restaurants
GROUP BY city;
```

### Most Popular Cuisines

```sql
SELECT cuisine, COUNT(*) AS total
FROM restaurants
GROUP BY cuisine
ORDER BY total DESC;
```


```

```

### High Rated & Affordable Restaurants

```sql
SELECT name, rating, cost
FROM restaurants
WHERE rating > 4.0 AND cost < 500;
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
│   └── restaurants.csv
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
