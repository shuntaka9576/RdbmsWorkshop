FROM mysql:8
ADD ./change_default_auth.cnf /etc/mysql/conf.d/.
RUN mkdir /etc/mysql/mysql.conf.d
ADD ./my.cnf /etc/mysql/conf.d/.
CMD ["mysqld"]
