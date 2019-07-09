defmodule FakeTaskRunner do
  def run(task_description) do
    IO.puts "Preparing to run #{task_description}"
    Process.sleep(:rand.uniform(3) * 1000)
    IO.puts "Finished executing #{task_description}"
  end

  def run_concurrently(task_description) do
    spawn(fn -> IO.puts(run(task_description)) end)
  end
end

tasks = ["Upload video", "Process payment", "Generate file archive", "Encode audio file"]

# Serial execution, blocking
Enum.each(tasks, &FakeTaskRunner.run/1)

# Leverage BEAM processes to concurrently run each task
Enum.each(tasks, &FakeTaskRunner.run_concurrently/1)

defmodule Secret do
  def pass_it_on(message) do
    caller = self()
    spawn(fn ->
      send(caller, {:ok, "Pst... #{message}, pass it on!"})
    end)

    receive do
      {:ok, secret} -> IO.inspect(secret)
    end
  end
end

Secret.pass_it_on("I ate your slice of pizza")

defmodule MusicFile do
  defmodule Server do
    def start do
      spawn(&loop/0)
    end

    defp loop do
      receive do
        {:download, caller, release} -> send(caller, prepare(release))
      end

      loop()
    end

    defp prepare(release) when release == nil, do: {:error, "#{release} not found."}

    defp prepare(release) do
      IO.puts "Encoding each track, compressing release, serving release..."
      file_name = String.replace(release, ~r/\s/, "_")
      {:ok, "https://burritofriedricepizzahotdawgs.yum.io/#{file_name}.zip"}
    end
  end

  defmodule Client do
    def download(server_pid, release) do
      send(server_pid, {:download, self(), release})
    end

    def download_zip do
      receive do
        {:ok, file_url} -> file_url
        {:error, err_message} -> err_message
      after
        30000 -> {:error, :timeout}
      end
    end
  end
end
