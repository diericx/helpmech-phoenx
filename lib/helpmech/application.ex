defmodule Helpmech.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  def start(_type, _args) do
    children = [
      # Start the Ecto repository
      Helpmech.Repo,
      # Start the Telemetry supervisor
      HelpmechWeb.Telemetry,
      # Start the PubSub system
      {Phoenix.PubSub, name: Helpmech.PubSub},
      # Start the Endpoint (http/https)
      HelpmechWeb.Endpoint
      # Start a worker by calling: Helpmech.Worker.start_link(arg)
      # {Helpmech.Worker, arg}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: Helpmech.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  def config_change(changed, _new, removed) do
    HelpmechWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
