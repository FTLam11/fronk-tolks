defmodule Musica.Cache do
  use GenServer

  def start_link(_) do
    IO.puts("Starting Cache")
    GenServer.start_link(__MODULE__, nil, name: __MODULE__)
  end

  def server_process(rack_name) do
    GenServer.call(__MODULE__, {:server_process, rack_name})
  end

  @impl GenServer
  def init(_) do
    Musica.Database.start_link
    {:ok, %{}}
  end

  @impl GenServer
  def handle_call({:server_process, rack_name}, _, rack_servers) do
    case Map.fetch(rack_servers, rack_name) do
      {:ok, rack_server} -> {:reply, rack_server, rack_servers}
      :error ->
        {:ok, new_server} = Musica.Server.start_link(rack_name)
        {
          :reply,
          new_server,
          Map.put(rack_servers, rack_name, new_server)
        }
    end
  end
end
