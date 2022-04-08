defmodule Dojo.StackFail do
  def put(value), do: Dojo.StackFail.Cluster.command({:put, value})
  def pop(), do: Dojo.StackFail.Cluster.command(:pop)
end
