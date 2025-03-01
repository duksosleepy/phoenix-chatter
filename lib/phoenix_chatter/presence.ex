defmodule PhoenixChatterWeb.Presence do
  use Phoenix.Presence,
    otp_app: :phoenix_chatter,
    pubsub_server: PhoenixChatter.PubSub
end
