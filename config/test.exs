import Config

# Configure your database
#
# The MIX_TEST_PARTITION environment variable can be used
# to provide built-in test partitioning in CI environment.
# Run `mix help test` for more information.
config :phoenix_chatter, PhoenixChatter.Repo,
  username: "postgres",
  password: "Hiimduk123",
  hostname: "localhost",
  database: "phoenix_chatter_test#{System.get_env("MIX_TEST_PARTITION")}",
  pool: Ecto.Adapters.SQL.Sandbox,
  pool_size: System.schedulers_online() * 2

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :phoenix_chatter, PhoenixChatterWeb.Endpoint,
  http: [ip: {127, 0, 0, 1}, port: 4002],
  secret_key_base: "IVY2W5XjRvEZBByP44i8DWYFtkLgLgim4+ACeEKftE0cjDXkc1+cFwR3FIjpdsNd",
  server: true

# In test we don't send emails
config :phoenix_chatter, PhoenixChatter.Mailer, adapter: Swoosh.Adapters.Test

# Disable swoosh api client as it is only required for production adapters
config :swoosh, :api_client, false

# Print only warnings and errors during test
config :logger, level: :warning

# Initialize plugs at runtime for faster test compilation
config :phoenix, :plug_init_mode, :runtime

# Enable helpful, but potentially expensive runtime checks
config :phoenix_live_view,
  enable_expensive_runtime_checks: true

config :phoenix_chatter, :sql_sandbox, true

config :wallaby, screenshot_on_failure: true

config :wallaby,
  driver: Wallaby.Selenium

# driver: Wallaby.Selenium,
# selenium: [
#   capabilities: %{
#     browserName: "firefox",
#     "moz:firefoxOptions": %{
#       args: ["-headless"]
#     }
#   },
#   remote_url: "http://192.168.22.1:4444/"
# ]
# driver:
#   Wallaby.config(:wallaby,
#     hackney_options: [timeout: 5_000]
#   )
