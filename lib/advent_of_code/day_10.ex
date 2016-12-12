defmodule AdventOfCode.Day10 do
  alias AdventOfCode.Day10.{Bot, BotRegistry}

  def solve(input) do
    BotRegistry.launch()

    input
    |> String.split("\n")
    |> Enum.map(&String.trim/1)
    |> Enum.map(&String.split/1)
    |> Enum.map(&parse_action/1)
    |> Enum.map(&Bot.send_action/1)

    [:output0, :output1, :output2]
    |> Enum.flat_map(&Bot.get_output_value/1)
    |> Enum.reduce(fn x, acc -> x*acc end)
    |> Integer.to_string()
  end


  def parse_action(["bot", actor, "gives", "low", "to", output_bot_low, int_target_low, "and", "high", "to", output_bot_high, int_target_high | _rest]) do
    target_low = extract_target(output_bot_low, int_target_low)
    target_high = extract_target(output_bot_high, int_target_high)
    bot = extract_target("bot", actor)
    {:give, bot, target_low, target_high}
  end
  def parse_action(["value", chip_number, "goes", "to", "bot", actor_target |_rest]) do
    {:input, extract_target("bot",actor_target), String.to_integer(chip_number)}
  end

  def extract_target(type, number) do
    String.to_atom(type<>number)
  end
end
