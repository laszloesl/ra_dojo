defmodule Dojo.SimpleCluster do
  @cluster_name :dojo_simple
  @ra_system :default

  def start(nodes) do
    machine = {:simple, &Kernel.+/2, 0}

    server_ids = Enum.map(nodes, &{@cluster_name, &1})
    :ra.start_cluster(@ra_system, @cluster_name, machine, server_ids)
  end

  def command(command) do
    :ra.process_command(@cluster_name, command)
  end
end
