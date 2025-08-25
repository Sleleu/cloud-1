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
	rm -rfd /home/ec2-user/data/wordpress
	rm -rfd /home/ec2-user/data/mariadb
	mkdir /home/ec2-user/data/mariadb /home/ec2-user/data/wordpress

re:
	make fclean 
	make all