require 'Caesar_gem'

RSpec.describe CaesarGem::Caesar do
  describe '.encrypt' do
    it 'shifts characters by the step' do
      expect(CaesarGem::Caesar.encrypt('abc', 3)).to eq('def')
    end

    it 'camel case' do
      expect(CaesarGem::Caesar.encrypt('AbC', 3)).to eq('DeF')
    end

    it 'ignores non-letter characters' do
      expect(CaesarGem::Caesar.encrypt('abc123!*)', 3)).to eq('def123!*)')
    end
  end

  describe '.decrypt' do
    it 'shifts characters backwards by the step' do
      expect(CaesarGem::Caesar.decrypt('def', 3)).to eq('abc')
    end
  end
end
