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
    GenServer.start(PokemonSSRoster, nil, name: :pokemon_roster)
  end

  def confirm(pokemon) do
    GenServer.cast(:pokemon_roster, {:confirm, pokemon})
  end

  def list do
    GenServer.call(:pokemon_roster, :list)
  end
end
