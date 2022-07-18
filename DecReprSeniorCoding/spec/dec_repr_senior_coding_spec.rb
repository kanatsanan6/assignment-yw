require 'dec_repr_senior_coding'

describe DecReprSeniorCoding do
  let(:instance) { described_class.new }

  describe 'correctness test' do
    context 'example testcase' do
      it 'returns 213' do
        expect(instance.solution(213)).to eq 321
      end

      it 'returns 553' do
        expect(instance.solution(553)).to eq 553
      end
    end

    context 'simple case' do
      it 'returns 1234' do
        expect(instance.solution(1234)).to eq 4321
      end

      it 'returns 1001' do
        expect(instance.solution(1001)).to eq 1100
      end
      
      it 'returns 9879' do
        expect(instance.solution(9879)).to eq 9987
      end
    end

    context 'two digits' do
      it 'returns 89' do
        expect(instance.solution(89)).to eq 98
      end
    end

    context 'large' do
      it 'returns 123456789' do
        expect(instance.solution(123456789)).to eq 987654321
      end
    end

    context 'nothing changes' do
      it 'returns 7421' do
        expect(instance.solution(7421)).to eq 7421
      end
    end
  end
end
