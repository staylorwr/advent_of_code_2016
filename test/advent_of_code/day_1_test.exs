defmodule AdventOfCode.Day1Test do
  use ExUnit.Case
  alias AdventOfCode.{Day1,Helper}

  test "example 1", do: assert 5 = Day1.net_distance("R2, L3")
  test "example 2", do: assert 2 = Day1.net_distance("R2, R2, R2")
  test "example 3", do: assert 12 = Day1.net_distance("R5, L5, R5, R3")

  test "question 1" do
    assert 252 = question_input |> Day1.net_distance
  end

  test "example for part 2", do: assert 4 = Day1.distance_of_first_overlap("R8, R4, R4, R8")

  test "question 2" do
    assert 143 = question_input |> Day1.distance_of_first_overlap
  end

  def question_input, do: Helper.load_input(1)
end
