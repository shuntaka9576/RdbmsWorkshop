-- init databases
DROP DATABASE IF EXISTS `index_sample`;

SELECT 'DROP CHECK' AS '';
SHOW DATABASES;
CREATE DATABASE `index_sample` CHARACTER SET utf8mb4;

-- check databases
SHOW DATABASES;

-- create table
USE index_sample;
CREATE TABLE item (
    item_id int primary key auto_increment,
    item_type int,
    item_price int,
    item_data1 text,
    item_data2 text,
    item_data3 text
 );

-- check talbe data
select count(*) from item;

-- write table data
insert into item (item_type, item_price) values (1, 100);
insert into item (item_type, item_price) values (2, 200);
insert into item (item_type, item_price) values (3, 300);
insert into item (item_type, item_price) values (4, 400);
insert into item (item_type, item_price) values (5, 500);
insert into item (item_type, item_price) select item_type, item_price from item;
insert into item (item_type, item_price) select item_type, item_price from item;
insert into item (item_type, item_price) select item_type, item_price from item;
insert into item (item_type, item_price) select item_type, item_price from item;
insert into item (item_type, item_price) select item_type, item_price from item;
insert into item (item_type, item_price) select item_type, item_price from item;
insert into item (item_type, item_price) select item_type, item_price from item;
insert into item (item_type, item_price) select item_type, item_price from item;
insert into item (item_type, item_price) select item_type, item_price from item;
insert into item (item_type, item_price) select item_type, item_price from item;
insert into item (item_type, item_price) select item_type, item_price from item;
insert into item (item_type, item_price) select item_type, item_price from item;
insert into item (item_type, item_price) select item_type, item_price from item;
insert into item (item_type, item_price) select item_type, item_price from item;
insert into item (item_type, item_price) select item_type, item_price from item;
insert into item (item_type, item_price) select item_type, item_price from item;
insert into item (item_type, item_price) select item_type, item_price from item;
insert into item (item_type, item_price) select item_type, item_price from item;
insert into item (item_type, item_price) select item_type, item_price from item;
insert into item (item_type, item_price) select item_type, item_price from item;

-- check talbe data
select count(*) from item;
