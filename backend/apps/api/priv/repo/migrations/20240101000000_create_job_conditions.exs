defmodule Dashboard.Repo.Migrations.CreateJobConditions do
  use Ecto.Migration

  def change do
    create table(:job_conditions, primary_key: false) do
      add :id, :uuid, primary_key: true
      add :keyword, :string, null: false
      timestamps()
    end

    create unique_index(:job_conditions, [:keyword])
  end
end
