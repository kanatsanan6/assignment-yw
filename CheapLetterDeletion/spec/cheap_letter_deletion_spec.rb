require 'cheap_letter_deletion'

describe CheapLetterDeletion do
  let(:instance) { described_class.new }

  describe 'solution' do
    context 'sample testcase' do
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

    context 'equal letters' do
      it 'returns 45' do
        expect(instance.solution('aaaaaaaaaa', [1, 2, 3, 4, 5, 6, 7, 8, 9, 10])).to eq 45
      end
    end

    context 'answer is equal to zero' do
      it 'returns 0' do
        expect(instance.solution('abcdefghigkl', [3, 4, 5, 6, 5, 7, 2, 3, 4, 5, 6, 1])).to eq 0
      end
    end

    context 'two distinct letters' do
      it 'returns 17' do
        expect(instance.solution('abbaabaabbababb', [1, 4, 3, 5, 3, 2, 3, 4, 2, 1, 2, 3, 5, 7, 8])).to eq 17
      end
    end

    context 'repeating pattern' do
      it 'returns 17' do
        expect(instance.solution('abccbddaa' * 40, [0, 7, 1, 2, 5, 4, 6, 4, 1] * 40)).to eq 6 * 40
      end
    end
  end
end
