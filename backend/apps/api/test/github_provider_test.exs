defmodule Dashboard.Jobs.GitHubProviderTest do
  use ExUnit.Case

  test "fetch returns at least one posting" do
    results = Dashboard.Jobs.Providers.GitHub.fetch("elixir")
    assert length(results) > 0
  end
end
