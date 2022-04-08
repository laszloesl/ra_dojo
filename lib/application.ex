defmodule Dojo.Application do
  def start(:normal, _) do
    :ra.start()
    Supervisor.start_link([], strategy: :one_for_one, name: Dojo.Supervisor)
  end
end
