defmodule DoorTest do
  use ExUnit.Case, async: true
  @moduletag timeout: 120000
  @input "cxdnnyjw"

  test "part 1 result" do
    assert "f77a0e6e" == Door.hash(@input)
  end

  test "part 2 result" do
    assert "999828ec" == Door.ordered_hash(@input)
  end
end
