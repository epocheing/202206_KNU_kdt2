show databases;
use sakila;
show tables;


# group by

select * from payment;

select customer_id,
	max(amount) as max_amt,
	min(amount) as min_amt,
	avg(amount) as avg_amt,
	sum(amount) as tot_amt,
	count(*) as num_payments
from payment
group by customer_id ;


# unique value
select count(customer_id) as num_rows,


# rollup
select fa.actor_id, f.rating, count(*)
from film_actor as fa
	inner join film as f
	on fa.film_id = f.film_id
group by fa.actor_id, f.rating with ROLLUP 
order by 1, 2;


select customer_id, count(*), sum(amount)
from payment 
group by customer_id;
