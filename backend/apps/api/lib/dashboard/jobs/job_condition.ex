defmodule Dashboard.Jobs.JobCondition do
  use Ecto.Schema
  import Ecto.Changeset
  @primary_key {:id, :binary_id, autogenerate: true}

  schema "job_conditions" do
    field :keyword, :string
    timestamps()
  end

  def changeset(struct, params) do
    struct
    |> cast(params, [:keyword])
    |> validate_required([:keyword])
  end
end
