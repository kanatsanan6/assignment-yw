require 'tree_visibility'

describe 'TreeVisibility' do
  describe Tree do
    context 'given binary tree array' do
      it 'returns a correct binary tree structure' do
        tree = Tree.new([])

        expect(tree.x).to eq nil
        expect(tree.l).to eq nil
        expect(tree.r).to eq nil
      end

      it 'returns a correct binary tree structure' do
        tree = Tree.new([5, [3, [20, nil, nil], [21, nil, nil]], [10, [1, nil, nil], nil]])

        expect(tree.x).to eq 5
        expect(tree.l.x).to eq 3
        expect(tree.l.l.x).to eq 20
        expect(tree.l.l.l).to eq nil
        expect(tree.l.l.r).to eq nil
        expect(tree.l.r.x).to eq 21
        expect(tree.l.r.l).to eq nil
        expect(tree.l.r.r).to eq nil
        expect(tree.r.x).to eq 10
        expect(tree.r.l.x).to eq 1
        expect(tree.r.l.l).to eq nil
        expect(tree.r.l.r).to eq nil
        expect(tree.r.r).to eq nil
      end
    end
  end

  describe TreeVisibility do
    let(:instance) { described_class.new }

    context 'example testcase' do
      it 'returns 4' do
        tree = Tree.new([5, [3, [20, nil, nil], [21, nil, nil]], [10, [1, nil, nil], nil]])

        expect(instance.solution(tree)).to eq 4
      end
      it 'returns 2' do
        tree = Tree.new([8, [2, [8, nil, nil], [7, nil, nil]], [6, nil, nil]])

        expect(instance.solution(tree)).to eq 2
      end
    end

    context 'same value' do
      it 'returns 6' do
        tree = Tree.new([1, [1, [1, nil, nil], [1, nil, nil]], [1, [1, nil, nil], nil]])

        expect(instance.solution(tree)).to eq 6
      end
    end

    context 'nagative value' do
      it 'returns 4' do
        tree = Tree.new([-4, [-6, [-2, nil, nil], [-1, nil, nil]], [-3, [-7, nil, nil], nil]])

        expect(instance.solution(tree)).to eq 4
      end
    end

    context 'empty' do
      it 'returns 0' do
        tree = Tree.new([])

        expect(instance.solution(tree)).to eq 0
      end
    end

    context 'single node' do
      it 'return 1' do
        tree = Tree.new([1])

        expect(instance.solution(tree)).to eq 1
      end
    end

    context 'skewed tree' do
      it 'returns 5' do
        tree = Tree.new([-1, [2, [7, [10, nil, nil], [5, nil, nil]], [1, [-2, nil, nil], nil]],
                         [8, [1, nil, nil], nil]])

        expect(instance.solution(tree)).to eq 5
      end
    end

    context 'balanced tree' do
      it 'returns ' do
        tree = Tree.new([-1, [2, [7, [10, nil, nil], [5, nil, nil]], [1, [-2, nil, nil], [-3, nil, nil]]],
                         [8, [1, [3, nil, nil], [4, nil, nil]], [10, [-1, nil, nil], [12, nil, nil]]]])

        expect(instance.solution(tree)).to eq 7
      end
    end
  end
end
