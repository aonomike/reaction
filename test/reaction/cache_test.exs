defmodule Reaction.Cache.Test do
  use ExUnit.Case
  alias Reaction.Cache

  test "It should not hit when empty" do
    {:ok, _} = Cache.start_link()
    assert :noreply == Cache.check("content-1")
  end

  test "It should hit after loading a value" do
    Cache.start_link()
    Cache.add("user-1", "content-1")
    returned_value = MapSet.new()
    MapSet.put(returned_value,"user-1" )
    assert [{"content-1", returned_value }] == Cache.check("content-1")
  end

  test "It should not add more than one key" do
    Cache.start_link()
    Cache.add("user-1", "content-1")
    Cache.add("user-1", "content-1")
    Cache.add("user-2", "content-1")
    returned_value = MapSet.new()
    MapSet.put(returned_value,"user-1" )
    MapSet.put(returned_value,"user-2" )
    assert [{"content-1", returned_value }] == Cache.check("content-1")
  end
end
