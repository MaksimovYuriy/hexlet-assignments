setup:
	bin/setup
	yarn install

start:
	bin/dev

console:
	bin/rails console

test:
	bundle install
	yarn run build
	yarn run build:css
	NODE_ENV=test bin/rails test test/hexlet-check

.PHONY: test
