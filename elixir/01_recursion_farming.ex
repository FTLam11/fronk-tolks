defmodule TailRecursion do
  def list_len(list) do
    list_size(0, list)
  end

  defp list_size(size, []), do: size
  defp list_size(size, [_|tail]) do
    list_size(size + 1, tail)
  end

  def range(start, fin) do
    do_range([], start, fin)
  end

  defp do_range(list, start, fin) when fin < start, do: list
  defp do_range(list, start, fin) do
    do_range([fin|list], start, fin - 1)
  end

  def positive(list) do
    do_positive([], list)
  end

  defp do_positive(acc, []), do: acc
  defp do_positive(acc, list) do
    if hd(list) > 0 do
      do_positive([hd(list)|acc], tl(list))
    else
      do_positive(acc, tl(list))
    end
  end
end

defmodule NonTailRecursion do
  def list_len([]), do: 0

  def list_len([_ | tail]) do
    1 + list_len(tail)
  end

  def range(start, fin) when start > fin, do: []

  def range(start, fin) do
    [start | range(start + 1, fin)]
  end

  def positive([]), do: []

  def positive([head | tail]) when head > 0 do
    [head | positive(tail)]
  end

  def positive([_ | tail]) do
    positive(tail)
  end
end

IO.puts(TailRecursion.list_len([]))
IO.puts(TailRecursion.list_len([1, 2, 3]))

IO.puts(NonTailRecursion.list_len([]))
IO.puts(NonTailRecursion.list_len([1, 2, 3]))

IO.inspect(TailRecursion.range(1, 5))
IO.inspect(NonTailRecursion.range(1, 5))

IO.inspect(TailRecursion.positive([-1, 2, 3, -4, 1]))
IO.inspect(NonTailRecursion.positive([-1, 2, 3, -4, 1]))
