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
conf-deploy: nginx-conf-deploy mysql-conf-deploy

.PHONY: nginx-conf-deploy
nginx-conf-deploy:
	echo "nginx conf deploy"
	sudo cp -r s1/etc/nginx/* /etc/nginx
	sudo nginx -t
	sudo systemctl restart nginx

.PHONY: mysql-conf-deploy
mysql-conf-deploy:
	echo "mysql conf deploy"
	sudo cp -r s1/etc/mysql/* /etc/mysql
	mysqld --verbose --help > /dev/null
	sudo systemctl restart mysql

