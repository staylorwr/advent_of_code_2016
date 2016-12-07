defmodule AdventOfCode.Day6 do

  def extract_max(lines) do
    lines
    |> extract
    |> Enum.map(&Enum.max_by(&1, fn {_, count} -> count end))
    |> present
  end

  def extract_min(lines) do
    lines
    |> extract
    |> Enum.map(&Enum.min_by(&1, fn {_, count } -> count end))
    |> present
  end

  defp extract(lines) do
    lines
    |> String.split()
    |> Enum.map(&String.to_charlist/1)
    |> Enum.reduce([], &extract_most_used_char/2)
  end

  defp present(data) do
    data
    |> Enum.map(&elem(&1, 0))
    |> to_string
  end

  defp extract_most_used_char([], []), do: []
  defp extract_most_used_char(list, []) do
    acc =  [%{}]
    |> Stream.cycle
    |> Enum.take(length(list))

    extract_most_used_char(list, acc)
  end

  defp extract_most_used_char([head_c|tail_c], [head_a|tail_a]) do
    updated_map = Map.update(head_a, head_c, 1, &(&1+1))
    [updated_map|extract_most_used_char(tail_c, tail_a)]
  end
end
