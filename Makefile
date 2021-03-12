#!make

npm-install: ## executa npm install
	docker-compose run --rm nuxt-ol npm install

npm-build:
	docker-compose run --rm nuxt-ol npm run build

nuxt-shell: ## acessar shell
	docker exec -it nuxt.ol /bin/bash