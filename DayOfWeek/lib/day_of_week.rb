class DayOfWeek
  attr_accessor :day, :num

  def solution(day, num)
    num = num % 7
    days = ['Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun']
    day_index = days.find_index { |e| e == day }
    days[(day_index + num) % 7]
  end
end
