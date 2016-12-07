defmodule AdventOfCode.Helper do
  def load_input(day) do
    Path.join(Application.app_dir(:advent_of_code, ["priv", "inputs"]), "day_#{day}.txt")
    |> File.read!()
  end
end