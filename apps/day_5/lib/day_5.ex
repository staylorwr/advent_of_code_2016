defmodule Door do
  alias Experimental.Flow

  def hash(door_id) do
    door_id
    |> get_hashes
    |> Enum.take(8)
    |> Enum.map(fn
      << "00000"::binary, letter::size(1)-binary, _::binary >> -> letter
      _ -> nil
    end)
    |> :erlang.iolist_to_binary
  end

  def ordered_hash(door_id) do
    acc =
      Stream.repeatedly(fn() -> " " end)
      |> Enum.take(8)

    door_id
    |> get_hashes
    |> Enum.reduce_while(acc, fn
      << "00000"::binary, pos::size(1)-binary, letter::size(1)-binary, _::binary >>, acc when pos in ["0", "1", "2", "3", "4", "5", "6", "7"] ->
        pos = String.to_integer(pos)
        acc = case Enum.at(acc, pos) do
          nil -> acc
          " " -> List.replace_at(acc, pos, letter)
          _ -> acc
        end
        if Enum.any?(acc, &(&1 == " ")) do
          {:cont, acc}
        else
          {:halt, acc}
        end
      _, acc ->{:cont, acc}
    end)
    |> :erlang.iolist_to_binary
  end

  defp get_hashes(door_id) do
    Stream.iterate(0, &(&1 + 1))
    |> Flow.from_enumerable
    |> Flow.map(&([door_id, Integer.to_string(&1)]))
    |> Flow.map(&:crypto.hash(:md5, &1))
    |> Flow.map(fn << keep::size(4)-binary, _::binary >> -> keep end)
    |> Flow.map(&Base.encode16(&1, case: :lower))
    |> Flow.filter(fn
      << "00000"::binary, rest::binary >> ->
        true
      _ -> false
    end)
  end
end
