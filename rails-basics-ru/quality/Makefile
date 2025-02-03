setup:
	bin/setup
	yarn install

start:
	bin/dev
	bin/rails db:migrate

console:
	bin/rails console

test:
	yarn run build
	yarn run build:css
	bin/rails db:migrate
	NODE_ENV=test bin/rails test


.PHONY: test
