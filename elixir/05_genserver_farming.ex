defmodule PokemonSSRoster do
  use GenServer

  def init(_) do
    {:ok, []}
  end

  def handle_cast({:confirm, pokemon}, roster) do
    {:noreply, [pokemon | roster]}
  end

  def handle_call(:list, _, roster) do
    {:reply, roster, roster}
  end

  def start do
    GenServer.start(__MODULE__, nil, name: __MODULE__)
  end

  def confirm(pokemon) do
    GenServer.cast(__MODULE__, {:confirm, pokemon})
  end

  def list do
    GenServer.call(__MODULE__, :list)
  end
end
