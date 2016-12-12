defmodule AdventOfCode.Day10Test do
  use ExUnit.Case
  alias AdventOfCode.{Day10, Helper}

  test "run the input" do
    10
    |> Helper.load_input
    |> Day10.solve
  end
end
