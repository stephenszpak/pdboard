defmodule Dashboard.Jobs.JobPosting do
  use Ecto.Schema
  import Ecto.Changeset
  @primary_key {:id, :binary_id, autogenerate: true}

  schema "job_postings" do
    field :title, :string
    field :company, :string
    field :url, :string
    belongs_to :condition, Dashboard.Jobs.JobCondition, type: :binary_id
    timestamps()
  end

  def changeset(struct, params) do
    struct
    |> cast(params, [:title, :company, :url, :condition_id])
    |> validate_required([:title, :url, :condition_id])
  end
end
