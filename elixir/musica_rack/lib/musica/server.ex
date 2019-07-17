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
    {:ok, Musica.Rack.new(name)}
  end

  @impl GenServer
  def handle_cast({:add_disc, disc}, musica_rack) do
    new_state = Musica.Rack.add_disc(musica_rack, disc)
    {:noreply, new_state}
  end

  @impl GenServer
  def handle_call(:collection, _, musica_rack) do
    {
      :reply,
      Musica.Rack.collection(musica_rack),
      musica_rack
    }
  end
end
