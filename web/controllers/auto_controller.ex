defmodule Autocomplete.AutoController do
  use Autocomplete.Web, :controller

  def index(conn, _params) do
    render conn, "index.html", words: []
  end

  defp matching_words(words, word) do
    number = 10
    length = String.length(word)

    String.split(words, "\n")
    |> Enum.map(&(String.downcase(&1)))
    |> Enum.split_while(fn(x) -> String.slice(x, 0, length) != word end)
    |> elem(1)
    |> Enum.slice(0, number)
    |> Enum.split_while(fn(x) -> String.slice(x, 0, length) == word end)
    |> elem(0)
  end

  def get_words(conn, %{"word" => %{"search" => word}}) do
    {:ok, words} = File.read("text.txt")
    render conn, "index.html", words: matching_words(words, word)
  end
end

