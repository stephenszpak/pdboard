defmodule Dashboard.Repo.Migrations.CreateJobPostings do
  use Ecto.Migration

  def change do
    create table(:job_postings, primary_key: false) do
      add :id, :uuid, primary_key: true
      add :title, :string, null: false
      add :company, :string
      add :url, :string, null: false
      add :condition_id, references(:job_conditions, type: :uuid, on_delete: :delete_all), null: false
      timestamps()
    end

    create index(:job_postings, [:condition_id])
  end
end
