defmodule AdventOfCode.Day12Test do
  use ExUnit.Case, async: true
  alias AdventOfCode.{Day12, Helper}

  @example """
  cpy 41 a
  inc a
  inc a
  dec a
  jnz a 2
  dec a
  """

  test "example part 1" do
    result = @example |> Day12.process
    assert result[:a] == 42
  end

  test "part 1" do
    result = 12
    |> Helper.load_input
    |> Day12.process

    assert result[:a] == 318077
  end

  @tag :skip
  test "part 2" do
    result = 12
    |> Helper.load_input
    |> Day12.process([a: 0, b: 0, c: 1, d: 0])
    assert result[:a] == 1
  end
end
