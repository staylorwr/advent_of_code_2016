defmodule AdventOfCode.Day10.BotRegistry do
  use GenServer

  # Client API
  def launch() do
    GenServer.start(__MODULE__, [], name: __MODULE__)
  end

  def register(actor) do
    GenServer.call(__MODULE__, {:register, actor})
  end

  def send_answer(actor) do
    GenServer.call(__MODULE__, {:answer, actor})
  end

  def find_value() do
    GenServer.call(__MODULE__, :find)
  end

  # Server API
  def init(_state) do
    {:ok, {[], nil}}
  end

  def handle_call({:register, actor}, _from, {list, something}) do
    {:reply, :ok, {[actor|list], something}}
  end

  def handle_call(:find, _from, {_list, answer} = state) do
    {:reply, answer, state}
  end

  def handle_call({:answer, actor}, _from, {list, _something}) do
    {:reply, :ok, {list, actor}}
  end
end
