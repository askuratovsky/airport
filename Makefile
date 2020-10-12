run: build prepare_db up

migrate: build migrate!

rollback: build rollback!

prepare_db: create_db setup_db

setup_db:
	docker-compose run --rm web rails db:setup

create_db:
	docker-compose run --rm web rails db:create

build:
	docker-compose build

seed:
	docker-compose run web rails db:seed

up:
	docker-compose up

down:
	docker-compose down

console:
	docker-compose exec web rails console

db_log:
	docker-compose logs --follow db

migrate!:
	docker-compose run --rm web rails db:migrate

rollback!:
	docker-compose run --rm web rails db:rollback

redo: rollback! migrate!
