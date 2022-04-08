defmodule Dojo.Stack.Machine do
  @behaviour :ra_machine

  def init(_conf) do
    []
  end

  def apply(_command_meta, {:put, value}, stack) do
    {[value | stack], :ok}
  end

  def apply(_command_meta, :pop, [value | stack]) do
    {stack, {:ok, value}}
  end

  def apply(_command_meta, :pop, []) do
    {[], {:error, :empty}}
  end
end
