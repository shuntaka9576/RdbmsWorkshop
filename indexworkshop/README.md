# Indexworkshop
## Description
Covering indexを利用して、クエリを高速化させる例題が入っています。
## Run
```bash
$ ./start.sh
```
## Test Query
```sql
select item_type, sum(item_price) from index_sample.item group by item_type;
```
## Test pattern
以下の3パターンの状況下で、クエリの実行速度を計測する
### non index pattern
インデックスを利用しないパターン
### anti pattern
`item_type`のみインデックスとして利用  
主キー以外のインデックスを使うと、インデックスを使って目的のレコードの主キーを取得して、そのレコードのデータ（ここでは item_price）を主キーで取りに行くという動きをし、ディスクI/Oがとても激しくなる  
インデックスを利用していない`non index pattern`の方が高速となる
### covering index pattern
`item_typ`eと`item_price`をインデックスとして利用  
`covering index`を利用することで、全パターンで最速
## How search works
<img src="https://user-images.githubusercontent.com/12817245/54083439-ca397880-4366-11e9-81b7-41a8e06b4dbc.png" width="640">

## Special Thanks
[【MySQL】Covering Index で処理が高速化するのを確認する](https://www.softel.co.jp/blogs/tech/archives/5139)
