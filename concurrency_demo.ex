defmodule Fun do
  def no_fun(count) when count > 0 do
    1..count |> Enum.map(fn(_) -> "NO FUN" end) |> Enum.join(" ")
  end

  def very_fun(count) when count > 0 do
    do_fun(count, "")
  end

  defp do_fun(0, result), do: String.trim(result)

  defp do_fun(count, result) do
    more_fun = result <> "SO MUCH FUN "
    do_fun(count - 1, more_fun)
  end
end

defmodule SimpleFibonacci do
  def nth_term(n) when n > 0 do
    do_fib(n)
  end

  def serial_batch(list) do
    Enum.map(list, &SimpleFibonacci.nth_term/1)
  end

  def concurrent_batch(list) do
    Enum.map(list, fn(num) ->
      Task.async(fn -> SimpleFibonacci.nth_term(num) end)
    end) |> Enum.map(fn task -> Task.await(task, :infinity) end)
  end

  defp do_fib(1), do: 0

  defp do_fib(2), do: 1

  defp do_fib(n) do
    do_fib(n - 1) + do_fib(n - 2)
  end
end

defmodule FastFibonacci do
  def nth_term(n) when n > 0 do
    find(n, 0, 1)
  end

  defp find(1, _, result), do: result

  defp find(n, acc, result) do
    find(n - 1, result, result + acc)
  end
end

defmodule BenchMark do
  def time(input, {desc_a, desc_b}, {func_a, func_b}) do
    spawn(fn ->
      IO.puts "#{desc_a}: #{time(func_a, input)}"
    end)
    spawn(fn ->
      IO.puts "#{desc_b}: #{time(func_b, input)}"
    end)
  end

  defp time(func, arg) do
    start = Time.utc_now
    func.(arg)
    Time.diff(Time.utc_now, start, :millisecond)
  end
end

defmodule Rng do
  def list(length) when length > 0 do
    range = 1..length
    Enum.map(range, &rand/1)
  end

  def rand(_) do
    :rand.uniform(100_000_000)
  end
end

defmodule Fibonacci do
  def next_after(target) do
    find_next(target, 1, 0, 1)
  end

  defp find_next(target, _term_count, _acc, next) when next > target do
    next
  end

  defp find_next(target, term_count, acc, next) do
    find_next(target, term_count + 1, next, next + acc)
  end
end

defmodule NextFibonacci do
  def run(list) do
    Enum.map(list, fn(num) ->
      run_concurrently(self(), num)
      receive do
        {:ok, next} -> next
      end
    end)
  end

  defp run_concurrently(caller, number) do
    spawn(fn ->
      send(caller, {:ok, Fibonacci.next_after(number)})
    end)
  end
end
