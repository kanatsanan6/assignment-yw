require 'dec_repr_senior_coding'

describe DecReprSeniorCoding do
  let(:dec_repr_senior_coding) { described_class.new }

  describe 'correctness test' do
    context 'given number' do
      it 'returns 213' do
        expect(dec_repr_senior_coding.solution(213)).to eq 321
      end
      it 'returns 553' do
        expect(dec_repr_senior_coding.solution(553)).to eq 553
      end
      it 'returns 1234' do
        expect(dec_repr_senior_coding.solution(1234)).to eq 4321
      end
      it 'returns 1001' do
        expect(dec_repr_senior_coding.solution(1001)).to eq 1100
      end
      it 'returns 9879' do
        expect(dec_repr_senior_coding.solution(9879)).to eq 9987
      end
      it 'returns 89' do
        expect(dec_repr_senior_coding.solution(89)).to eq 98
      end
      it 'returns 123456789' do
        expect(dec_repr_senior_coding.solution(123456789)).to eq 987654321
      end
    end
  end
end