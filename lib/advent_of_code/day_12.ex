defmodule AdventOfCode.Day12 do

  def process(instructions, regs \\ [a: 0, b: 0, c: 0, d: 0]) do
    program = instructions
      |> String.split("\n", trim: true)
      |> Enum.map(&String.split/1)
    run(program, regs, 0)
  end

  def run(program, regs, addr) when addr >= length(program), do: regs
  def run(program, regs, addr) do
    args = Enum.at(program, addr)
    {offset, regs} = apply(__MODULE__, :inst, args ++ [regs])
    run(program, regs, addr + offset)
  end

  defp value(x, regs) do
    case Integer.parse(x) do
      {n, _} -> n
      :error -> regs[String.to_atom(x)]
    end
  end

  def inst("inc", x, regs) do
    x = String.to_atom(x)
    v = regs[x]
    regs = put_in(regs[x], v + 1)
    {1, regs}
  end

  def inst("dec", x, regs) do
    x = String.to_atom(x)
    v = regs[x]
    regs = put_in(regs[x], v - 1)
    {1, regs}
  end

  def inst("cpy", x, y, regs) do
    y = String.to_atom(y)
    v = value(x, regs)
    regs = put_in(regs[y], v)
    {1, regs}
  end

  def inst("jnz", x, y, regs) do
    v = value(x, regs)
    y = String.to_integer(y)
    if v != 0 do
      {y, regs}
    else
      {1, regs}
    end
  end
end
