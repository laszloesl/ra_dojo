defmodule Dojo.Stack do
  def put(value), do: Dojo.Stack.Cluster.command({:put, value})
  def pop(), do: Dojo.Stack.Cluster.command(:pop)

  def peek(),
    do:
      :ra.leader_query(:dojo_stack, fn
        [value | _rest] -> {:ok, value}
        [] -> {:error, :empty}
      end)
end
