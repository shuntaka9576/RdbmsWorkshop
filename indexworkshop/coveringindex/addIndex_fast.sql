select 'drop index item_type' as '';
drop index item_type on index_sample.item;

select 'add index fast' as '';
alter table index_sample.item add index (item_type, item_price);
