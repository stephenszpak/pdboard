defmodule Dashboard.Repo.Migrations.AddObanTables do
  use Ecto.Migration

  def up do
    Oban.Migrations.up(version: 11)
  end

  def down do
    Oban.Migrations.down(version: 0)
  end
end
