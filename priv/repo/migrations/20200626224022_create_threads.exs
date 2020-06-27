defmodule Helpmech.Repo.Migrations.CreateThreads do
  use Ecto.Migration

  def change do
    create table(:threads) do
      add :title, :string
      add :content, :string
      add :views, :integer

      timestamps()
    end

  end
end
