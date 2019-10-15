defmodule DemoSmartTracerWeb.Router do
  use DemoSmartTracerWeb, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug Phoenix.LiveView.Flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
    plug :put_layout, {DemoSmartTracerWeb.LayoutView, :app}
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", DemoSmartTracerWeb do
    pipe_through :browser

    live "/", TracerLive
  end

  # Other scopes may use custom stacks.
  # scope "/api", DemoSmartTracerWeb do
  #   pipe_through :api
  # end
end
