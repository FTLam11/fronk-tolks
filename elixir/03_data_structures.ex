defmodule TodoList do
  def delete_entry(list, id) do
    %TodoList{todo_list | entries: Map.delete(list.entries, id)}
  end
end
