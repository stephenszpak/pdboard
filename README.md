# pdboard

This repository contains a simple Elixir/Phoenix API and a separate frontend.

## Setup

From the project root run:

```bash
mix deps.get
mix ecto.setup
```

The `ecto.setup` task will create the database and run all migrations,
including the one that creates Oban's tables.

To start the API server run:

```bash
cd backend && mix phx.server
```

## Testing

Execute tests from the `backend` directory:

```bash
mix test
```
