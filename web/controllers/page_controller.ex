defmodule Autocomplete.PageController do
  use Autocomplete.Web, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
end
