class RubyClass end;

describe RubyClass do
  it 'keeps a reference to self' do
    block = lambda {
      # add code to RubyClass here
    }

    expect { block.call }.to output('RubyClass').to_stdout
  end

  it 'returns the value of the last statement' do
    result = class RubyClass
               # write code here
             end
    expect(result).to be RubyClass
  end
end

describe 'Current Class' do
  it 'has a class at the top level' do
    this = nil
    # change the assignment of this
    expect(this.class).to be Object
  end

  it 'has a class inside a method' do
    class RubyClass
      def a_method
        def b_method
          # write code here
        end

        b_method
      end
    end

    expect(RubyClass.new.a_method).to be RubyClass
  end
end

describe Module do
  describe '#class_eval' do
    it 'evaluates a block in the context of an existing class' do
      # use class_eval or module_eval here
      expect({key: 'value'}.hello_world).to eq 'Hello World'
      expect('Earth'.hello_world).to eq 'Hello World'
      expect(1.hello_world).to eq 'Hello World'
      expect((1..10).hello_world).to eq 'Hello World'
      expect(true.hello_world).to eq 'Hello World'
    end
  end
end

describe 'Two kinds of class variables' do
  describe 'Class Instance Variables' do
    it 'belongs to the class' do
      class PokemonTrainer
        @pokemon = %w(Squirtle Ivysaur Charizard)

        class << self
          attr_reader :pokemon
        end

        attr_reader :pokemon

        def initialize
          @pokemon = nil
        end
      end

      class Red < PokemonTrainer; end

      # fix expectations below
      expect(Red.pokemon).to eq PokemonTrainer.pokemon
      expect(PokemonTrainer.new.pokemon).to eq PokemonTrainer.pokemon
    end
  end

  describe 'Class Variables' do
    it 'belongs to a class hierarchy' do
      class PokemonTrainer
        @@pokemon = %w(Squirtle Ivysaur Charizard)

        def self.pokemon
          @@pokemon
        end
      end

      class Red < PokemonTrainer; end

      # fix expectation below
      expect(Red.pokemon).to_not eq PokemonTrainer.pokemon
    end
  end
end

describe 'Singleton methods' do
  it 'can be defined on self' do
    # write code here

      expect(String.singleton_methods).to include(:hello_world)
      expect { 'LOL'.hello_world }.to_not raise_error
      expect { String.hello_world }.to_not raise_error
      # why do these expectations pass?
    end
    expect(String.singleton_methods).to include(:hello_world)
    expect { 'LOL'.hello_world }.to_not raise_error
    expect { String.hello_world }.to_not raise_error
    # why do these expectations pass?
  end

  it 'can be defined on a constant class name' do
    anonymous_class = Class.new {}
    Homie = anonymous_class
    # write code here
    end

    it 'can be defined on an object' do
      mj = 'Michael Jordan'
      # write code here
      expect(mj.is_goat?).to be true
      expect { 'Lebron James'.is_goat? }.to raise_error NoMethodError
    end

    expect(Homie.holla_back).to eql 'Yo!'
  end

  it 'can be defined on an object' do
    mj = 'Michael Jordan'
    # write code here
    expect(mj.is_goat?).to be true
    expect { 'Lebron James'.is_goat? }.to raise_error NoMethodError
  end
end

describe 'Ruby object' do
  it 'has a Singleton class' do
    object = 'Ruby string'
    # write code here
    expect(object.singleton_class).to be singleton_class
  end
end

describe 'Ruby method lookup for instance object' do
  let(:yo_block) { lambda do |klass|
    klass.define_method(:yo) do
      "#{klass}#yo"
    end
  end }

  describe 'with basic lookup' do
    it 'goes straight into the class of the object' do
      class Person; end
      yo_block.call(Person)

      expect(Person.new.yo).to eq 'Person#yo'
    end
  end

  describe 'with method defined on singleton class of the object' do
    it 'goes straight into the singleton class of the object' do
      class Person; end
      yo_block.call(Person)
      falcon = Person.new
      yo_block.call(falcon.singleton_class)
      result = "#{falcon.singleton_class}#yo"

      expect(falcon.yo).to_not eq 'Person#yo'
      expect(falcon.yo).to eq result
    end
  end
end
