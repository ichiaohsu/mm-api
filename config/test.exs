use Mix.Config

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :mm_api, MmApi.Endpoint,
  http: [port: 4001],
  server: false

# Print only warnings and errors during test
config :logger, level: :warn

config :poll_api, PollApi.Repo,
  adapter: Ecto.Adapters.MySQL,
  username: "mmich",
  password: "m0281",
  database: "poll_test",
  hostname: "localhost",
  pool_size: 2