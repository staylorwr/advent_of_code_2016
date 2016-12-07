defmodule AdventOfCode.Day7 do

  def is_tls?(string) do
    {not_in_brackets, in_brackets} = string |> split_ipv7
    if nil != Enum.find(in_brackets, &pairs_of_four?/1) do
      false
    else
      nil != Enum.find(not_in_brackets, &pairs_of_four?/1)
    end
  end

  def is_ssl?(string) do
    {not_in_brackets, in_brackets} = string |> split_ipv7
    [] != not_in_brackets
    |> Enum.flat_map(&pairs_of_three?/1)
    |> Enum.filter(&(&1 != nil))
    |> Enum.filter(fn(aba) ->
      nil != Enum.find(in_brackets, &(String.contains?(&1, to_bab(aba))))
    end)
  end

  def tls_address_count(input) do
    input
    |> String.split()
    |> Enum.map(&is_tls?/1)
    |> Enum.filter(&(&1))
    |> length
  end

  def ssl_address_count(input) do
    input
    |> String.split()
    |> Enum.map(&is_ssl?/1)
    |> Enum.filter(&(&1))
    |> length
  end

  defp split_ipv7(ipv7) do
    parts = String.split(ipv7, ["[", "]"])

    in_brackets = parts |> Enum.drop(1) |> Enum.take_every(2)
    not_in_brackets = parts |> Enum.drop(0)|> Enum.take_every(2)

    {not_in_brackets, in_brackets}
  end

  defp pairs_of_four?(<<a, b, b, a, _::binary>>) when a != b, do: true
  defp pairs_of_four?(<<_, rest::binary>>), do: pairs_of_four?(rest)
  defp pairs_of_four?(<<a, b, b, a>>) when a != b, do: true
  defp pairs_of_four?(<<_::binary>>), do: false

  defp pairs_of_three?(string), do: pairs_of_three?(string, [])
  defp pairs_of_three?(<<a, b, a, rest::binary>>, acc) when a != b do
    pairs_of_three?(<<b,a>> <> rest, [<<a,b,a>>|acc])
  end
  defp pairs_of_three?(<<a, b, a>>, acc) when a != b do
    pairs_of_three?(<<b,a>>, [<<a,b,a>>|acc])
  end
  defp pairs_of_three?(<<_, rest::binary>>, acc), do: pairs_of_three?(rest, acc)
  defp pairs_of_three?(<<_::binary>>, acc), do: acc

  defp to_bab(<<a,b,a>>), do: <<b,a,b>>
end
