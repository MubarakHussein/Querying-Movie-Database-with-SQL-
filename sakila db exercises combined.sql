USE sakila;

-- 1) You are helping the casting director create a contact list of all actors. 
-- Retrieve the first and last names of all actors.

SELECT concat_ws(' ', a.first_name, a.last_name) as ActorNames FROM actor AS a;


-- 2) A colleague remembers meeting an actor named “Joe” but not the last name. 
-- Find all actors with the first name “Joe”.

SELECT * FROM actor WHERE actor.first_name = "Joe";


-- 3) The theater manager wants a list of films that run for 3 hours or more. 
-- Show relevant film details.

SELECT * FROM film WHERE length >= 180;


-- 4) While verifying account details, retrieve customers whose last name starts with "S" 
-- and first name ends with "N".

SELECT * FROM customer WHERE last_name LIKE 'S%' AND first_name LIKE '%N';

-- 5) The accounting team needs a list of all payments made on or after May 27, 2005. 
-- Return relevant payment records.

SELECT * FROM payment where payment_date > '2005-05-27';


-- 6) Marketing is planning campaigns in Afghanistan, Bangladesh, and China. 
-- Display the country_id and country names for these.

SELECT country_id, country FROM country WHERE country IN('Afghanistan', 'Bangladesh', 'China');


-- 7) The media team is interested in actors with "GEN" in their last names. 
-- Find such actors.

SELECT * FROM actor WHERE actor.last_name LIKE "%GEN%";


-- 8) You’re compiling a list of actors whose last names include "LI", 
-- ordered alphabetically by last name and first name.

SELECT * FROM actor WHERE actor.last_name LIKE "%LI%" ORDER BY actor.last_name, actor.first_name;


-- 9) The director remembers working with an actress named "Scarlett". 
-- Retrieve actors with that first name.

SELECT * FROM actor WHERE actor.first_name = "Scarlett";


-- 10) A staff member recalls an actor with the last name “Johansson”. 
-- List all actors with that surname.

SELECT * FROM actor WHERE actor.last_name = "Johansson";


-- 11) A partner wants movies where the description ends in "Boat" and rental duration is over 6. 
-- Return title, description, and rental duration.

SELECT * FROM film WHERE description LIKE '%Boat' AND rental_duration > 6;


-- 12) Management wants to know how many unique actor last names exist. 
-- Provide a count of distinct last names.

SELECT COUNT(DISTINCT last_name) FROM actor;


-- 13) A customer wants to know when the movie “Academy Dinosaur” is due back. 
-- Find the due date from rental data.

SELECT r.return_date FROM rental as R INNER JOIN inventory AS i ON r.inventory_id = i.inventory_id INNER JOIN film as f ON f.film_id = i.film_id WHERE f.title = 'Academy Dinosaur';


-- 14) A distributor is reviewing average film lengths. 
-- Calculate the average running time of all films.

SELECT AVG(length) FROM film;


-- 15) HR needs a list of staff members with their addresses. 
-- Use a join to retrieve staff names and address.

SELECT concat_ws(' ', s.first_name, s.last_name) as StaffNames, a.address FROM staff AS s INNER JOIN address AS a ON  s.address_id = a.address_id;


-- 16) Management wants to track staff performance. 
-- Show each staff member's name and the payment amounts they processed.

SELECT concat_ws(' ', s.first_name, s.last_name) as StaffNames, SUM(p.amount) as Amount FROM staff AS s INNER JOIN payment as p ON s.staff_id = p.staff_id GROUP BY StaffNames;


-- 17) HR is auditing August 2005. 
-- List staff and payments processed during that month.

SELECT * FROM staff AS s INNER JOIN payment as p ON s.staff_id = p.staff_id WHERE YEAR(p.payment_date) = 2005 AND MONTH(p.payment_date) = 8; 


-- 18) Summarize the total payment amounts processed by each staff member in August 2005.

SELECT concat_ws(' ', s.first_name, s.last_name) as StaffNames, SUM(p.amount) as Amount FROM staff AS s INNER JOIN payment as p ON s.staff_id = p.staff_id WHERE YEAR(p.payment_date) = 2005 AND MONTH(p.payment_date) = 8 GROUP BY StaffNames; 


-- 19) A film historian wants to know how many actors are in each film. 
-- Provide film titles and the number of associated actors.

SELECT f.title AS FilmName, COUNT(fa.actor_id) AS NumberOfActors FROM film_actor AS fa INNER JOIN film AS f ON f.film_id = fa.film_id GROUP BY f.title;


-- 20) Inventory is checking how many copies of “Hunchback Impossible” are in stock. 
-- Count the copies using film and inventory tables.

SELECT COUNT(f.title) as Copies FROM film AS f INNER JOIN inventory AS i ON f.film_id = i.film_id WHERE f.title = 'Hunchback Impossible';


-- 21) Generate a report listing all payments by each customer, 
-- sorted alphabetically by last name.

SELECT concat_ws(' ', c.first_name, c.last_name) AS CustomerName, p.payment_id, p.amount, p.payment_date FROM payment AS p INNER JOIN customer AS c ON p.customer_id = c.customer_id ORDER BY c.last_name;


-- 22) Provide the total amount paid by each customer, 
-- ordered alphabetically by last name.

SELECT concat_ws(' ', c.first_name, c.last_name) AS CustomerName, SUM(p.amount) AS Total FROM payment AS p INNER JOIN customer AS c ON p.customer_id = c.customer_id GROUP BY CustomerName ORDER BY c.last_name;






