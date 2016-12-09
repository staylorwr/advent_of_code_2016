defmodule AdventOfCode.Day9 do
  @moduledoc """
  # Advent of Code, Day 9: Explosives in Cyberspace

  See: http://adventofcode.com/2016/day/9
  """

  @doc """
  Decompresses the input string
  """
  @spec decompress(String.t) :: String.t
  def decompress(input) do
    parse(input, [])
  end

  def parse("", acc), do: acc |> Enum.reverse |> Enum.join
  def parse(<<"(", rest :: binary >>, acc) do
    instruction(rest, acc, [])
  end
  def parse(<<c, other::binary>>, acc) do
    parse(other, [<<c>>|acc])
  end

  def instruction(<<")", rest::binary>>, acc, inst) do
    inst = inst |> Enum.reverse() |> Enum.join
    [x_length, times] = String.split(inst, "x") |> Enum.map(&String.to_integer/1)
    consume(rest, acc, x_length, times)
  end
  def instruction(<<c, rest::binary>>, acc, inst) do
    instruction(rest, acc, [<<c>>|inst])
  end

  def consume(s, acc, x_length, times) do
    to_decompress = String.slice(s, 0, x_length)
    rest = String.slice(s, x_length..-1)
    decompressed = Enum.join(List.duplicate(to_decompress, times))
    parse(rest, [decompressed|acc])
  end
end
