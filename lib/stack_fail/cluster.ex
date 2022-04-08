defmodule Dojo.StackFail.Cluster do
  @cluster_name :dojo_stack_fail
  @ra_system :default
  @seed_node :"node1@Laszlos-MacBook-Pro"

  def start() do
    machine = {:module, Dojo.StackFail.Machine, %{}}
    server_conf = server_conf(node(), machine)
    server_id = {@cluster_name, server_conf.uid}

    if Enum.member?(:ra_directory.list_registered(@ra_system), server_id) do
      :ra.start_server(@ra_system, server_conf)
    else
      start_or_join_cluster(server_conf)
    end
  end

  defp start_or_join_cluster(server_conf) do
    if node() == @seed_node do
      :ra.start_cluster(@ra_system, [server_conf])
    else
      :ra.start_server(server_conf)
      :ra.add_member({@cluster_name, @seed_node}, {@cluster_name, node()})
    end
  end

  defp server_conf(node, machine) do
    uid = Base.encode64("#{node}_#{@cluster_name}")

    %{
      id: {@cluster_name, node},
      uid: uid,
      cluster_name: @cluster_name,
      log_init_args: %{uid: uid},
      initial_members: [{@cluster_name, node}],
      machine: machine
    }
  end

  def command(command) do
    :ra.process_command(@cluster_name, command)
  end
end
