defmodule Keypad do
  @moduledoc """
  Represents a simple keypad as:

  1 2 3
  4 5 6
  7 8 9

  """

  def next("U", "1"), do: "1"
  def next("L", "1"), do: "1"

  def next("U", "2"), do: "2"

  def next("U", "3"), do: "3"
  def next("R", "3"), do: "3"

  def next("L", "4"), do: "4"

  def next("R", "6"), do: "6"

  def next("L", "7"), do: "7"
  def next("D", "7"), do: "7"

  def next("D", "8"), do: "8"

  def next("D", "9"), do: "9"
  def next("R", "9"), do: "9"

  def next(dir, current) do
    value = current |> String.to_integer
    index = trunc(value / 3)
    remainder = rem(value, 3)
    case dir do
      "U" -> "#{(index - 1) * 3 + remainder}"
      "D" -> "#{(index + 1) * 3 + remainder}"
      "L" -> "#{value - 1}"
      "R" -> "#{value + 1}"
    end
  end
end
