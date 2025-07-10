name = php-workbench
version = 0.0.1

build: image

image:
	@echo "Build dev image"
	docker build . -f ./build/php/Dockerfile --target dev -t ${name}-dev:${version}

up:
	@echo "Boot stack"
	docker compose up -d --remove-orphans

down:
	@echo "Shutting down"
	docker compose down

reset: restart clear

restart: down up

shell:
	@echo "Open shell on workbench container"
	docker compose exec -it workbench bash
