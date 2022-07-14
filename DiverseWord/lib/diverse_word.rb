class DiverseWord
  attr_accessor :a, :b, :c

  def solution(a, b, c)
    result = []
    remain_char = { 'a': a, 'b': b, 'c': c }.sort_by { |_, value| -value }.to_h
    (start, _), (stop, _) = remain_char.first 2
    while remain_char[start].positive? and remain_char[stop].positive?
      result << start
      remain_char[start] -= 1

      if result.length >= 2 and result[-2] == start
        # do nothing
      elsif remain_char[start] > 0
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
    result.join('')
  end
end
