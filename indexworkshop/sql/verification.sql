-- use table
use index_sample;
select * from item;

-- create index
DROP INDEX item_type on item;
alter table item add index (item_type);

-- play sql
select item_type, sum(item_price) from item group by item_type;
explain select item_type, sum(item_price) from item group by item_type;