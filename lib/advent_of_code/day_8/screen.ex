defmodule AdventOfCode.Day8.Screen do
  defstruct dimensions: {0,0}, screen: ""

  def new(string) when is_binary(string) do
    rows = String.split(string, "\n", trim: true)
    dimensions = {byte_size(hd rows), length rows}
    %__MODULE__{dimensions: dimensions, screen: string}
  end

  def new({x,y} = dimensions) when is_integer(x) and is_integer(y) do
    string = String.duplicate(".", x) |> List.duplicate(y) |> Enum.join("\n")
    %__MODULE__{dimensions: dimensions, screen: string}
  end
end

defimpl String.Chars, for: AdventOfCode.Day8.Screen do
  def to_string(screen), do: screen.screen
end
