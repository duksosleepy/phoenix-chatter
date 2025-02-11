defmodule PhoenixChatter.Repo do
  use Ecto.Repo,
    otp_app: :phoenix_chatter,
    adapter: Ecto.Adapters.Postgres
end
