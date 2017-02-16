defmodule Autocomplete.AutoController do
  use Autocomplete.Web, :controller

  def index(conn, _params) do
    render conn, "index.html", words: []
  end

  def get_words(conn, %{"word" => word}) do
    IO.inspect word
    render conn, "index.html", words: ["words"]
  end
end

