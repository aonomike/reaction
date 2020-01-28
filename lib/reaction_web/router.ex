defmodule ReactionWeb.Router do
  use ReactionWeb, :router

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

  scope "/", ReactionWeb do
    pipe_through :api
    resources "/reaction", ReplyController, only: [:create]
    get "/content_count/:content_id", ReplyController, :content_count
  end

  # Other scopes may use custom stacks.
  # scope "/api", ReactionWeb do
  #   pipe_through :api
  # end
end
