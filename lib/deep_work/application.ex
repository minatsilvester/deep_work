defmodule DeepWork.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      DeepWorkWeb.Telemetry,
      DeepWork.Repo,
      {DNSCluster, query: Application.get_env(:deep_work, :dns_cluster_query) || :ignore},
      {Phoenix.PubSub, name: DeepWork.PubSub},
      # Start the Finch HTTP client for sending emails
      {Finch, name: DeepWork.Finch},
      # Start a worker by calling: DeepWork.Worker.start_link(arg)
      # {DeepWork.Worker, arg},
      # Start to serve requests, typically the last entry
      DeepWorkWeb.Endpoint
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: DeepWork.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    DeepWorkWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
