defmodule DailyNews.NewsItemsView do
  use JSONAPI.PhoenixView

  def type, do: "news_items"
  def fields, do: [:id, :url]
  def links(model) do
    Map.add(model,[:id])
  end

  #def render("index.json", %{items: items}) do
   # items
  #end

  def attributes(model) do
    Map.take(model, [:id, :url])
  end

  def relationships, do: []
end