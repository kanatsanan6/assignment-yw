class DecReprSeniorCoding
  attr_accessor :num

  def solution(num)
    num.to_s.split('').sort.reverse.join.to_i
  end
end