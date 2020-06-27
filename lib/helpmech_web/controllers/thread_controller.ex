defmodule HelpmechWeb.ThreadController do
  use HelpmechWeb, :controller

  alias Helpmech.Forums
  alias Helpmech.Forums.Thread

  def index(conn, _params) do
    threads = Forums.list_threads()
    render(conn, "index.html", threads: threads)
  end

  def new(conn, _params) do
    changeset = Forums.change_thread(%Thread{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"thread" => thread_params}) do
    # Default values for hidden fields
    thread_params = Map.put(thread_params, "views", 0)

    case Forums.create_thread(thread_params) do
      {:ok, thread} ->
        conn
        |> put_flash(:info, "Thread created successfully.")
        |> redirect(to: Routes.thread_path(conn, :show, thread))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    thread = Forums.get_thread!(id)
    render(conn, "show.html", thread: thread)
  end

  def edit(conn, %{"id" => id}) do
    thread = Forums.get_thread!(id)
    changeset = Forums.change_thread(thread)
    render(conn, "edit.html", thread: thread, changeset: changeset)
  end

  def update(conn, %{"id" => id, "thread" => thread_params}) do
    thread = Forums.get_thread!(id)

    case Forums.update_thread(thread, thread_params) do
      {:ok, thread} ->
        conn
        |> put_flash(:info, "Thread updated successfully.")
        |> redirect(to: Routes.thread_path(conn, :show, thread))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "edit.html", thread: thread, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    thread = Forums.get_thread!(id)
    {:ok, _thread} = Forums.delete_thread(thread)

    conn
    |> put_flash(:info, "Thread deleted successfully.")
    |> redirect(to: Routes.thread_path(conn, :index))
  end
end
