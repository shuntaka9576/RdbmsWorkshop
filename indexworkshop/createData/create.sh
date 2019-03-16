#!/bin/bash

MYSQL_ENDPOINT=127.0.0.1
mysql -h $MYSQL_ENDPOINT -u root -pPassw0rd -t -e "source ../createData/createData.sql;show warnings;commit;";
