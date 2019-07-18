defmodule Musica.Database do
  use GenServer

  @db_dir "./tmp"

  def start do
    GenServer.start(__MODULE__, nil, name: __MODULE__)
  end

  def write(key, data) do
    GenServer.cast(__MODULE__, {:write, key, data})
  end

  def read(key) do
    GenServer.call(__MODULE__, {:read, key})
  end

  def init(_) do
    File.mkdir_p!(@db_dir)
    {:ok, nil}
  end

  def handle_cast({:write, key, data}, state) do
    spawn(fn ->
      key
      |> file_name()
      |> File.write!(:erlang.term_to_binary(data))
    end)

    {:noreply, state}
  end

  def handle_call({:read, key}, caller, state) do
    spawn(fn ->
      data = case File.read(file_name(key)) do
        {:ok, contents} -> :erlang.binary_to_term(contents)
        _ -> nil
      end

      GenServer.reply(caller, data)
    end)

    {:noreply, state}
  end

  defp file_name(key) do
    Path.join(@db_dir, to_string(key))
  end
end
