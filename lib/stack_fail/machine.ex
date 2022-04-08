defmodule Dojo.StackFail.Machine do
  @behaviour :ra_machine

  def init(_conf) do
    []
  end

  #  def apply(_command_meta, {:put, value}, stack) do
  #    if Application.get_env(:dojo, :fail_once) do
  #      Application.delete_env(:dojo, :fail_once)
  #      {stack, :ok}
  #    else
  #      {[value | stack], :ok}
  #    end
  #  end

  def apply(_command_meta, {:put, value}, stack) do
    if Application.get_env(:dojo, :fail_once) do
      Application.delete_env(:dojo, :fail_once)
      :erlang.error(:failed)
    else
      {[value | stack], :ok}
    end
  end

  def apply(_command_meta, :pop, [value | stack]) do
    {stack, {:ok, value}}
  end

  def apply(_command_meta, :pop, []) do
    {[], {:error, :empty}}
  end

  def apply(_command_meta, :peek, [value | stack]) do
    {[value | stack], {:ok, value}}
  end

  def apply(_command_meta, :peek, []) do
    {[], {:error, :empty}}
  end
end
