class DiverseWord
  attr_accessor :a, :b, :c

  def solution(a, b, c)
    result = []
    remain_char = { 'a' => a, 'b' => b, 'c' => c }.sort_by { |_, value| -value }.to_h
    start, stop = remain_char.keys.first(2)
    while remain_char[start].positive? && remain_char[stop].positive?
      result << start
      remain_char[start] -= 1

      if remain_char[start] > 0 && (result.length < 2 or result[-2] != start)
        result << start
        remain_char[start] -= 1
      end

      result << stop
      remain_char[stop] -= 1

      remain_char = remain_char.sort_by { |_, value| -value }.to_h
      (start, _), (stop, _) = remain_char.first 2

    end

    if remain_char[start] > 0
      result << start
      remain_char[start] -= 1
      if remain_char[start] > 0
        result << start
      end
    end
    result.join
  end
end
