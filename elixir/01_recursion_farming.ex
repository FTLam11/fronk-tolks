defmodule TailRecursion do
  def list_len(list) do
    do_list_len(0, list)
  end

  defp do_list_len(size, []), do: size

  defp do_list_len(size, [_ | tail]) do
    do_list_len(size + 1, tail)
  end

  def range(start, fin) do
    do_range([], start, fin)
  end

  defp do_range(list, start, fin) when fin < start, do: list

  defp do_range(list, start, fin) do
    do_range([fin | list], start, fin - 1)
  end

  def positive(list) do
    do_positive([], list)
  end

  defp do_positive(acc, []), do: Enum.reverse(acc)

  defp do_positive(acc, [head | tail]) when head > 0 do
    do_positive([head | acc], tail)
  end

  defp do_positive(acc, [_ | tail]) do
    do_positive(acc, tail)
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

IO.inspect(TailRecursion.list_len([]))
IO.inspect(TailRecursion.list_len([1, 2, 3]))

IO.inspect(NonTailRecursion.list_len([]))
IO.inspect(NonTailRecursion.list_len([1, 2, 3]))

IO.inspect(TailRecursion.range(1, 5))
IO.inspect(NonTailRecursion.range(1, 5))

IO.inspect(TailRecursion.positive([-1, 2, 3, -4, 1, 0]))
IO.inspect(NonTailRecursion.positive([-1, 2, 3, -4, 1, 0]))
