import Config

config :api, Dashboard.Repo,
  database: "personal_dashboard_dev",
  username: "postgres",
  password: "postgres",
  hostname: "localhost",
  show_sensitive_data_on_connection_error: true,
  pool_size: 10

config :api, DashboardWeb.Endpoint,
  http: [port: 4000],
  code_reloader: true,
  debug_errors: true
