select '*-*-*-*-*-*- no index test *-*-*-*-*-*-' as '';
show index from index_sample.item;
explain select item_type, sum(item_price) from index_sample.item group by item_type;
select item_type, sum(item_price) from index_sample.item group by item_type;
select '*-*-*-*-*-*- no index test(end) *-*-*-*-*-*-' as '';

select 'add index' as '';
alter table index_sample.item add index (item_type);

select '*-*-*-*-*-*- use index test *-*-*-*-*-*-' as '';
show index from index_sample.item;
explain select item_type, sum(item_price) from index_sample.item group by item_type;
select item_type, sum(item_price) from index_sample.item group by item_type;
select '*-*-*-*-*-*- use index test(end) *-*-*-*-*-*-' as '';
