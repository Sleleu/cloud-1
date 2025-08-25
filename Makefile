IMAGE_NAME = control-node
CONTAINER_NAME = control-node
ENV_FILE = .env

all: build start

build:
	docker build --tag $(IMAGE_NAME) .

clean:
	-docker stop $(shell docker ps -a -q)
	docker system prune --all --force

fclean: clean

start:
	docker run 	-d 							\
				--name $(CONTAINER_NAME)	\
				--env-file $(ENV_FILE)		\
				-i $(IMAGE_NAME)

restart: re start

exec:
	docker exec -it $(CONTAINER_NAME) bash

re: fclean build

.PHONY: all build clean fclean re exec