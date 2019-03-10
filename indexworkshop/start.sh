#!/bin/bash

readonly PROCNAME=${0##*/}
function log() {
  local fname=${BASH_SOURCE[1]##*/}
  echo -e "$(date '+%Y-%m-%dT%H:%M:%S') ${PROCNAME} (${fname}:${BASH_LINENO[0]}:${FUNCNAME[1]}) $@"
}

MYSQL_ENDPOINT=127.0.0.1
testQuery() {
  log '======== start query ========'
  log 'show index'
  mysql -h $MYSQL_ENDPOINT -u root -pPassw0rd -t -e "source ./sql/showIndex.sql";
  log 'explain'
  mysql -h $MYSQL_ENDPOINT -u root -pPassw0rd -t -e "source ./sql/explainQuery.sql";
  time (cat ./sql/testQuery.sql | mysql -h $MYSQL_ENDPOINT -u root -pPassw0rd > /dev/null)
  log '======== end query ========'
}

log 'Create dabase and table data'
mysql -h $MYSQL_ENDPOINT -u root -pPassw0rd -t -e "source ./sql/createData.sql;show warnings;commit;";

log '*=*=*=*=*=*=*=*=*=*=*=*=*=*=*= Run test query(non index) *=*=*=*=*=*=*=*=*=*=*=*=*=*=*='
testQuery

log 'Add index(use index)'
mysql -h $MYSQL_ENDPOINT -u root -pPassw0rd -t -e "source ./sql/addIndex.sql;show warnings;commit;";
log '*=*=*=*=*=*=*=*=*=*=*=*=*=*=*= Run test query(use index) *=*=*=*=*=*=*=*=*=*=*=*=*=*=*='
testQuery

log 'Add index(use index_fast)'
mysql -h $MYSQL_ENDPOINT -u root -pPassw0rd -t -e "source ./sql/addIndex_fast.sql;show warnings;commit;";
log '*=*=*=*=*=*=*=*=*=*=*=*=*=*=*= Run test query(use index_fast) *=*=*=*=*=*=*=*=*=*=*=*=*=*=*='
testQuery
