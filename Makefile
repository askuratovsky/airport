run: rebuild_images prepare_db up

migrate: rebuild_images migrate!

rollback: rebuild_images rollback!

prepare_db:
	docker-compose run --rm web rails db:setup

rebuild_images:
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
