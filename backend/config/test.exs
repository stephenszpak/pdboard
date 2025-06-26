import Config

config :api, Dashboard.Repo,
  database: "personal_dashboard_test",
  username: "postgres",
  password: "postgres",
  hostname: "localhost",
  pool: Ecto.Adapters.SQL.Sandbox,
  pool_size: 10

config :api, DashboardWeb.Endpoint, server: false

config :logger, level: :warning
