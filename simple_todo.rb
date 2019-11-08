class TodoList
  def initialize
    @auto_id = 1
    @entries = {}
  end

  def add_entry(date, title)
    @entries[@auto_id] = { id: @auto_id, date: date, title: title }
    @auto_id += 1
    @entries
  end

  def entries
    @entries.map { |_id, entry| entry.reject { |k, _v| k == :id } }
  end
end

list = TodoList.new
list.entries # {}
list.add_entry(Time.now, 'Walk dog')
