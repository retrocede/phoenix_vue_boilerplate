defmodule PhoenixVueBoilerplate.Router do
  use PhoenixVueBoilerplate.Web, :router

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

  # Other scopes may use custom stacks.
  scope "/api", PhoenixVueBoilerplate do
    pipe_through :api

    resources "/test", TestEndpointController
  end

  scope "/", PhoenixVueBoilerplate do
    pipe_through :browser # Use the default browser stack

    get "/*path", PageController, :index
  end

end
