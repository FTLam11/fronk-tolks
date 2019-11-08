class TodoList
  TodoItem = Struct.new(:id, :date, :title)

  attr_reader :entries

  def initialize
    @auto_id = 1
    @entries = {}
  end

  def add_entry(date, title)
    entries[@auto_id] = TodoItem.new(@auto_id, date, title)
    @auto_id += 1
    entries
  end
end

list = TodoList.new
list.entries # {}
list.add_entry(Time.now, 'Walk dog')
