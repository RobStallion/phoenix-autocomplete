defmodule Autocomplete.AutoView do
  use Autocomplete.Web, :view

  import Autocomplete.AutoController

  def get_words(word) do
    matching_words(word)
  end

end
