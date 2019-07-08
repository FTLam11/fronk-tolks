defmodule TodoList do
  defstruct auto_id: 1, entries: %{}

  def new(), do: %TodoList{}

  def add_entry(list, entry) do
    entry = Map.put(entry, :id, list.auto_id)
    new_entries = Map.put(list, list.auto_id, entry)

    %TodoList{list | auto_id: list.auto_id + 1, entries: new_entries}
  end

  def entries(list, date) do
    list.entries
    |> Stream.filter(fn {_, entry} -> entry.date == date end)
    |> Enum.map(fn {_, entry} -> entry end)
  end

  def delete_entry(list, id) do
    %TodoList{list | entries: Map.delete(list.entries, id)}
  end
end

defimpl Collectable, for: TodoList do
  def into(original) do
    {original, &into_callback/2}
  end

  defp into_callback(list, {:cont, entry}) do
    TodoList.add_entry(list, entry)
  end

  defp into_callback(list, :done), do: list

  defp into_callback(_, :halt), do: :ok
end
