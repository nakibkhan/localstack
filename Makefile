# Define the Docker Compose file
COMPOSE_FILE=docker-compose.yml

# Default target: Starts the Docker Compose services
.PHONY: up
up:
	docker-compose -f $(COMPOSE_FILE) up -d

# Stops the Docker Compose services
.PHONY: down
down:
	docker-compose -f $(COMPOSE_FILE) down

# Restarts the Docker Compose services
.PHONY: restart
restart: down up

# Displays the logs of the Docker Compose services
.PHONY: logs
logs:
	docker-compose -f $(COMPOSE_FILE) logs -f

# Builds the Docker Compose services (useful if Dockerfiles are involved)
.PHONY: build
build:
	docker-compose -f $(COMPOSE_FILE) build

# Stops all containers, removes containers, networks, volumes, and images created by up
.PHONY: clean
clean:
	docker-compose -f $(COMPOSE_FILE) down --rmi all --volumes --remove-orphans

# Shows the status of Docker Compose services
.PHONY: ps
ps:
	docker-compose -f $(COMPOSE_FILE) ps
