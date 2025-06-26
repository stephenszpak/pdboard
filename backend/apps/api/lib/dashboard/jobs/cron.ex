defmodule Dashboard.Jobs.Cron do
  use Oban.Worker, queue: :default
  alias Dashboard.Jobs

  @impl Oban.Worker
  def perform(_job) do
    for %{keyword: kw} <- Jobs.list_conditions() do
      Jobs.fetch_and_insert(kw)
    end
    :ok
  end
end
