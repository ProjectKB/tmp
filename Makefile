NGINX=nginx
PHP=php
ES=elasticsearch
TIKA=tika

BASH=/bin/bash
CONNECT=docker exec -it

up:
	@docker-compose up

php:
	@$(CONNECT) $(PHP) $(BASH)

nginx:
	@$(CONNECT) $(NGINX) $(BASH)

tika:
	@$(CONNECT) $(TIKA) $(BASH)

es:
	@$(CONNECT) $(ES) $(BASH)

ps:
	@docker ps

psa:
	@docker ps -a

psi:
	@docker image list

stop:
	@docker stop $(PHP) $(NGINX) $(TIKA) $(ES)

clean: stop
	@docker rm $(PHP) $(NGINX) $(TIKA) $(ES)

cleanAll: clean
	@docker image prune -a

re: clean up

reAll: cleanAll up

.PHONY: php nginx elasticsearch