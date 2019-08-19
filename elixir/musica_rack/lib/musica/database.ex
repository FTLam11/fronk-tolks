defmodule Musica.Database do
  @pool_size 3
  @db_dir "./tmp"

  def start_link do
    IO.puts("Starting Database")
    File.mkdir_p!(@db_dir)

    children = Enum.map(1..@pool_size, &worker_spec/1)
    Supervisor.start_link(children, strategy: :one_for_one)
  end

  def child_spec(_) do
    %{
      id: __MODULE__,
      start: {__MODULE__, :start_link, []},
      type: :supervisor
    }
  end

  defp worker_spec(worker_id) do
    worker_spec_template = {Musica.DatabaseWorker, {@db_dir, worker_id}}
    Supervisor.child_spec(worker_spec_template, id: worker_id)
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

  defp choose_worker(key) do
    :erlang.phash2(key, @pool_size) + 1
  end
end
