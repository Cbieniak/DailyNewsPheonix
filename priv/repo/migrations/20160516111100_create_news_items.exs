defmodule DailyNews.Repo.Migrations.CreateNewsItems do
  use Ecto.Migration

  def change do
    create table(:news_items) do
        add :url, :string

        timestamps
    end
  end
end
