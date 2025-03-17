/* Sakila DVD Rental Data Analysis */


-- All films with PG-13 rating and rental rate of 2.99 or lower

SELECT 
    *
FROM
    film
WHERE
    rating = 'PG-13' AND rental_rate <= 2.99;

-- All films that have deleted scenes
SELECT 
    f.title, f.special_features, f.release_year
FROM
    film f
WHERE
    f.special_features LIKE '%deleted%';

-- All active customers
SELECT 
    COUNT(*)
FROM
    customer
WHERE
    active = 1;

-- List of customers who rented a movie on 26th July, 2005

SELECT 
    c.customer_id,
    r.rental_date,
    CONCAT(c.first_name, '', c.last_name) AS customer_name
FROM
    rental r
        JOIN
    customer c ON c.customer_id = r.customer_id
WHERE
    DATE(r.rental_date) = '2005-07-26';

-- Distinct name of customers who rented a movie on 26th July, 2005

SELECT DISTINCT
    r.customer_id,
    CONCAT(c.first_name, ' ', c.last_name) AS customer_name
FROM
    rental r
        JOIN
    customer c ON c.customer_id = r.customer_id
WHERE
    DATE(r.rental_date) = '2005-07-26';

-- Distinct last names

SELECT 
    COUNT(DISTINCT c.last_name)
FROM
    customer c;

SELECT DISTINCT
    c.last_name
FROM
    customer c;

-- How many rentals we do each day?
SELECT 
    DATE(rental_date) AS d, COUNT(*)
FROM
    rental r
GROUP BY DATE(rental_date);

-- Finding busiest day
SELECT 
    DATE(rental_date) AS d, COUNT(*)
FROM
    rental r
GROUP BY DATE(rental_date)
ORDER BY COUNT(*) DESC;

-- List all scifi movies in our catelog

SELECT 
    fc.film_id, fc.category_id, c.name, f.title
FROM
    film_category fc
        JOIN
    category c ON c.category_id = fc.category_id
        JOIN
    film f ON f.film_id = fc.film_id
WHERE
    c.name = 'Sci-Fi';

-- Report of customer vise rental information

SELECT 
    COUNT(*) AS count,
    c.customer_id,
    CONCAT(c.first_name, '', c.last_name) AS customer_name
FROM
    customer c
        JOIN
    rental r ON r.customer_id = c.customer_id
GROUP BY customer_id
ORDER BY COUNT(*) DESC;

-- Remove movies which have less than 1 rentals in lifetime
with lowrentals as (select inventory_id, count(*)
from rental r 
group by inventory_id
having count(*) <=1
order by count(*) DESC)

select lowrentals.inventory_id, i.film_id, f.title
from lowrentals
join inventory i on i.inventory_id=lowrentals.inventory_id
join film f on f.film_id=i.film_id;

-- WHICH MOVIES HAS NOT BEEN RETURNED YET?
SELECT 
    f.film_id,
    f.title,
    rental_date,
    r.customer_id,
    CONCAT(c.first_name, ' ', c.last_name) AS customer_name
FROM
    RENTAL r
        JOIN
    inventory i ON i.inventory_id = r.inventory_id
        JOIN
    film f ON f.film_id = i.film_id
        JOIN
    customer c ON c.customer_id = r.customer_id
WHERE
    r.return_date IS NULL





