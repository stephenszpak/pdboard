import Config

config :dashboard, Dashboard.Repo,
  username: "dashboard",
  password: "abc123",
  database: "dashboard_dev",
  hostname: "localhost",
  port: 5432,
  pool_size: 10

config :api, DashboardWeb.Endpoint,
  http: [port: 4000],
  code_reloader: true,
  debug_errors: true
