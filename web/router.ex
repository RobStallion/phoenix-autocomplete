defmodule Autocomplete.Router do
  use Autocomplete.Web, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", Autocomplete do
    pipe_through :browser # Use the default browser stack

    get "/", AutoController, :index
    post "/input", AutoController, :get_words

  end

  #  scope "/api", Autocomplete do
  #    pipe_through :api
  #
  #    get "/input", AutoController, :find_words
  #  end

end
