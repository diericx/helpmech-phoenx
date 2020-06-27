defmodule Helpmech.ForumsTest do
  use Helpmech.DataCase

  alias Helpmech.Forums

  describe "threads" do
    alias Helpmech.Forums.Thread

    @valid_attrs %{content: "some content", title: "some title", views: 42}
    @update_attrs %{content: "some updated content", title: "some updated title", views: 43}
    @invalid_attrs %{content: nil, title: nil, views: nil}

    def thread_fixture(attrs \\ %{}) do
      {:ok, thread} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Forums.create_thread()

      thread
    end

    test "list_threads/0 returns all threads" do
      thread = thread_fixture()
      assert Forums.list_threads() == [thread]
    end

    test "get_thread!/1 returns the thread with given id" do
      thread = thread_fixture()
      assert Forums.get_thread!(thread.id) == thread
    end

    test "create_thread/1 with valid data creates a thread" do
      assert {:ok, %Thread{} = thread} = Forums.create_thread(@valid_attrs)
      assert thread.content == "some content"
      assert thread.title == "some title"
      assert thread.views == 42
    end

    test "create_thread/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Forums.create_thread(@invalid_attrs)
    end

    test "update_thread/2 with valid data updates the thread" do
      thread = thread_fixture()
      assert {:ok, %Thread{} = thread} = Forums.update_thread(thread, @update_attrs)
      assert thread.content == "some updated content"
      assert thread.title == "some updated title"
      assert thread.views == 43
    end

    test "update_thread/2 with invalid data returns error changeset" do
      thread = thread_fixture()
      assert {:error, %Ecto.Changeset{}} = Forums.update_thread(thread, @invalid_attrs)
      assert thread == Forums.get_thread!(thread.id)
    end

    test "delete_thread/1 deletes the thread" do
      thread = thread_fixture()
      assert {:ok, %Thread{}} = Forums.delete_thread(thread)
      assert_raise Ecto.NoResultsError, fn -> Forums.get_thread!(thread.id) end
    end

    test "change_thread/1 returns a thread changeset" do
      thread = thread_fixture()
      assert %Ecto.Changeset{} = Forums.change_thread(thread)
    end
  end
end
