defmodule DailyNews.NewsItemsController do
  use DailyNews.Web, :controller
  import DailyNews.FetchWorker
  alias DailyNews.Repo
  alias DailyNews.NewsItem
  alias DailyNews.Source
  alias DailyNews.FetchWorker


  def index(conn, _params) do
    # threads = Reddhl.pull("elixir")
    # fetchReddit(threads, Enum.count(threads))
    # Repo.all(NewsItem)
    # |> Enum.map(&(Repo.delete!(&1)))

    # Source.fetch(Repo.all(Source))
    FetchWorker.fetch
    items = Repo.all(NewsItem)
    #items = []

    #todo add items from reddit api
      # returns the top 25 "threads"
    # Reddhl.url(threads, 1) # get the 1st post's url "https://medium.com/@mschae/measuring-your-phoenix-app-d63a77b13bda"
    # Reddhl.title(threads, 1)
    # items
    render conn, "index.json", %{data: items}
  end

  def fetchReddit(threads, index) when index <= 1 do
    changeset = NewsItem.changeset(%NewsItem{}, %{url: Reddhl.url(threads,index - 1)})
    Repo.insert(changeset)
  end

  def fetchReddit(threads, index) do
    changeset = NewsItem.changeset(%NewsItem{}, %{url: Reddhl.url(threads,index - 1)})
    Repo.insert(changeset)
    fetchReddit(threads, index-1)
    #items = %{id: index-1, url: Reddhl.url(threads,index-1)}

    #fetchReddit(threads, items, index - 1)
  end
end