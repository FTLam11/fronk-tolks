defmodule Musica.DatabaseWorker do
  use GenServer

  def start_link({db_dir, worker_id}) do
    IO.puts("Starting #{worker_id} DatabaseWorker")
    GenServer.start_link(__MODULE__, db_dir, name: via_tuple(worker_id))
  end

  def read(worker_id, key) do
    GenServer.call(via_tuple(worker_id), {:read, key})
  end

  def write(worker_id, key, data) do
    GenServer.cast(via_tuple(worker_id), {:write, key, data})
  end

  @impl GenServer
  def init(db_dir) do
    {:ok, db_dir}
  end

  @impl GenServer
  def handle_call({:read, key}, _, db_dir) do
    data = case File.read(file_name(db_dir, key)) do
      {:ok, contents} -> :erlang.binary_to_term(contents)
      {:error, :enoent} -> nil
    end

    {:reply, data, db_dir}
  end

  @impl GenServer
  def handle_cast({:write, key, data}, db_dir) do
    db_dir
    |> file_name(key)
    |> File.write!(:erlang.term_to_binary(data))

    {:noreply, db_dir}
  end

  defp file_name(db_dir, key) do
    Path.join(db_dir, to_string(key))
  end

  defp via_tuple(worker_id) do
    Musica.ProcessRegistry.via_tuple({__MODULE__, worker_id})
  end
end
