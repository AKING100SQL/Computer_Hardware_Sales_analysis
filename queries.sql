--------------------------------------------------------------------------------------------------------------
-- Queries
--------------------------------------------------------------------------------------------------------------

-- Primary and Foreign Keys 

-- Adding Foreign Key to Transactions Table
ALTER TABLE transactions ADD CONSTRAINT fk_customers FOREIGN KEY (customer_id) REFERENCES customers(customer_id)

Adding Primary Key to Customers Table – 
ALTER TABLE customers ADD constraint  pk_customer PRIMARY KEY (customer_id) 

--------------------------------------------------------------------------------------------------------------
-- Easy Queries
--------------------------------------------------------------------------------------------------------------
-- Who is the oldest customer, based on age? 
SELECT * FROM computer_hardware_store.customers order by age DESC

-- Please show all customers transactions for CUST0247.
SELECT * FROM transactions WHERE customer_id = 'CUST0247'

-- Show the top 10 highest transactions
SELECT*FROM transactions ORDER BY total_price DESC LIMIT 10

-- Show all transactions after 30 April 2023. Please order these by the most expensive transactions.
SELECT*FROM transactions WHERE order_date > '2023-4-30' ORDER BY total_price DESC

-- What is the total number of customers in the database? 
SELECT COUNT(*) FROM customers

--------------------------------------------------------------------------------------------------------------
-- Intermediate Queries
--------------------------------------------------------------------------------------------------------------
-- Please return all the customers whose last names begin with B and are under the age of 50. We are trying to narrow down some orders to specific customers.
SELECT *FROM customers WHERE last_name LIKE  'b%'  AND  age  < 50

-- Which region has the least sales and which has the most? 
SELECT region, COUNT(*) as 'no_of_transacs' from transactions GROUP BY region ORDER BY no_of_transacs DESC

-- List customers who have spent more than $1,000 in total. 
SELECT customers.customer_id, first_name, last_name, SUM(total_price) AS total_amount_spent, age, customers.region, gender FROM customers JOIN transactions ON customers.customer_id = transactions.customer_id GROUP BY customers.customer_id, first_name, last_name HAVING total_amount_spent >= '1000' ORDER BY total_amount_spent DESC

-- Get the total number of transactions each customer has made. 
SELECT customers.customer_id, first_name, last_name, count(*) AS number_of_transactions FROM transactions JOIN customers ON transactions.customer_id = customers.customer_id GROUP BY customers.customer_id, first_name, last_name

-- What is the average transaction amount for each month of 2023?
SELECT DATE_FORMAT(order_date,'%b, %Y') AS 'month', ROUND(AVG(total_price),2) AS 'average_transac_price' FROM transactions GROUP BY Month LIMIT 12

--------------------------------------------------------------------------------------------------------------
-- Tough Queries 
--------------------------------------------------------------------------------------------------------------
-- Show the average transaction amount for each customer, highest to lowest please.
SELECT customers.customer_id, first_name, last_name, ROUND(AVG(total_price),2) AS average_total_price FROM transactions JOIN customers ON transactions.customer_id=customers.customer_id GROUP BY customers.customer_id ORDER BY average_total_price DESC

-- Please find customers who are consistent spenders (spend around the same amount every transaction) in Germany. We want to differentiate who the most consistent spenders between men and women are, over there.
SELECT customers.customer_id, first_name, last_name, gender, customers.region, COUNT(order_id) AS no_of_transacs, ROUND(stddev_pop(total_price),2) AS std_dev FROM computer_hardware_store.transactions JOIN computer_hardware_store.customers on transactions.customer_id = customers.customer_id WHERE (transactions.region REGEXP 'Germany') GROUP BY customer_id HAVING COUNT(order_id) > 1 ORDER BY gender asc

-- Which day of the week do customers in each country spend the most on average?
WITH daily_avg AS (SELECT DAYNAME(order_date) AS "day_of_week", transactions.region, ROUND(AVG(total_price),2) AS 'avg_spending' FROM transactions JOIN customers ON transactions.customer_id=customers.customer_id GROUP BY transactions.region, day_of_week), ranked_days AS (SELECT *, ROW_NUMBER() OVER (PARTITION BY region ORDER BY avg_spending DESC) AS 'rank' FROM daily_avg) SELECT region, day_of_week, avg_spending FROM ranked_days ORDER BY avg_spending DESC
