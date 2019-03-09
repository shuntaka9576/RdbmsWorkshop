#!/bin/bash

MYSQL_ENDPOINT=127.0.0.1

testQuery() {
    echo '=============== STR Query ==============='
    echo '=============== show index ==============='
    mysql -h $MYSQL_ENDPOINT -u root -pPassw0rd -t -e "source ./sql/showIndex.sql";
    echo '=============== explain ==============='
    mysql -h $MYSQL_ENDPOINT -u root -pPassw0rd -t -e "source ./sql/explainQuery.sql";
    time (cat ./sql/testQuery.sql | mysql -h $MYSQL_ENDPOINT -u root -pPassw0rd > /dev/null)
    echo '=============== END Query ==============='
}

echo '*=*=*=*=*=*=*=*=*=*=*=*=*=*=*= Create dabase and table data *=*=*=*=*=*=*=*=*=*=*=*=*=*=*='
mysql -h $MYSQL_ENDPOINT -u root -pPassw0rd -t -e "source ./sql/createData.sql;show warnings;commit;";

echo '*=*=*=*=*=*=*=*=*=*=*=*=*=*=*= Run test query(non index) *=*=*=*=*=*=*=*=*=*=*=*=*=*=*='
testQuery

echo '*=*=*=*=*=*=*=*=*=*=*=*=*=*=*= Add index *=*=*=*=*=*=*=*=*=*=*=*=*=*=*='
mysql -h $MYSQL_ENDPOINT -u root -pPassw0rd -t -e "source ./sql/addIndex.sql;show warnings;commit;";

echo '*=*=*=*=*=*=*=*=*=*=*=*=*=*=*= Run test query(use index) *=*=*=*=*=*=*=*=*=*=*=*=*=*=*='
testQuery

