require 'day_of_week'

describe DayOfWeek do
  let(:day) { described_class.new }

  describe 'solution' do
    context 'sample testcases' do
      it 'returns Fri' do
        expect(day.solution('Wed', 2)).to eq 'Fri'
      end

      it 'returns Mon' do
        expect(day.solution('Sat', 23)).to eq 'Mon'
      end
    end

    context 'same week' do
      it 'returns Mon' do
        expect(day.solution('Mon', 0)).to eq 'Mon'
      end

      it 'returns Wed' do
        expect(day.solution('Tue', 1)).to eq 'Wed'
      end

      it 'returns Thu' do
        expect(day.solution('Wed', 2)).to eq 'Fri'
      end

      it 'returns Sun' do
        expect(day.solution('Thu', 3)).to eq 'Sun'
      end
    end

    context 'next week' do
      it 'returns Mon' do
        expect(day.solution('Mon', 7)).to eq 'Mon'
      end

      it 'returns Wed' do
        expect(day.solution('Tue', 8)).to eq 'Wed'
      end

      it 'returns Thu' do
        expect(day.solution('Wed', 9)).to eq 'Fri'
      end

      it 'returns Sun' do
        expect(day.solution('Thu', 10)).to eq 'Sun'
      end
    end

    context 'big K' do
      it 'returns Thu' do
        expect(day.solution('Fri', 230)).to eq 'Thu'
      end
    end
  end
end
