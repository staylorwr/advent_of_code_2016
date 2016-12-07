defmodule AdventOfCode.Day1Test do
  use ExUnit.Case
  alias AdventOfCode.Day1
  doctest Day1
  test "example 1", do: assert 5 = Day1.net_distance("R2, L3")
  test "example 2", do: assert 2 = Day1.net_distance("R2, R2, R2")
  test "example 3", do: assert 12 = Day1.net_distance("R5, L5, R5, R3")

  def question_input do
    "L3, R1, L4, L1, L2, R4, L3, L3, R2, R3, L5, R1, R3, L4, L1, L2, R2, R1, L4, L4, R2, L5, R3, R2, R1, L1, L2, R2, R2, L1, L1, R2, R1, L3, L5, R4, L3, R3, R3, L5, L190, L4, R4, R51, L4, R5, R5, R2, L1, L3, R1, R4, L3, R1, R3, L5, L4, R2, R5, R2, L1, L5, L1, L1, R78, L3, R2, L3, R5, L2, R2, R4, L1, L4, R1, R185, R3, L4, L1, L1, L3, R4, L4, L1, R5, L5, L1, R5, L1, R2, L5, L2, R4, R3, L2, R3, R1, L3, L5, L4, R3, L2, L4, L5, L4, R1, L1, R5, L2, R4, R2, R3, L1, L1, L4, L3, R4, L3, L5, R2, L5, L1, L1, R2, R3, L5, L3, L2, L1, L4, R4, R4, L2, R3, R1, L2, R1, L2, L2, R3, R3, L1, R4, L5, L3, R4, R4, R1, L2, L5, L3, R1, R4, L2, R5, R4, R2, L5, L3, R4, R1, L1, R5, L3, R1, R5, L2, R1, L5, L2, R2, L2, L3, R3, R3, R1"
  end

  test "question 1" do
    assert 252 = question_input |> Day1.net_distance
  end

  test "example for part 2", do: assert 4 = Day1.distance_of_first_overlap("R8, R4, R4, R8")

  test "question 2" do
    assert 143 = question_input |> Day1.distance_of_first_overlap
  end
end
