defmodule DoorCode do
  def decode(string) do
    string
    |> parse
    |> Enum.map_reduce("5", &move/2)
    |> encode
  end

  defp parse(string) do
    string
    |> String.split("\n")
  end

  defp move(instructions, start) do
    {_, value} =
    instructions
    |> String.codepoints
    |> Enum.map_reduce(start, fn(x, current) ->
      key = Keypad.next(x, current)
      {key, key}
    end)
    {value, value}
  end

  defp encode({list, _}), do: Enum.join(list)
end
