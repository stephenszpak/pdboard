defmodule DashboardWeb.Endpoint do
  use Phoenix.Endpoint, otp_app: :api

  socket "/socket", Absinthe.Phoenix.Socket, websocket: [subprotocols: ["graphql-ws"]]

  plug Plug.Static,
    at: "/",
    from: :api,
    gzip: false,
    only: ~w()

  plug Plug.RequestId
  plug Plug.Telemetry, event_prefix: [:phoenix, :endpoint]
  plug Plug.Parsers,
    parsers: [:urlencoded, :multipart, :json],
    pass: ["*/*"],
    json_decoder: Phoenix.json_library()
  plug Plug.MethodOverride
  plug Plug.Head

  plug DashboardWeb.Router
end
