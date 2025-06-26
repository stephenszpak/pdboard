import Config

database_url = System.get_env("DATABASE_URL") ||
  "ecto://postgres:postgres@localhost/personal_dashboard_dev"

config :api, Dashboard.Repo,
  url: database_url,
  pool_size: String.to_integer(System.get_env("POOL_SIZE") || "10"),
  ssl: false

config :api, DashboardWeb.Endpoint,
  http: [ip: {0,0,0,0}, port: String.to_integer(System.get_env("PORT") || "4000")],
  secret_key_base: System.get_env("SECRET_KEY_BASE") || "secret",
  server: true

config :api, Oban,
  repo: Dashboard.Repo,
  plugins: [{Oban.Plugins.Cron, crontab: [{"@hourly", Dashboard.Jobs.Cron}]}],
  queues: [default: 10]

config :api, :github_jobs_endpoint,
  System.get_env("GITHUB_JOBS_ENDPOINT") || "https://ghjobs.io/api/v1/jobs"
