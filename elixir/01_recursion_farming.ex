defmodule TailRecursion do
  def list_len(list) do
    list_size(0, list)
  end

  defp list_size(size, []), do: size
  defp list_size(size, [_|tail]) do
    list_size(size + 1, tail)
  end
end

defmodule NonTailRecursion do
  def list_len([]), do: 0
  def list_len([_|tail]) do
    1 + list_len(tail)
  end
end

IO.puts(TailRecursion.list_len([]))
IO.puts(TailRecursion.list_len([1, 2, 3]))

IO.puts(NonTailRecursion.list_len([]))
IO.puts(NonTailRecursion.list_len([1, 2, 3]))
