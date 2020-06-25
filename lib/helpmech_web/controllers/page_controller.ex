defmodule HelpmechWeb.PageController do
  use HelpmechWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
