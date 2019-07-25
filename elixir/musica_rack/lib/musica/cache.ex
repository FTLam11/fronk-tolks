defmodule Musica.Cache do
  use GenServer, restart: :temporary

  def start_link do
    IO.puts("Starting Cache")
    DynamicSupervisor.start_link(name: __MODULE__, strategy: :one_for_one)
  end

  def server_process(rack_name) do
    case start_child(rack_name) do
      {:ok, pid} -> pid
      {:error, {:already_started, pid}} -> pid
    end
  end

  def child_spec(_arg) do
    %{
      id: __MODULE__,
      start: {__MODULE__, :start_link, []},
      type: :supervisor
    }
  end

  defp start_child(rack_name) do
    DynamicSupervisor.start_child(__MODULE__, {Musica.Server, rack_name})
  end

  @impl GenServer
  def init(_) do
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
