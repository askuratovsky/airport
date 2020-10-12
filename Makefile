run: build start_db sleep prepare_db up

migrate: build migrate!

rollback: build rollback!

prepare_db:
	docker-compose run web rails db:setup

start_db:
	docker-compose up -d db

sleep:
	sleep 30

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
