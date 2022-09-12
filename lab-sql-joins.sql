use sakila;



-- 1. List the number of films per category.
select * from category;
select * from film_category;

select c.category_id, c.name, count(f.film_id) from category c
join film_category f on c.category_id = f.category_id
group by category_id;



-- 2. Display the first and the last names, as well as the address, of each staff member.

select * from staff;
select * from address;

select s.first_name, s.last_name, s.address_id, a.address from staff s
join address a on s.address_id = a.address_id;



-- 3. Display the total amount rung up by each staff member in August 2005.

select * from payment;

select staff_id, count(amount), month(payment_date), year(payment_date) from payment
where month(payment_date) = 8 and year(payment_date) = 2005
group by staff_id;



-- 4. List all films and the number of actors who are listed for each film.

select * from film_actor;
select * from film;

select f.film_id, f.title, count(fa.actor_id) as 'Nº actors' from film f
join film_actor fa on f.film_id = fa.film_id
group by film_id
order by count(fa.actor_id) desc;



-- 5. Using the payment and the customer tables as well as the JOIN command, list the total amount paid by each customer.
--  List the customers alphabetically by their last names.

select * from payment;
select * from customer;

select c.customer_id, c.first_name, c.last_name, sum(p.amount) as 'total paid'
from customer c
join payment p on c.customer_id = p.customer_id
group by customer_id
order by last_name asc;