defmodule HigherOrder do
  def large_lines!(path) do
    path
    |> File.stream!()
    |> Stream.map(&String.replace(&1, "\n", ""))
    |> Enum.filter(&(String.length(&1) > 80))
  end

  def lines_lengths!(path) do
    path
    |> File.stream!()
    |> Enum.map(&String.length/1)
  end

  def longest_line_length!(path) do
    path
    |> File.stream!()
    |> Enum.map(&String.length/1)
    |> Enum.max()
  end

  def longest_line!(path) do
    path
    |> File.stream!()
    |> Enum.max_by(&String.length/1)
  end

  def words_per_line!(path) do
    path
    |> File.stream!()
    |> Enum.map(&String.split/1)
    |> Enum.map(&length/1)
  end
end
