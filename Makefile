all: build
	docker run -it control-node

build:
	docker build --tag "control-node" .

clean:
	docker system prune --all --force

fclean: clean

start:
	docker run -it control-node bash

restart: re start

re: fclean build

.PHONY: all build clean fclean re