defmodule DailyNews.Repo.Migrations.CreateSource do
  use Ecto.Migration

  def change do
    create table(:sources) do
      add :name, :string

      timestamps
    end

  end
end
