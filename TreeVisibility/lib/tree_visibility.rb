class Tree
  attr_accessor :x, :l, :r, :tree

  def initialize(tree)
    @x = tree[0]
    @l = create_consecutive_tree(tree[1])
    @r = create_consecutive_tree(tree[2])
  end

  private

  def create_consecutive_tree(tree)
    return nil if tree.nil?

    Tree.new(tree)
  end
end

class TreeVisibility
  attr_accessor :tree

  def solution(tree)
    @ans = 0
    visible(tree, tree.x)

    @ans
  end

  private

  def visible(tree, max_now)
    return 0 if tree.nil?
    return 0 if tree.x.nil?

    @ans += 1 if max_now <= tree.x

    max_now = [max_now, tree.x].max
    visible(tree.l, max_now)
    visible(tree.r, max_now)
  end
end
