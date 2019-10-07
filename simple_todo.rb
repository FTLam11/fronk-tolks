class TodoList
  TodoItem = Struct.new(:date, :title)

  attr_reader :entries

  def initialize
    @auto_id = 1
    @entries = {}
  end

  def add_entry(date, title)
    item = TodoItem.new(date, title)
    entries[@auto_id] = item
    @auto_id += 1
    entries
  end
end

list = TodoList.new
list.entries # {}
list.add_entry(Time.now, 'Walk dog')
