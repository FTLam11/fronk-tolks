yo_block = lambda do |klass|
             klass.define_method(:yo) do
               "#{klass}#yo"
             end
           end

describe 'Ruby method lookup for instance object' do
  before(:each) do
    class Person; end
    yo_block.call(Person)
  end

  context 'with method defined on object' do
    it 'looks in the class of the object' do
      expect(Person.new.yo).to eq 'Person#yo'
    end
  end

  context 'with method defined on singleton class of the object' do
    it 'looks in the singleton class of the object' do
      falcon = Person.new
      yo_block.call(falcon.singleton_class)
      result = "#{falcon.singleton_class}#yo"

      expect(falcon.yo).to_not eq 'Person#yo'
      expect(falcon.yo).to eq result
    end
  end

  context 'with method defined on module' do
    IncludeGreetable = Module.new do
      define_singleton_method(:included) do |other_module|
        yo_block.call(self)
      end
    end

    PrependGreetable = Module.new do
      define_singleton_method(:prepended) do |other_module|
        yo_block.call(self)
      end
    end

    it 'looks in the class of the object before looking in included modules' do
      class Person include IncludeGreetable; end
      falcon = Person.new

      expect(falcon.yo).to_not eq 'Greetable#yo'
      expect(falcon.yo).to eq 'Person#yo'
    end

    it 'looks in prepended modules before looking in the class of the object' do
      class Person prepend PrependGreetable; end
      falcon = Person.new

      expect(falcon.yo).to_not eq 'Person#yo'
      expect(falcon.yo).to eq 'PrependGreetable#yo'
    end

    it 'looks in the singleton class of the object before looking in prepended modules' do
      class Person prepend PrependGreetable; end
      falcon = Person.new
      yo_block.call(falcon.singleton_class)
      result = "#{falcon.singleton_class}#yo"

      expect(falcon.yo).to_not eq 'PrependGreetable#yo'
      expect(falcon.yo).to eq result
    end

    it 'looks in the singleton class of the object before looking in singleton class of the singleton class' do
      falcon = Person.new
      yo_block.call(falcon.singleton_class)
      yo_block.call(falcon.singleton_class.singleton_class)
      result = "#{falcon.singleton_class}#yo"
      double_singleton = "#{falcon.singleton_class.singleton_class}#yo"

      expect(falcon.yo).to_not eq double_singleton
      expect(falcon.yo).to eq result
    end
  end
end
