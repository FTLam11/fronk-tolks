main = self

describe Module do
  describe '#alias_method' do
    it 'wraps methods' do
      # write code here
      expect('lol'.to_s).to eq 'lol科科'
      expect('lol'.to_string).to eq 'lol'
    end
  end

  describe '#refine' do
    it 'calls the original method with super' do
      module Kekeable
        refine String do
          def to_s
            super + '科科'
          end
        end
      end

      function = lambda do
        main.class.class_eval do
          using Kekeable

          'lol'.to_s
        end
      end

      expect(function.call).to eq 'lol科科'
    end
  end
end
