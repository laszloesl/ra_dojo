defmodule Dojo do
  @nodes [
    :"node1@Laszlos-MacBook-Pro",
    :"node2@Laszlos-MacBook-Pro",
    :"node3@Laszlos-MacBook-Pro"
  ]
  def first_example() do
    Dojo.SimpleCluster.start(@nodes)
    Dojo.SimpleCluster.command(1)
    Dojo.SimpleCluster.command(2)
    Dojo.SimpleCluster.command(3)
    Dojo.SimpleCluster.command(4)
    Dojo.SimpleCluster.command(5)
    Dojo.SimpleCluster.command(0)
  end

  def second_example() do
    Dojo.SimpleClusterReuseUid.start(@nodes)
    Dojo.SimpleClusterReuseUid.command(1)
    Dojo.SimpleClusterReuseUid.command(2)
    Dojo.SimpleClusterReuseUid.command(3)
    Dojo.SimpleClusterReuseUid.command(4)
    Dojo.SimpleClusterReuseUid.command(5)
    Dojo.SimpleClusterReuseUid.command(0)
  end

  def third_example(), do: Dojo.SimpleClusterDynamic.start()
end
