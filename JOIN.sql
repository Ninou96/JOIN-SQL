select * from sakila.store;
select * from sakila.country;
select* from sakila.address;
select * from sakila.city;
## Write a query to display for each store its store ID, city, and country.
select s.store_id, s.address_id, cy.country_id, c.city_id
from store s
join address as a on s.address_id = a.address_id
join city as c on c.city_id = a.city_id
join country as cy on cy.country_id = c.country_id
order by s.store_id;
## Write a query to display how much business, in dollars, each store brought in.
select store as 'Store', total_sales as 'Total Sales' from sales_by_store;

	select concat(c.city,', ',cy.country) as `Store`, s.store_id as 'Store ID', sum(p.amount) as `Total Sales` 
	from payment as p
	join rental as r on r.rental_id = p.rental_id
	join inventory as i on i.inventory_id = r.inventory_id
	join store as s on s.store_id = i.store_id
	join address as a on a.address_id = s.address_id
	join city as c on c.city_id = a.city_id
	join country as cy on cy.country_id = c.country_id
	group by s.store_id;
    
    
    ## What is the average running time of films by category?
select category.name, avg(length)
from film join film_category using (film_id) join category using (category_id)
group by category.name
order by avg(length) desc;
## Which film categories are longest?
select category.name, avg(length)
from film join film_category using (film_id) join category using (category_id)
group by category.name
having avg(length) > (select avg(length) from film)
order by avg(length) desc;

## Display the most frequently rented movies in descending order.
select f.title as 'Movie', count(r.rental_date) as 'Times Rented'
	from film as f
	join inventory as i on i.film_id = f.film_id
	join rental as r on r.inventory_id = i.inventory_id
	group by f.title
	order by count(r.rental_date) desc;
    
    
    
    ## List the top five genres in gross revenue in descending order.
select c.name, sum(p.amount) as 'Gross Revenue' 
    from category c
	join film_category fc on fc.category_id = c.category_id
    join inventory i on i.film_id = fc.film_id
    join rental r on r.inventory_id = i.inventory_id
   join payment p on p.rental_id = r.rental_id
    group by c.name
    order by sum(p.amount) desc
    limit 5;
    
    
    
##  Is "Academy Dinosaur" available for rent from Store 1?
select film.film_id, film.title, store.store_id, inventory.inventory_id
from inventory join store using (store_id) join film using (film_id)
where film.title = 'Academy Dinosaur' and store.store_id = 1;

