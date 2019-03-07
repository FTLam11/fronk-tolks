describe 'Module inclusion' do
  it 'includes class methods' do
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
end
