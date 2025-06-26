setup:
	cd backend && mix deps.get
	cd frontend && npm install
	cd backend && mix ecto.create && mix ecto.migrate

db.reset:
	cd backend && mix ecto.drop && mix ecto.create && mix ecto.migrate

dev:
	cd backend && mix phx.server

dev-all:
	cd backend && mix phx.server & \
	cd frontend && npm run dev & \
	wait

test:
	cd backend && mix test
	cd frontend && npm test -- --run

fly.deploy:
	fly deploy
