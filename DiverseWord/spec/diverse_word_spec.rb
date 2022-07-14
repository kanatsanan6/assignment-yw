require 'diverse_word'

class DiverseWordHeler
  attr_accessor :a, :b, :c, :ans

  def correct?(a, b, c, ans)
    return false if ans.count('a') > a or ans.count('b') > b or ans.count('c') > c

    count = 1
    last_index = 0
    (1..ans.length).to_a.each do |index|
      if ans[last_index] == ans[index]
        count += 1
      else
        return false if count > 2

        count = 1
        last_index = index
      end
    end

    true
  end
end

describe DiverseWord do
  let(:instance) { described_class.new }
  let(:diverse_helper) { DiverseWordHeler.new }

  describe 'solution' do
    context 'example testcase' do
      it 'returns answer with 8 characters' do
        result = instance.solution(6, 1, 1)
        expect(result.length).to eq 8
        expect(diverse_helper.correct?(6, 1, 1, result)).to eq true
      end

      it 'returns answer with 5 characters' do
        result = instance.solution(1, 3, 1)
        expect(result.length).to eq 5
        expect(diverse_helper.correct?(1, 3, 1, result)).to eq true
      end

      it 'returns answer with 5 characters' do
        result = instance.solution(0, 1, 8)
        expect(result.length).to eq 5
        expect(diverse_helper.correct?(0, 1, 8, result)).to eq true
      end
    end

    context 'a, b, c are less than 2' do
      it 'returns answer with 3 characters' do
        result = instance.solution(1, 1, 1)
        expect(result.length).to eq 3
        expect(diverse_helper.correct?(1, 1, 1, result)).to eq true
      end
    end

    context '2 of them are zero' do
      it 'returns answer with 2 characters' do
        result = instance.solution(3, 0, 0)
        expect(result.length).to eq 2
        expect(diverse_helper.correct?(3, 0, 0, result)).to eq true
      end
      it 'returns answer with 2 characters' do
        result = instance.solution(0, 3, 0)
        expect(result.length).to eq 2
        expect(diverse_helper.correct?(0, 3, 0, result)).to eq true
      end
      it 'returns answer with 2 characters' do
        result = instance.solution(0, 0, 3)
        expect(result.length).to eq 2
        expect(diverse_helper.correct?(0, 0, 3, result)).to eq true
      end
    end

    context '1 of them are zero' do
      it 'returns answer with 6 characters' do
        result = instance.solution(0, 3, 3)
        expect(result.length).to eq 6
        expect(diverse_helper.correct?(0, 3, 3, result)).to eq true
      end
      it 'returns answer with 6 characters' do
        result = instance.solution(3, 0, 3)
        expect(result.length).to eq 6
        expect(diverse_helper.correct?(3, 0, 3, result)).to eq true
      end
      it 'returns answer with 6 characters' do
        result = instance.solution(3, 3, 0)
        expect(result.length).to eq 6
        expect(diverse_helper.correct?(3, 3, 0, result)).to eq true
      end
    end

    context 'a, b, c are almost similar' do
      it 'returns answer with 6 characters' do
        result = instance.solution(1, 2, 3)
        expect(result.length).to eq 6
        expect(diverse_helper.correct?(1, 2, 3, result)).to eq true
      end
    end

    context 'one of them is big' do
      it 'returns answer with 14 characters' do
        result = instance.solution(100, 2, 2)
        expect(result.length).to eq 14
        expect(diverse_helper.correct?(50, 2, 2, result)).to eq true
      end
    end

    context 'one fixed letter' do
      it 'returns answer with 14 characters' do
        b = 2
        c = 2
        a = 2 * (b + c) + 2
        result = instance.solution(a, b, c)
        expect(result.length).to eq 14
        expect(diverse_helper.correct?(a, b, c, result)).to eq true
      end
    end

    context 'almost one fixed letter' do
      it 'returns answer with 12 characters' do
        b = 2
        c = 2
        a = 2 * (b + c) + 2 - 1
        result = instance.solution(a, b, c)
        expect(result.length).to eq 13
        expect(diverse_helper.correct?(a, b, c, result)).to eq true
      end
    end
  end
end