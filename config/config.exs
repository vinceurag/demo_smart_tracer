# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

# Configures the endpoint
config :demo_smart_tracer, DemoSmartTracerWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "sTzfQfhKzayJ1H3SXXjPYjH0bbf8n0DIZtIycMnG/h+RHyqEAA/Q8UXO58VqWdou",
  render_errors: [view: DemoSmartTracerWeb.ErrorView, accepts: ~w(html json)],
  pubsub: [name: DemoSmartTracer.PubSub, adapter: Phoenix.PubSub.PG2],
  live_view: [
    signing_salt: "5tT733P0K7u9TXPXJL7XcRUP0M2twhNL"
  ]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

config :phoenix, :template_engines, leex: Phoenix.LiveView.Engine

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
