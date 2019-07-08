defmodule TodoList do
  defstruct auto_id: 1, entries: %{}

  def new(), do: %TodoList{}

  def add_entry(list, entry = %{date: _, title: _}) do
    entry = Map.put(entry, :id, list.auto_id)
    new_entries = Map.put(list.entries, list.auto_id, entry)

    %TodoList{list | auto_id: list.auto_id + 1, entries: new_entries}
  end

  def entries(list, date) do
    list.entries
    |> Stream.filter(fn {_, entry} -> entry.date == date end)
    |> Enum.map(fn {_, title} -> title end)
  end

  def update_entry(list, %{date: _, title: _} = new_entry) do
    update_entry(list, new_entry.id, fn _ -> new_entry end)
  end

  def update_entry(list, id, update_fn) do
    case Map.fetch(list.entries, id) do
      :error -> list

      {:ok, old_entry} ->
        new_entry = update_fn.(old_entry)
        new_entries = Map.put(list.entries, new_entry.id, new_entry)
        %TodoList{list | entries: new_entries}
    end
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
