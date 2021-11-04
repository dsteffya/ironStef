# 1. Which actor has appeared in the most films?
select count(film_actor.actor_id) as film_count, actor.first_name, actor.last_name 
from actor join film_actor on actor.actor_id = film_actor.actor_id
group by film_actor.actor_id order by film_count desc limit 1;

#2. Most active customer (the customer that has rented the most number of films)
select customer_id, count(*) as total_rentals
from rental
group by customer_id
order by total_rentals desc limit 1;

#3.List number of films per category
select category.name, count(film_category.film_id)
from category left join film_category
on film_category.category_id = category.category_id
group by category.category_id, category.name;

#4.Display the first and last names, as well as the address, of each staff member.
select s.first_name as 'First Name', s.last_name as 'Last Name', a.address as 'Address'
from staff as s
join address as a 
on a.address_id = s.address_id;

#5. Display the total amount rung up by each staff member in August of 2005.
select concat(s.first_name,' ',s.last_name) as 'Staff Member', sum(p.amount) as 'Total Amount'
from payment as p
join staff as s
on p.staff_id = s.staff_id
where payment_date like '2005-08%'
group by p.staff_id;
    
#6. List each film and the number of actors who are listed for that film.
select f.title as 'Film', count(fa.actor_id) as 'Number of Actors'
from film as f
join film_actor as fa
on f.film_id = fa.film_id
group by f.title;

#7. Using the tables payment and customer and the JOIN command, list the total paid by each customer. List the customers alphabetically by last name.
select concat(c.first_name,' ',c.last_name) as 'Customer Name', sum(p.amount) as 'Total Paid'
from payment as p
join customer as c
on p.customer_id = c.customer_id
group by p.customer_id;

#BONUS Which is the most rented film? The answer is Bucket Brotherhood
select i.film_id, f.title, count(r.inventory_id)as count_inventory
from inventory as i
join rental as r
on i.inventory_id = r.inventory_id
join film_text as f 
on i.film_id = f.film_id
group by r.inventory_id
order by count_inventory desc;

# SQL Joins on multiple tables
#1. Write a query to display for each store its store ID, city, and country.
select s.store_id, c.city, cy.country
from store as s
join address as a on a.address_id = s.address_id
join city as c on c.city_id = a.city_id
join country as cy on cy.country_id = c.country_id
order by s.store_id;

#2.Write a query to display how much business, in dollars, each store brought in.
select concat(c.city,', ',cy.country) as `Store`, s.store_id as 'Store ID', sum(p.amount) as `Total Sales` 
from payment as p
join rental as r on r.rental_id = p.rental_id
join inventory as i on i.inventory_id = r.inventory_id
join store as s on s.store_id = i.store_id
join address as a on a.address_id = s.address_id
join city as c on c.city_id = a.city_id
join country as cy on cy.country_id = c.country_id
group by s.store_id;


