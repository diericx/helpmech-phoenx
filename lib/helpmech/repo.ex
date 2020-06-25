defmodule Helpmech.Repo do
  use Ecto.Repo,
    otp_app: :helpmech,
    adapter: Ecto.Adapters.Postgres
end
