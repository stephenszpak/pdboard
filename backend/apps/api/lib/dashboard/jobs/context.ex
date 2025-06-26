defmodule Dashboard.Jobs do
  alias Dashboard.{Repo, Jobs}
  import Ecto.Query
  alias Dashboard.Jobs.{JobPosting, JobCondition, Provider}

  def list_conditions do
    Repo.all(JobCondition)
  end

  def list_postings(condition_id) do
    Repo.all(from p in JobPosting, where: p.condition_id == ^condition_id)
  end

  def fetch_and_insert(keyword) do
    provider().fetch(keyword)
    |> Enum.map(fn attrs ->
      %JobPosting{}
      |> JobPosting.changeset(Map.put(attrs, :condition_id, keyword))
      |> Repo.insert(on_conflict: :nothing)
      |> case do
        {:error, _} -> nil
        {:ok, posting} ->
          Absinthe.Subscription.publish(DashboardWeb.Endpoint, posting,
            job_posting_added: posting.condition_id)
          posting
      end
    end)
  end

  defp provider do
    Application.get_env(:api, :provider, Dashboard.Jobs.Providers.GitHub)
  end
end
