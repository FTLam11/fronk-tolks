defmodule TailRecursion do
  def list_len(list) do
    list_size(0, list)
  end

  defp list_size(size, []), do: size
  defp list_size(size, [_|tail]) do
    list_size(size + 1, tail)
  end

  def range(start, finish) do
    do_range([], start, finish)
  end

  defp do_range(list, start, finish) when finish < start, do: list
  defp do_range(list, start, finish) do
    do_range([finish|list], start, finish - 1)
  end
end

defmodule NonTailRecursion do
  def list_len([]), do: 0
  def list_len([_|tail]) do
    1 + list_len(tail)
  end

  def range(start, start), do: [start]
  def range(start, finish) do
    [start|range(start + 1, finish)]
  end
end

IO.puts(TailRecursion.list_len([]))
IO.puts(TailRecursion.list_len([1, 2, 3]))

IO.puts(NonTailRecursion.list_len([]))
IO.puts(NonTailRecursion.list_len([1, 2, 3]))

IO.inspect(TailRecursion.range(1, 5))
IO.inspect(NonTailRecursion.range(1, 5))
