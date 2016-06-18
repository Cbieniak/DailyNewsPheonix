defmodule DailyNews.PageController do
  use DailyNews.Web, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
end
