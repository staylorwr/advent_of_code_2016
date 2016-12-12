defmodule AdventOfCode.Day10.Bot do
  use GenServer

  alias AdventOfCode.Day10.BotRegistry

  # Client API
  def send_action({:give, actor, _target_low, _target_high} = action) do
    if GenServer.whereis(actor) == nil do
      GenServer.start(__MODULE__, [], name: actor)
      BotRegistry.register(actor)
    end
    GenServer.call(actor, action)
  end

  def send_action({:input, actor, _chip_number} = action) do
    if GenServer.whereis(actor) == nil do
      GenServer.start(__MODULE__, [], name: actor)
      BotRegistry.register(actor)
    end
    GenServer.call(actor, action)
  end

  def get_output_value(output) do
    GenServer.call(output, :value)
  end

  def init(_args) do
    {:ok, {[],[]}}
  end

  def handle_call({:input, actor, chip_number}, _from, {values, actions}) do
    state = act_on_action(values ++ [chip_number], actions)
    {:reply, actor, state}
  end

  def handle_call({:give, actor, _target_low, _target_high} = new_action, _from, {values, actions}) do
    state = act_on_action(values, actions ++ [new_action])
    {:reply, actor, state}
  end

  def handle_call(:value, _from, {value, _actions} = state) do
    {:reply, value, state}
  end

  defp act_on_action([value1, value2 |rest], [{:give, actor, target_low, target_high}| action_rest]) do
    if value1 in [61,17] and value2 in [61,17] do
      BotRegistry.send_answer(actor)
    end

    {value_high, value_low} =
      if value1>value2 do
        {value1, value2}
      else
        {value2, value1}
      end

    send_action({:input, target_low, value_low})
    send_action({:input, target_high, value_high})
    {rest, action_rest}
  end
  defp act_on_action(values, actions), do: {values, actions}
end
