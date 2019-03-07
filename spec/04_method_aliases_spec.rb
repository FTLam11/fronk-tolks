describe Module do
  describe '#alias_method' do
    it 'wraps methods' do
      # write code here
      expect('lol'.to_s).to eq 'lol科科'
      expect('lol'.to_string).to eq 'lol'
    end
  end
end
