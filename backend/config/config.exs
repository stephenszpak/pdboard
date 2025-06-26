import Config

config :api,
  ecto_repos: [Dashboard.Repo],
  generators: [binary_id: true]

config :api, DashboardWeb.Endpoint,
  url: [host: "localhost"],
  render_errors: [view: DashboardWeb.ErrorView, accepts: ~w(json)],
  pubsub_server: Dashboard.PubSub,
  live_view: [signing_salt: "secret"]

config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

config :phoenix, :json_library, Jason

import_config "#{config_env()}.exs"
