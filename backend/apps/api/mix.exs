defmodule Api.MixProject do
  use Mix.Project

  def project do
    [
      app: :api,
      version: "0.1.0",
      build_path: "../../_build",
      config_path: "../../config/config.exs",
      deps_path: "../../deps",
      lockfile: "../../mix.lock",
      elixir: "~> 1.15",
      start_permanent: Mix.env() == :prod,
      deps: deps()
    ]
  end

  def application do
    [
      mod: {Dashboard.Application, []},
      extra_applications: [:logger, :runtime_tools]
    ]
  end

  defp deps do
    [
      {:phoenix, "~> 1.7.10"},
      {:phoenix_pubsub, "~> 2.1"},
      {:phoenix_ecto, "~> 4.4"},
      {:ecto_sql, "~> 3.10"},
      {:postgrex, ">= 0.0.0"},
      {:absinthe, "~> 1.7"},
      {:absinthe_plug, "~> 1.7"},
      {:oban, "~> 2.17"},
      {:finch, "~> 0.16"},
      {:jason, "~> 1.4"},
      {:plug_cowboy, "~> 2.5"},
      {:mox, "~> 1.0", only: :test},
      {:floki, "~> 0.35", only: :test}
    ]
  end
end
