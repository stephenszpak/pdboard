defmodule DashboardWeb.Schema do
  use Absinthe.Schema
  import_types Absinthe.Type.Custom
  alias Dashboard.Jobs

  object :job_posting do
    field :id, non_null(:id)
    field :title, :string
    field :company, :string
    field :url, :string
    field :condition_id, :id
    field :inserted_at, :naive_datetime
  end

  query do
    field :job_postings, list_of(:job_posting) do
      arg :condition_id, non_null(:id)
      resolve fn %{condition_id: id}, _ ->
        {:ok, Jobs.list_postings(id)}
      end
    end
  end

  subscription do
    field :job_posting_added, :job_posting do
      arg :condition_id, non_null(:id)
      config fn args, _ ->
        {:ok, topic: args.condition_id}
      end
    end
  end
end
