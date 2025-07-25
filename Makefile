all: build start

build:
	@export $$(cat .env | xargs) && \
	docker build --tag "control-node" --build-arg	HOST_IP=$$CLOUD_HOST_IP	\
									  --build-arg	HOST_USER=$$CLOUD_HOST_USER .

clean:
	-docker stop $(shell docker ps -a -q)
	docker system prune --all --force

fclean: clean

start:
	docker run -d --name control-node -i control-node tail -f /dev/null

restart: re start

exec:
	docker exec -it control-node bash

re: fclean build

.PHONY: all build clean fclean re exec