defmodule DojoTest do
  use ExUnit.Case
  doctest Dojo

  test "greets the world" do
    assert Dojo.hello() == :world
  end
end
