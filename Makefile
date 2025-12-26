SHELL := /bin/bash

ENV_FILE=.env

DEVOPS_DIR=flowpal_devops

help:
	@fgrep -h "##" $(MAKEFILE_LIST) | fgrep -v fgrep | sed -e 's/\\$$//' | sed -e 's/##//'

.PHONY: services
services: ## Start infra services only
	docker compose --env-file $(ENV_FILE) \
	  -f $(DEVOPS_DIR)/docker-compose.services.yml \
	  up -d


.PHONY: dev-run
dev-run: services ## Start web in dev mode
	docker compose --env-file $(ENV_FILE) \
	  -f $(DEVOPS_DIR)/docker-compose.services.yml \
	  -f $(DEVOPS_DIR)/docker-compose.yml \
	  -f $(DEVOPS_DIR)/docker-compose.override.dev.yml \
	  up web

.PHONY: dev-recreate
dev-recreate: services ## Recreate web
	docker compose --env-file $(ENV_FILE) \
	  -f $(DEVOPS_DIR)/docker-compose.services.yml \
	  -f $(DEVOPS_DIR)/docker-compose.yml \
	  -f $(DEVOPS_DIR)/docker-compose.override.dev.yml \
	  up -d --force-recreate web

.PHONY: image
image: ## Build the FlowPal image
	docker build -t flowpal:latest .


.PHONY: down
down: ## Stop all containers
	docker compose --env-file $(ENV_FILE) \
	  -f $(DEVOPS_DIR)/docker-compose.services.yml \
	  -f $(DEVOPS_DIR)/docker-compose.yml \
	  -f $(DEVOPS_DIR)/docker-compose.override.dev.yml \
	  down


.PHONY: logs
logs: ## Tail logs of web
	docker compose --env-file $(ENV_FILE) \
	  -f $(DEVOPS_DIR)/docker-compose.services.yml \
	  -f $(DEVOPS_DIR)/docker-compose.yml \
	  -f $(DEVOPS_DIR)/docker-compose.override.dev.yml \
	  logs -f web


.PHONY: shell
shell: ## Enter Django web container
	docker compose --env-file $(ENV_FILE) \
	  -f $(DEVOPS_DIR)/docker-compose.services.yml \
	  -f $(DEVOPS_DIR)/docker-compose.yml \
	  -f $(DEVOPS_DIR)/docker-compose.override.dev.yml \
	  exec web bash

.PHONY: migrate
migrate: shell ## Run Django migrations
	python manage.py migrate
