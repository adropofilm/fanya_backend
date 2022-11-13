import Config

# Configure your database
#
# The MIX_TEST_PARTITION environment variable can be used
# to provide built-in test partitioning in CI environment.
# Run `mix help test` for more information.
config :todo_backend, TodoBackend.Repo,
  username: "postgres",
  password: "postgres",
  hostname: "localhost",
  database: "todo_backend_test#{System.get_env("MIX_TEST_PARTITION")}",
  pool: Ecto.Adapters.SQL.Sandbox,
  pool_size: 2

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :todo_backend, TodoBackendWeb.Endpoint,
  http: [ip: {127, 0, 0, 1}, port: 4002],
  secret_key_base: "9Jbkq8kFHhCrLqt63jZZpMszUhWgYF42El31wGdns1WqX6mMeuil0ZHM6xqzRyJR",
  server: false

# In test we don't send emails.
config :todo_backend, TodoBackend.Mailer, adapter: Swoosh.Adapters.Test

# Print only warnings and errors during test
config :logger, level: :warn

# Initialize plugs at runtime for faster test compilation
config :phoenix, :plug_init_mode, :runtime
