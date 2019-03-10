# Indexworkshop
## Description
Coveringindexを利用して、クエリを高速化させる例題が入っています。

## Run
```bash
$ ./start.sh
```

## Test Query
```sql
select item_type, sum(item_price) from index_sample.item group by item_type;
```

## How search works
<img src="https://user-images.githubusercontent.com/12817245/54083439-ca397880-4366-11e9-81b7-41a8e06b4dbc.png" width="640">
