# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :helpmech,
  ecto_repos: [Helpmech.Repo]

# Configures the endpoint
config :helpmech, HelpmechWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "XW/waC1RAIb9h3IV2BC7agRuGgd3Osesq9x6qgmunaBDXBqTPJPecLhjj8ZvAtQk",
  render_errors: [view: HelpmechWeb.ErrorView, accepts: ~w(html json), layout: false],
  pubsub_server: Helpmech.PubSub,
  live_view: [signing_salt: "kGXHjdhY"]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
