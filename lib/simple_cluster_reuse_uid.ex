defmodule Dojo.SimpleClusterReuseUid do
  @cluster_name :dojo_simple_reuse_uid
  @ra_system :default

  def start(nodes) do
    machine = {:simple, &Kernel.+/2, 0}

    server_ids = Enum.map(nodes, fn node -> {@cluster_name, node} end)
    server_configs = Enum.map(nodes, fn node -> server_conf(node, machine, server_ids) end)
    :ra.start_cluster(@ra_system, server_configs)
  end

  defp server_conf(node, machine, server_ids) do
    uid = Base.encode64("#{node}_#{@cluster_name}")

    %{
      id: {@cluster_name, node},
      uid: uid,
      cluster_name: @cluster_name,
      log_init_args: %{uid: uid},
      initial_members: server_ids,
      machine: machine
    }
  end

  def command(command) do
    :ra.process_command(@cluster_name, command)
  end
end
