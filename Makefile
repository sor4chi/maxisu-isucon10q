.PHONY: rotate-all
rotate-all: rotate-access-log rotate-slow-log

.PHONY: rotate-access-log
rotate-access-log:
	echo "Rotating access log"
	sudo mv /var/log/nginx/access.ndjson /var/log/nginx/access.ndjson.$(shell date +%Y%m%d)
	sudo systemctl restart nginx

.PHONY: rotate-slow-log
rotate-slow-log:
	echo "Rotating slow log"
	sudo mv /var/log/mysql/mysql-slow.log /var/log/mysql/mysql-slow.log.$(shell date +%Y%m%d)
	sudo systemctl restart mysql

.PHONY: alp
alp:
	alp json --config alp-config.yml

.PHONY: pt
pt:
	sudo pt-query-digest /var/log/mysql/mysql-slow.log

.PHONY: conf-deploy
conf-deploy-s1: nginx-conf-deploy-s1 mysql-conf-deploy-s1

.PHONY: nginx-conf-deploy-s1
nginx-conf-deploy-s1:
	echo "nginx conf deploy"
	sudo cp -r s1/etc/nginx/* /etc/nginx
	sudo nginx -t
	sudo systemctl restart nginx

.PHONY: mysql-conf-deploy-s1
mysql-conf-deploy-s1:
	echo "mysql conf deploy"
	sudo cp -r s1/etc/mysql/* /etc/mysql
	mysqld --verbose --help > /dev/null
	sudo systemctl restart mysql

.PHONY: conf-deploy-s2
conf-deploy-s2: mysql-conf-deploy-s2

.PHONY: mysql-conf-deploy-s2
mysql-conf-deploy-s2:
	echo "mysql conf deploy"
	sudo cp -r s2/etc/mysql/* /etc/mysql
	mysqld --verbose --help > /dev/null
	sudo systemctl restart mysql

.PHONY: conf-deploy-s3
conf-deploy-s3: mysql-conf-deploy-s3

.PHONY: mysql-conf-deploy-s3
mysql-conf-deploy-s3:
	echo "mysql conf deploy"
	sudo cp -r s3/etc/mysql/* /etc/mysql
	mysqld --verbose --help > /dev/null
	sudo systemctl restart mysql

.PHONY: app-deploy
app-deploy:
	cd ./webapp/go && make
	sudo systemctl restart isuumo.go.service
