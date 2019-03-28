SELECT * FROM actor;
show tables;
describe actor;
describe address;
SELECT 
    rental.*,
    CONCAT(customer.first_name,
            ' ',
            customer.last_name) AS full_name
FROM

        INNER JOIN -- INNER JOIN or JOIN(default), LEFT JOIN, RIGHT JOINがある
    customer ON rental.customer_id = customer.customer_id;
    
    SELECT * FROM fullname;
    Show Create View fullname;
    CREATE 
    ALGORITHM = UNDEFINED 
    DEFINER = `root`@`%` 
    SQL SECURITY DEFINER
VIEW `fullname` AS
    SELECT 
        `rental`.`rental_id` AS `rental_id`,
        CONCAT(`customer`.`first_name`,
                `customer`.`last_name`) AS `fullname`
    FROM
        (`rental`
        JOIN `customer` ON ((`rental`.`customer_id` = `customer`.`customer_id`)))
        
        
SELECT * FROM actors;
desc actor;
SELECT * FROM fullname;
SELECT * FROM film;
SELECT * FROM city WHERE city =Qing;

SELECT * FROM country ;


SELECT * FROM actor ORDER BY last_name;

SELECT * FROM city;
SELECT * FROM address ;
SELECT * FROM coun;
SELECT * FROM country ;
SELECT * FROM country WHERE "country" ="Japan";
SELECT * FROM country WHERE "contry_id"=2;
SELECT * FROM country WHERE "contry_id"=1;
SELECT * FROM country WHERE "country"="Qing";

SELECT * FROM customer WHERE customer_id = 1;
SELECT * FROM country WHERE country = 'Qing' ;
SELECT CONCAT(customer.first_name,
            ' ',
            customer.last_name) AS full_name FROM customer;
SELECT 
    *
FROM
    film;
SELECT * FROM film WHERE rating IN ('G');
describe film_actor;
describe film;
desc actor;		
select * from  film_text;
select * from  film;
select * from  inventory;
select * from  inventory LEFT JOIN film ON film.film_id = inventory.film_id;

-- inventory と filmとstoreを　JOIN でくっつけて　映画名がBlackから始まるレコードだけ取り出す。 
SELECT 
    *
FROM
    inventory
        INNER JOIN
    film ON film.film_id = inventory.film_id
		INNER JOIN
	store on store.store_id = inventory.store_id
    WHERE title like'Black%';   
    
    select * from language;
    SELECT 
    *
FROM
    payment;
    -- rental料の多い順にcustomerの名前を並べる。
    SELECT 
    CONCAT(customer.first_name,
            ' ',
            customer.last_name) AS full_name,
    SUM(payment.amount)
FROM
    customer
        INNER JOIN
    payment ON payment.customer_id = customer.customer_id
GROUP BY full_name
ORDER BY SUM(payment.amount) DESC
;
    
    SELECT payment.amount from payment;
    SELECT * from rental;
    SELECT * from staff;
    SELECT * FROM store;
    -- 各フィルムに出ている俳優の名前が分かるSQL
    SELECT 
    film.film_id,
    actor.actor_id,
    film.title,
    CONCAT(actor.first_name, ' ', actor.last_name) AS full_name
FROM
    film
        INNER JOIN
    film_actor ON film.film_id = film_actor.film_id
        INNER JOIN
    actor ON film_actor.actor_id = actor.actor_id;
    
    -- どの俳優が一番フィルムに出ているか分かるSQL
    SELECT 
    film.film_id,
    actor.actor_id,
    CONCAT(actor.first_name, ' ', actor.last_name) AS full_name,
    COUNT(film.film_id)
FROM
    film
        INNER JOIN
    film_actor ON film.film_id = film_actor.film_id
        INNER JOIN
    actor ON film_actor.actor_id = actor.actor_id
    GROUP BY actor_id
    ORDER BY COUNT(film.film_id) DESC;


	--  memo
select * from actor;
select * from film_actor;
select * from film;
