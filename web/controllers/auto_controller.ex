defmodule Autocomplete.AutoController do
  use Autocomplete.Web, :controller

  def index(conn, _params) do
    render conn, "index.html", words: []
  end

  def matching_words(word) do
    {:ok, words} = File.read("text.txt")
    IO.inspect word
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
    render conn, "index.html", words: matching_words(word)
  end

  def test_word(conn, %{"word" => test_word}) do
    render conn, "test.html", words: test_word
  end

end

