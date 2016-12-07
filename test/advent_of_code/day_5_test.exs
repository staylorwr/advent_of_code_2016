defmodule AdventOfCode.Day5Test do
  use ExUnit.Case, async: true
  @moduletag timeout: 120000

  alias AdventOfCode.Day5
  @input "cxdnnyjw"

  @tag :skip
  test "part 1 result" do
    assert "f77a0e6e" == @input |> Day5.hash
  end

  @tag :skip
  test "part 2 result" do
    assert "999828ec" == @input |> Day5.ordered_hash
  end
end
