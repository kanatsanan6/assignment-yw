class DayOfWeek
  attr_accessor :day, :num
  DAYS = %w[Mon Tue Wed Thu Fri Sat Sun].freeze

  def solution(day, num)
    day_index = DAYS.find_index { |e| e == day }
    DAYS[(day_index + num) % 7]
  end
end
