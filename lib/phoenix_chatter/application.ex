defmodule PhoenixChatter.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      PhoenixChatterWeb.Telemetry,
      PhoenixChatter.Repo,
      {DNSCluster, query: Application.get_env(:phoenix_chatter, :dns_cluster_query) || :ignore},
      {Phoenix.PubSub, name: PhoenixChatter.PubSub},
      # Start the Finch HTTP client for sending emails
      {Finch, name: PhoenixChatter.Finch},
      # Start a worker by calling: PhoenixChatter.Worker.start_link(arg)
      # {PhoenixChatter.Worker, arg},
      # Start to serve requests, typically the last entry
      PhoenixChatterWeb.Endpoint
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: PhoenixChatter.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    PhoenixChatterWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
