defmodule Musica.DatabaseWorker do
  use GenServer

  def start(db_dir) do
    IO.puts("Starting DatabaseWorker")
    GenServer.start(__MODULE__, db_dir)
  end

  def read(worker_pid, key) do
    GenServer.call(worker_pid, {:read, key})
  end

  def write(worker_pid, key, data) do
    GenServer.cast(worker_pid, {:write, key, data})
  end

  @impl GenServer
  def init(db_dir) do
    {:ok, db_dir}
  end

  @impl GenServer
  def handle_call({:read, key}, _, db_dir) do
    data = case File.read(file_name(db_dir, key)) do
      {:ok, contents} -> :erlang.binary_to_term(contents)
      _ -> nil
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
end
