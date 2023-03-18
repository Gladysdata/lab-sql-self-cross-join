USE sakila ;

#Get all pairs of actors that worked together
SELECT a.film_id, a.actor_id,b.actor_id FROM film_actor AS a
JOIN film_actor AS b ON a.film_id = b.film_id
AND a.actor_id < b.actor_id
ORDER BY a.film_id, a.actor_id ;

#Get all pairs of customers that have rented the same film more than 3 times
#To be honest, I asked a colleague from work who works as a data analyst and who did this ironhack for help
SELECT  sub1.customer_id AS customer1,sub2.customer_id AS customer2
, count(sub1.film_id) AS filmCount
FROM (
SELECT customer_id, film_id
FROM inventory JOIN rental USING (inventory_id))sub1
INNER JOIN (
SELECT customer_id, film_id
FROM inventory JOIN rental USING (inventory_id))sub2
ON sub1.film_id=sub2.film_id 
AND sub1.customer_id<>sub2.customer_id 
AND sub1.customer_id<sub2.customer_id
GROUP BY sub1.customer_id,sub2.customer_id 
HAVING filmCount > 3 ;

#Get all possible pairs of actors and films
SELECT a.film_id, a.actor_id,b.actor_id,b.film_id FROM film_actor a
JOIN film_actor b ON a.actor_id < b.actor_id
AND a.film_id < b.film_id
ORDER BY a.film_id, a.actor_id ;