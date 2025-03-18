# Sakila Database

## Overview
The **Sakila Database** is a sample database provided by MySQL that represents a DVD rental store. It contains a rich schema with tables representing customers, films, rentals, actors, and staff, making it an excellent resource for practicing SQL queries, database management, and relational data modeling.

## Database Schema
The **Sakila** database consists of several tables categorized as follows:

### **Main Tables**
- **actor** – Stores actor details (first name, last name, etc.).
- **film** – Stores movie details (title, description, release year, etc.).
- **customer** – Stores customer information (name, email, address, etc.).
- **rental** – Stores rental transaction details.
- **payment** – Stores payment details for rentals.

### **Linking Tables**
- **film_actor** – Links actors to films.
- **inventory** – Links films to available stock in stores.
- **film_category** – Links films to their genres/categories.

### **Support Tables**
- **staff** – Contains details of store staff members.
- **store** – Contains store location and inventory details.
- **address** – Stores addresses of customers, staff, and stores.
- **city** – Stores city names linked to addresses.
- **country** – Stores country names linked to cities.

## Installation
To install and use the Sakila database in MySQL, follow these steps:

1. **Download the Sakila Database** from the official MySQL website:
   - [https://dev.mysql.com/doc/index-other.html](https://dev.mysql.com/doc/index-other.html)

2. **Connect to MySQL** using a terminal or MySQL Workbench:
   ```sh
   mysql -u root -p
   ```

3. **Create the Sakila Database** (if not already created):
   ```sql
   CREATE DATABASE sakila;
   ```

4. **Load the Schema and Data**:
   ```sh
   SOURCE /path/to/sakila-schema.sql;
   SOURCE /path/to/sakila-data.sql;
   ```
   *(Replace `/path/to/` with the actual path where you downloaded the files.)*

5. **Verify the Installation**:
   ```sql
   USE sakila;
   SHOW TABLES;
   ```

## Example Queries
Here are some example SQL queries to get started:

1. **Retrieve all movies and their categories:**
   ```sql
   SELECT f.title, c.name
   FROM film f
   JOIN film_category fc ON f.film_id = fc.film_id
   JOIN category c ON fc.category_id = c.category_id;
   ```

2. **Find the top 5 most rented movies:**
   ```sql
   SELECT f.title, COUNT(r.rental_id) AS rental_count
   FROM rental r
   JOIN inventory i ON r.inventory_id = i.inventory_id
   JOIN film f ON i.film_id = f.film_id
   GROUP BY f.title
   ORDER BY rental_count DESC
   LIMIT 5;
   ```

3. **List all customers who have rented a movie in the last 30 days:**
   ```sql
   SELECT DISTINCT c.first_name, c.last_name, c.email
   FROM customer c
   JOIN rental r ON c.customer_id = r.customer_id
   WHERE r.rental_date >= NOW() - INTERVAL 30 DAY;
   ```

## Use Cases
The **Sakila Database** is useful for:
- **Learning SQL**: Practicing complex queries, joins, and aggregations.
- **Database Design**: Understanding relational data modeling.
- **Performance Tuning**: Optimizing queries for efficiency.
- **Data Analysis**: Extracting insights from rental data.

## License
The **Sakila Database** is provided by **MySQL** as a free sample dataset under an open license.

## Resources
- [Official MySQL Sakila Documentation](https://dev.mysql.com/doc/sakila/en/)
- [Sakila Database Schema Diagram](https://dev.mysql.com/doc/sakila/en/sakila-structure.html)

---
Enjoy exploring the **Sakila Database**! 🚀

