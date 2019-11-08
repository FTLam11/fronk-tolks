defmodule TodoList do
  defstruct auto_id: 1, entries: %{}

  def new(), do: %TodoList{}

  def add_entry(list, entry = %{date: _, title: _}) do
    entry = Map.put(entry, :id, list.auto_id)
    new_entries = Map.put(list.entries, list.auto_id, entry)

    %TodoList{list | auto_id: list.auto_id + 1, entries: new_entries}
  end

  def entries(list) do
    list.entries
    |> Enum.map(fn({_, entry}) ->
      %{date: entry.date, title: entry.title}
    end)
  end
end

list = TodoList.new
TodoList.entries(list) # %{}
todo = %{date: ~D[2019-10-01], title: "Walk dog"}
list = TodoList.add_entry(list, todo)
TodoList.entries(list)
