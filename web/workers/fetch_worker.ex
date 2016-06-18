defmodule DailyNews.FetchWorker do
  use DailyNews.Web, :worker
  alias DailyNews.Repo
  alias DailyNews.NewsItem
  alias DailyNews.Source

  def fetch() do
    Repo.all(NewsItem)
    |> Enum.map(&(Repo.delete!(&1)))

    Source.fetch(Repo.all(Source))
  end
end