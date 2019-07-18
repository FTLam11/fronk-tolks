defmodule Musica.Server do
  use GenServer

  def start(name) do
    GenServer.start(__MODULE__, name)
  end

  def add_disc(musica_server, disc) do
    GenServer.cast(musica_server, {:add_disc, disc})
  end

  def collection(musica_server) do
    GenServer.call(musica_server, :collection)
  end

  @impl GenServer
  def init(name) do
    {:ok, {name, Musica.Database.read(name) || Musica.Rack.new}}
  end

  @impl GenServer
  def handle_cast({:add_disc, disc}, {name, musica_rack}) do
    new_state = Musica.Rack.add_disc(musica_rack, disc)
    Musica.Database.write(name, new_state)
    {:noreply, new_state}
  end

  @impl GenServer
  def handle_call(:collection, _, {name, musica_rack}) do
    {
      :reply,
      Musica.Rack.collection(musica_rack),
      {name, musica_rack}
    }
  end
end
