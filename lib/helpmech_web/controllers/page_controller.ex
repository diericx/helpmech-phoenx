defmodule HelpmechWeb.PageController do
  use HelpmechWeb, :controller
  import HelpmechWeb.UserAuth, only: [require_authenticated_user: 2]

  def index(conn, _params) do
    render(conn, "index.html")
  end

  def private(conn, _params) do
    conn
    |> require_authenticated_user(conn)
    render(conn, "private.html")
  end
end
