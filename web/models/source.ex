defmodule DailyNews.Source do
  use DailyNews.Web, :model
  use Ecto.Model
  alias DailyNews.NewsItem
  alias DailyNews.Repo

  schema "sources" do
    field :name, :string

    timestamps
  end

  @required_fields ~w(name)
  @optional_fields ~w()

  @doc """
  Creates a changeset based on the `model` and `params`.

  If no params are provided, an invalid changeset is returned
  with no validation performed.
  """
  def changeset(model, params \\ :empty) do
    model
    |> cast(params, @required_fields, @optional_fields)
  end

  #fetches items from all the sources string
  def fetch(sources) do
    sources
    |> Enum.map(&(Reddhl.pull(&1.name)))
    |> Enum.map(&(fetchReddit((&1), Enum.count(sources))))
  end

  def fetchReddit(threads, index) when index <= 1 do
    changeset = NewsItem.changeset(%NewsItem{}, %{url: Reddhl.url(threads,index - 1)})
    Repo.insert(changeset)
  end

  def fetchReddit(threads, index) do
    changeset = NewsItem.changeset(%NewsItem{}, %{url: Reddhl.url(threads,index - 1)})
    Repo.insert(changeset)
    fetchReddit(threads, index-1)
  end
end
