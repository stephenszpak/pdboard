defmodule DashboardWeb.Router do
  use DashboardWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/api" do
    pipe_through :api
    forward "/graphql", Absinthe.Plug, schema: DashboardWeb.Schema
    if Mix.env() == :dev do
      forward "/graphiql", Absinthe.Plug.GraphiQL, schema: DashboardWeb.Schema
    end
  end
end
