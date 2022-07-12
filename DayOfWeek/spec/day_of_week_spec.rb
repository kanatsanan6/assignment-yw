require 'day_of_week'

describe DayOfWeek do
  let(:instance) { described_class.new }

  describe 'solution' do
    context 'given day and number' do
      it 'returns correct day of same week' do
        day = DayOfWeek.new
  
        expect(day.solution('Mon', 0)).to eq 'Mon'
        expect(day.solution('Mon', 1)).to eq 'Tue'
        expect(day.solution('Mon', 2)).to eq 'Wed'
        expect(day.solution('Mon', 3)).to eq 'Thu'
        expect(day.solution('Mon', 4)).to eq 'Fri'
        expect(day.solution('Mon', 5)).to eq 'Sat'
        expect(day.solution('Mon', 6)).to eq 'Sun'
      end
  
      it 'return correct day of next week' do
        day = DayOfWeek.new
  
        expect(day.solution('Mon', 7)).to eq 'Mon'
        expect(day.solution('Mon', 8)).to eq 'Tue'
        expect(day.solution('Mon', 9)).to eq 'Wed'
        expect(day.solution('Mon', 10)).to eq 'Thu'
        expect(day.solution('Mon', 11)).to eq 'Fri'
        expect(day.solution('Mon', 12)).to eq 'Sat'
        expect(day.solution('Mon', 13)).to eq 'Sun'
        expect(day.solution('Mon', 14)).to eq 'Mon'
      end
    end
  end

end
