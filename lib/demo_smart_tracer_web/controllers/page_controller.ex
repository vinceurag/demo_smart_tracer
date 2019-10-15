defmodule DemoSmartTracerWeb.PageController do
  use DemoSmartTracerWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
