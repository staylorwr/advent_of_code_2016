defmodule Taxi do
  def net_distance(steps), do: calculate(steps, &List.last/1)

  def distance_of_first_overlap(steps), do: calculate(steps, &first_overlap(&1, nil))

  defp first_overlap([], match), do: match
  defp first_overlap([candidate | rest], nil) do
    first_overlap(rest, Enum.find(rest, &xy_match(candidate, &1)))
  end
  defp first_overlap(_, success), do: success

  defp calculate(directions, extractor) do
    directions
    |> parse
    |> process(extractor)
  end

  defp parse(directions) do
    directions
    |> String.split(", ")
  end

  defp process(steps, extractor_fn) do
    {coordinates, _} =
    steps
    |> Enum.flat_map_reduce({0, 0, :n}, fn cmd, pos ->
      [dir, len_str] = String.split(cmd, ~r{}, parts: 2)
      new_pos = pos |> turn(dir) |> step(String.to_integer(len_str))
      {new_pos, List.last(new_pos)}
    end)

    coordinates
    |> extractor_fn.()
    |> distance
  end

  @turns %{"R" => [n: :e, e: :s, s: :w, w: :n], "L" => [n: :w, w: :s, s: :e, e: :n]}
  defp turn({x, y, h}, dir), do: {x, y, @turns[dir][h]}

  defp distance({x, y, _}), do: abs(x) + abs(y)
  defp distance(_), do: nil

  defp step({x, y, :n}, len), do: Enum.map((y+1)..(y+len), &{x, &1, :n})
  defp step({x, y, :e}, len), do: Enum.map((x+1)..(x+len), &{&1, y, :e})
  defp step({x, y, :s}, len), do: Enum.map((y-1)..(y-len), &{x, &1, :s})
  defp step({x, y, :w}, len), do: Enum.map((x-1)..(x-len), &{&1, y, :w})

  defp xy_match({x1, y1, _}, {x2, y2, _}), do: x1 == x2 and y1 == y2
end
