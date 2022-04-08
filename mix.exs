defmodule Dojo.MixProject do
  use Mix.Project

  def project do
    [
      app: :dojo,
      version: "0.1.0",
      elixir: "~> 1.12",
      start_permanent: Mix.env() == :prod,
      deps: deps()
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger],
      mod: {Dojo.Application, []}
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:ra, github: "rabbitmq/ra", branch: "main"}
    ]
  end
end
