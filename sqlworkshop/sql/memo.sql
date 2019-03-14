/*
	各テーブルの中身を確認する
*/
select * from actor;      select * from address;    select * from category;
select * from city;       select * from country;    select * from customer;
select * from film;       select * from film_actor; select * from film_category;
select * from film_text;  select * from inventory;  select * from language;
select * from payment;    select * from rental;     select * from staff;
select * from store;

/*
	色んな取り出し方
*/
-- レンタルテーブルに顧客テーブルを結合して、レンタルした人のフルネームを表示させる
SELECT 
    rental.*,
    CONCAT(customer.first_name,
            ' ',
            customer.last_name) AS full_name
FROM
    rental
        INNER JOIN -- INNER JOIN or JOIN(default), LEFT JOIN, RIGHT JOINがある
    customer ON rental.customer_id = customer.customer_id;

-- 客が何回レンタルしたかを集計する
SELECT 
    CONCAT(customer.first_name,
            ' ',
            customer.last_name) AS full_name,
    COUNT(*) AS count
FROM
    rental
        INNER JOIN
    customer ON rental.customer_id = customer.customer_id
GROUP BY full_name
-- ORDER BY count ASC -- 昇順(default)
ORDER BY count DESC -- 降順
;

-- 各フィルムの名前とそのカテゴリ
SELECT 
	film.title,
    category.name
FROM
    film
        INNER JOIN
    film_category ON film.film_id = film_category.film_id
        INNER JOIN
    category ON film_category.category_id = category.category_id;

-- カテゴリ毎のフィルムの個数
SELECT 
    category.name, COUNT(*) AS count
FROM
    film
        INNER JOIN
    film_category ON film.film_id = film_category.film_id
        INNER JOIN
    category ON film_category.category_id = category.category_id
GROUP BY category.name
ORDER BY count DESC
;

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

