class CheapLetterDeletion
  attr_accessor :string, :costs

  def solution(string, costs)
    ans = 0
    last_index = 0
    (1..string.length).to_a.each do |index|
      if string[last_index] != string[index]
        last_index = index
        next
      end
      if costs[last_index] <= costs[index]
        ans += costs[last_index]
        last_index = index
      else
        ans += costs[index]
      end
    end
    ans
  end
end
