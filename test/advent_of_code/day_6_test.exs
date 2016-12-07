defmodule AdventOfCode.Day6Test do
  use ExUnit.Case
  alias AdventOfCode.{Day6,Helper}

  test "example 1", do: assert example |> Day6.extract_max == "easter"
  test "result 1", do: assert input |> Day6.extract_max == "kjxfwkdh"
  test "example 2", do: assert example |> Day6.extract_min == "advent"
  test "result 2", do: assert input |> Day6.extract_min == "xrwcsnps"

  def example do
    """
    eedadn
    drvtee
    eandsr
    raavrd
    atevrs
    tsrnev
    sdttsa
    rasrtv
    nssdts
    ntnada
    svetve
    tesnvt
    vntsnd
    vrdear
    dvrsen
    enarar
    """
  end

  def input, do: Helper.load_input(6)
end
