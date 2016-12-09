defmodule AdventOfCode.Day9Test do
  use ExUnit.Case
  alias AdventOfCode.{Helper, Day9}
  doctest Day9


  describe "part 1 examples" do
    @input [
      {"ADVENT", "ADVENT"},
      {"A(1x5)BC", "ABBBBBC"},
      {"(3x3)XYZ", "XYZXYZXYZ"},
      {"A(2x2)BCD(2x2)EFG", "ABCBCDEFEFG"},
      {"(6x1)(1x3)A", "(1x3)A"},
      {"X(8x2)(3x3)ABCY", "X(3x3)ABC(3x3)ABCY"}
    ]

    for {input, output} <- @input do
      test input do
        assert unquote(output) == Day9.decompress(unquote(input))
      end
    end
  end

  test "part 1" do
    assert 74532 == Helper.load_input(9)
      |> String.replace("\n", "")
      |> Day9.decompress
      |> String.length
  end
end
