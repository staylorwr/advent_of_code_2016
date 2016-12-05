defmodule DoorTest do
  use ExUnit.Case, async: true
  @moduletag timeout: 120000
  @input "cxdnnyjw"

  test "part 1 example" do
    assert "18f47a30" == Door.hash("abc")
  end

  test "part 1 result" do
    assert "f77a0e6e" == Door.hash(@input)
  end

  test "part 2 example" do
    assert "05ace8e3" == Door.ordered_hash("abc")
  end

  test "part 2 result" do
    assert "999828ec" == Door.ordered_hash(@input)
  end
end
