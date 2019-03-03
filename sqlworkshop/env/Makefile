# Docker env
DOCKERCMD=docker
DOCKERBUILD=$(DOCKERCMD) build
DOCKEREXEC=$(DOCKERCMD) exec
DOCKERPULL=$(DOCKERCMD) pull
DOCKERPUSH=$(DOCKERCMD) push
DOCKERTAG=$(DOCKERCMD) tag
DOCKERSTOP=$(DOCKERCMD) stop
DOCKERRM=$(DOCKERCMD) rm
DOCKERPS=$(DOCKERCMD) ps
DOCKERIMAGES=$(DOCKERCMD) images
DOCKERRUN=$(DOCKERCMD) run
REPOSITORY_URI=hozi894/mysql8.0
CONTAINERNAME=dockermysql8.0
MYSQLPASSWORD=Passw0rd

# DockerCMD
build:
	$(DOCKERBUILD) -t $(REPOSITORY_URI):latest .
clean:
	# containerの停止
	$(DOCKERPS) | grep $(REPOSITORY_URI) | awk '{print $$1}' | xargs $(DOCKERSTOP)
	# containerの削除
	$(DOCKERPS) -a | grep $(REPOSITORY_URI) | awk '{print $$1}' | xargs $(DOCKERRM)
	# imageの削除
	$(DOCKERIMAGES)| grep $(REPOSITORY_URI) | awk '{print $$3}' | xargs docker rmi -f
run:
	# 最低限の環境設定のみ、あくまで起動確認レベル
	$(DOCKERRUN) -e MYSQL_ROOT_PASSWORD=$(MYSQLPASSWORD) -d -p 33333:3306 $(REPOSITORY_URI):latest
push:
	$(DOCKERPUSH) $(REPOSITORY_URI):latest
pull:
	$(DOCKERPULL) $(REPOSITORY_URI):latest
mysql:
	$(DOCKEREXEC) -it $(CONTAINERNAME) /bin/bash
login:
	mysql -h localhost --port 33333 --protocol tcp -u root -pPassw0rd
