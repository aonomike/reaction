defmodule Reaction.Cache.Test do
  use ExUnit.Case
  alias Reaction.Cache

  test "It should not hit when empty" do
    {:ok, _} = Cache.start_link()
    assert false == Cache.check("content-1")
  end

  test "It should hit after loading a value" do
    Cache.start_link()
    Cache.add("user-1", "content-1")
    assert true == Cache.check("content-1")
  end
end
