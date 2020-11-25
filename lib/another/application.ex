defmodule Another.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  def start(_type, _args) do
    children = [
      # Start the Telemetry supervisor
      AnotherWeb.Telemetry,
      # Start the PubSub system
      {Phoenix.PubSub, name: Another.PubSub},
      # Start the Endpoint (http/https)
      AnotherWeb.Endpoint
      # Start a worker by calling: Another.Worker.start_link(arg)
      # {Another.Worker, arg}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: Another.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  def config_change(changed, _new, removed) do
    AnotherWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
