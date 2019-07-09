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
