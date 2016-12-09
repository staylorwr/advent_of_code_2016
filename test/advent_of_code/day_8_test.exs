defmodule AdventOfCode.Day8Test do
  use ExUnit.Case
  alias AdventOfCode.{Day8, Helper}
  alias AdventOfCode.Day8.Screen
  doctest Day8


  @blank_7x3 Screen.new """
             .......
             .......
             .......
             """

  describe "draw" do
    @instructions [
      "rect 3x2",
      "rotate column x=1 by 1",
      "rotate row y=0 by 4",
      "rotate column x=1 by 1"
    ]

    test "no instructions gives a blank screen" do
      assert Day8.draw([], @blank_7x3).screen ==
      """
      .......
      .......
      .......
      """
    end

    test "light up 3x2 in the top corner" do
      assert @instructions
      |> Enum.take(1)
      |> Day8.draw(@blank_7x3)
      |> Map.get(:screen) ==
      """
      ###....
      ###....
      .......
      """
    end

    test "rotate column 1 down by 1" do
      assert @instructions
      |> Enum.take(2)
      |> Day8.draw(@blank_7x3)
      |> Map.get(:screen) ==
      """
      #.#....
      ###....
      .#.....
      """
    end

    test "rotate row 0 by right 4" do
      assert @instructions
      |> Enum.take(3)
      |> Day8.draw(@blank_7x3)
      |> Map.get(:screen) ==
      """
      ....#.#
      ###....
      .#.....
      """
    end

    test "full instructions" do
      assert Day8.draw(@instructions, @blank_7x3).screen ==
      """
      .#..#.#
      #.#....
      .#.....
      """
    end

    test "count pixels" do
      assert Day8.count_pixels(@blank_7x3) == 0

      assert @instructions
      |> Day8.draw(@blank_7x3)
      |> Day8.count_pixels == 6
    end
  end

  def input_screen do
    Helper.load_input(8)
    |> String.split("\n", trim: true)
    |> Day8.draw(Screen.new({50,6}))
  end

  test "part 1" do
    assert input_screen |> Day8.count_pixels == 116
  end
end
