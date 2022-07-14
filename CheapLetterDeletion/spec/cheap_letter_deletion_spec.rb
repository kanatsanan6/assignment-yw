require 'cheap_letter_deletion'

describe CheapLetterDeletion do
  let(:instance) { described_class.new }

  describe 'solution'
  context 'given string and costs' do
    it 'returns 2' do
      expect(instance.solution('abccbd', [0, 1, 2, 3, 4, 5])).to eq 2
    end
    it 'returns 3' do
      expect(instance.solution('aabbcc', [1, 2, 1, 2, 1, 2])).to eq 3
    end
    it 'returns 12' do
      expect(instance.solution('aaaa', [3, 4, 5, 6])).to eq 12
    end
    it 'returns 0' do
      expect(instance.solution('ababa', [10, 5, 10, 5, 10])).to eq 0
    end
  end
end