defmodule PhoenixChatterWeb.Presence do
  use Phoenix.Presence,
    otp_app: :phoenixchatter,
    pubsub_server: PhoenixChatter.PubSub
end
