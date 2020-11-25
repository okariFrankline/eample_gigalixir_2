defmodule AnotherWeb.PageController do
  use AnotherWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
