# 1. List number of films per category.
use sakila;
select c.name, c.category_id, count(ci.film_id) as films_per_category
from sakila.category as c
join sakila.film_category as ci
on c.category_id = ci.category_id
group by c.category_id;


# 2. Display the first and last names, as well as the address, of each staff member.
use sakila;
select s.first_name, s.last_name, a.address, a.address2
from sakila.staff as s
join sakila.address as a 
on s.address_id = a.address_id;


#3. Display the total amount rung up by each staff member in August of 2005.
use sakila;
select s.staff_id, s.first_name, s.last_name, sum(p.amount) as total_amount, substr(p.payment_date, 1,7) as August_2005
from sakila.staff as s
join sakila.payment as p 
on s.staff_id = p.staff_id
where substr(p.payment_date, 1,7) = '2005-08'
group by s.staff_id, s.first_name, s.last_name, substr(p.payment_date, 1,7);


#4 List each film and the number of actors who are listed for that film.
use sakila;
select f.title, count(a.actor_id) as actors_per_film
from sakila.actor as a
join sakila.film_actor as fa
on a.actor_id = fa.actor_id
join sakila.film as f
on f.film_id = fa.film_id
group by f.title
order by f.title;

use sakila;
select f.title, a.first_name, a.last_name, dense_rank() over (order by f.title) as movie_title
from sakila.actor as a
join sakila.film_actor as fa
on a.actor_id = fa.actor_id
join sakila.film as f
on f.film_id = fa.film_id
group by f.title, a.first_name, a.last_name;


#5  Using the tables payment and customer and the JOIN command, list the total paid by each customer.  
#   List the customers alphabetically by last name.
use sakila;
select c.last_name, c.first_name, sum(p.amount) as total_paid_by_customer
from sakila.customer as c
join sakila.payment as p
on c.customer_id = p.customer_id
group by c.last_name, c.first_name
order by c.last_name;

