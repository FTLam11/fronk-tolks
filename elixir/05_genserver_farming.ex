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
    GenServer.start(PokemonSSRoster, nil, name: PokemonSSRoster)
  end

  def confirm(pokemon) do
    GenServer.cast(PokemonSSRoster, {:confirm, pokemon})
  end

  def list do
    GenServer.call(PokemonSSRoster, :list)
  end
end
