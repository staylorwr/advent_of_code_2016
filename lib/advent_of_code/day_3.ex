defmodule AdventOfCode.Day3 do

  def count_triangles(input, :horizontal) do
    input
    |> String.split()
    |> Enum.map(&String.trim/1)
    |> Enum.map(&String.to_integer/1)
    |> Enum.chunk(3)
    |> Enum.count(&is_triangle?/1)
  end

  def count_triangles(input, :vertical) do
    input
    |> String.split()
    |> Enum.map(&String.trim/1)
    |> Enum.map(&String.to_integer/1)
    |> Enum.with_index
    |> Enum.sort_by(fn {_, i} -> rem(i, 3) end)
    |> Enum.unzip
    |> elem(0)
    |> Enum.chunk(3)
    |> Enum.count(&is_triangle?/1)
  end


  def is_triangle?([x,y,z]) when x+y > z and x+z > y and y+z > x, do: true
  def is_triangle?(_), do: false

end
