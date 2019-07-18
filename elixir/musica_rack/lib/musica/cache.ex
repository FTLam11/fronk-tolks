defmodule Musica.Cache do
  use GenServer

  def start do
    GenServer.start(__MODULE__, nil)
  end

  def server_process(cache_pid, rack_name) do
    GenServer.call(cache_pid, {:server_process, rack_name})
  end

  @impl GenServer
  def init(_) do
    Musica.Database.start
    {:ok, %{}}
  end

  @impl GenServer
  def handle_call({:server_process, rack_name}, _, rack_servers) do
    case Map.fetch(rack_servers, rack_name) do
      {:ok, rack_server} -> {:reply, rack_server, rack_servers}
      :error ->
        {:ok, new_server} = Musica.Server.start(rack_name)
        {
          :reply,
          new_server,
          Map.put(rack_servers, rack_name, new_server)
        }
    end
  end
end
