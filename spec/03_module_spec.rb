describe Module do
  describe '#include' do
    it 'extends a class with class methods' do
      module AModule
        def self.klass_method
          'AModule.klass_method'
        end
      end

      class Subject
        include AModule
      end

      # fix production code
      expect{ Subject.klass_method }.to_not raise_error
    end

    it 'extends an object with instance methods' do
      module BModule
        def b_method; 'Yo'; end
      end

      object = Object.new
      another_object = Object.new

      # fix production code
      expect(object.b_method).to eq 'Yo'
      expect{ another_object.b_method }.to raise_error NoMethodError
    end
  end

  describe '#extend' do
  end
end
