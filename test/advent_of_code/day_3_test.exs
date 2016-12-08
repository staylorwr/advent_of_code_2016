defmodule AdventOfCode.Day3Test do
  use ExUnit.Case
  alias AdventOfCode.{Helper, Day3}

  describe "is_triangle?/1" do
    test "5 10 25", do: refute Day3.is_triangle?([5, 10, 25])
    test "3 4 5", do: assert Day3.is_triangle?([3,4,5])
  end

  test "part 1", do: assert input |> Day3.count_triangles(:horizontal) == 1032

  def input, do: Helper.load_input(3)

  test "part 2 example" do
    assert example |> Day3.count_triangles(:vertical) == 6
  end

  test "part 2", do: assert input |> Day3.count_triangles(:vertical) == 1838

  def example do
    """
    101 301 501
    102 302 502
    103 303 503
    201 401 601
    202 402 602
    203 403 603
    """
  end
end
