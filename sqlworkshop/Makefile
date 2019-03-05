MYSQL_ENDPOINT=127.0.0.1
MYSQL_SERVICE=sqlworkshop_workshop_mysql_1

mysql-login:
	mysql -h $(MYSQL_ENDPOINT) -u root -pPassw0rd
mysql-sakila:
	# create schema
	-mysql -h $(MYSQL_ENDPOINT) -u root -pPassw0rd -e "drop database sakila;commit;";
	mysql -h $(MYSQL_ENDPOINT) -u root -pPassw0rd -e "show databases;";
	mysql -h $(MYSQL_ENDPOINT) -u root -pPassw0rd -e "source ./sakila/sakila-db/sakila-schema.sql;show warnings;commit;";
	mysql -h $(MYSQL_ENDPOINT) -u root -pPassw0rd -e "show databases;";
	# import data
	mysql -h $(MYSQL_ENDPOINT) -u root -pPassw0rd -e "use sakila;select count(*) from film;";
	mysql -h $(MYSQL_ENDPOINT) -u root -pPassw0rd -e "source ./sakila/sakila-db/sakila-data.sql;show warnings;commit;";
	mysql -h $(MYSQL_ENDPOINT) -u root -pPassw0rd -e "use sakila;select count(*) from film;";
