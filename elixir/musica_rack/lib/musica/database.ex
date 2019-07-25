defmodule Musica.Database do
  use GenServer

  @db_dir "./tmp"

  def start_link do
    IO.puts("Starting Database")
    GenServer.start_link(__MODULE__, nil, name: __MODULE__)
  end

  def read(key) do
    key
    |> choose_worker()
    |> Musica.DatabaseWorker.read(key)
  end

  def write(key, data) do
    key
    |> choose_worker()
    |> Musica.DatabaseWorker.write(key, data)
  end

  @impl GenServer
  def init(_) do
    File.mkdir_p!(@db_dir)
    {:ok, init_workers()}
  end

  @impl GenServer
  def handle_call({:choose_worker, key}, _, workers) do
    worker_key = :erlang.phash2(key, 3)
    {:reply, Map.get(workers, worker_key), workers}
  end

  defp choose_worker(key) do
    GenServer.call(__MODULE__, {:choose_worker, key})
  end

  defp init_workers do
    for idx <- (0..2), into: %{} do
      {:ok, worker_pid} = Musica.DatabaseWorker.start_link(@db_dir)
      {idx, worker_pid}
    end
  end
end
