COMPOSE_PATH = srcs/docker-compose.yml

all:
	docker compose -f $(COMPOSE_PATH) up -d

down:
	docker compose -f $(COMPOSE_PATH) down

clean:
	docker compose -f $(COMPOSE_PATH) down
	docker system prune -af

fclean:

	make clean
	rm -rfd /home/ubuntu/data/wordpress
	rm -rfd /home/ubuntu/data/mariadb
	mkdir /home/ubuntu/data/mariadb /home/ubuntu/data/wordpress

re:
	make fclean 
	make all