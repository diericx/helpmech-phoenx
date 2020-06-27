defmodule Helpmech.Forums.Thread do
  use Ecto.Schema
  import Ecto.Changeset

  schema "threads" do
    field :content, :string
    field :title, :string
    field :views, :integer

    timestamps()
  end

  @doc false
  def changeset(thread, attrs) do
    thread
    |> cast(attrs, [:title, :content, :views])
    |> validate_required([:title, :content, :views])
  end
end
