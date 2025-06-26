defmodule Dashboard.Jobs.Providers.GitHub do
  @behaviour Dashboard.Jobs.Provider
  require Logger

  @endpoint Application.compile_env(:api, :github_jobs_endpoint, "https://ghjobs.io/api/v1/jobs")

  def fetch(keyword) do
    url = "#{@endpoint}?search=#{URI.encode(keyword)}"
    case Finch.build(:get, url) |> Finch.request(Dashboard.Finch) do
      {:ok, %Finch.Response{status: 200, body: body}} ->
        Jason.decode!(body)
      {:ok, %Finch.Response{status: status}} ->
        Logger.error("GitHub provider status: #{status}")
        []
      {:error, reason} ->
        Logger.error("GitHub provider error: #{inspect(reason)}")
        []
    end
  end
end
