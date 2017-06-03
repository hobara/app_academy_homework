require_relative '../skeleton/lib/00_tree_node'

class KnightPathFinder
  attr_reader :start_pos

  def initialize(start_pos)
    @start_pos = start_pos
    @visited_pos = [start_pos]
    build_move_tree
  end

  def build_move_tree
    @root_node = PolyTreeNode.new(start_pos)
    queue = [@root_node]
    until queue.empty?
      current_node = queue.shift
      new_move_positions(current_node.value).each do |next_pos|
        next_node = PolyTreeNode.new(next_pos)
        current_node.add_child(next_node)
        queue << next_node
      end
    end
  end

  def new_move_positions(pos)
    all_move_options = self.class.valid_moves(pos)
    move_options = all_move_options.reject { |move| @visited_pos.include?(move) }
    move_options.each { |move| @visited_pos << move }
  end

  def find_path(end_pos)
    if @visited_pos.include?(end_pos)
      end_node = @root_node.dfs(end_pos)
      trace_path_back(end_node)
    else
      raise "It seems you can not reach there."
    end
  end

  def trace_path_back(end_node)
    trace = [end_node.value]
    parent_node = end_node.parent
    until parent_node == nil
      trace << parent_node.value
      parent_node = parent_node.parent
    end
    trace.reverse
  end

  DELTA = [
  [1, 2],[2, 1],[2, -1],[1, -2],
  [-1, -2],[ -2, -1],[-2, 1],[-1, 2]]

  def self.valid_moves(pos)
    possible_moves = []
    valid_moves = []
    x, y = pos
    DELTA.each do |delta|
      dx, dy = delta
      possible_moves << [x + dx, y + dy]
    end
    possible_moves.each do |move|
      valid_moves << move if valid?(move)
    end
    valid_moves
  end

  def self.valid?(pos)
    pos.first.between?(0, 8) && pos.last.between?(0, 8)
  end

end

if __FILE__ == $PROGRAM_NAME
  kpf = KnightPathFinder.new([0, 0])
  p kpf.find_path([7, 6]) # => [[0, 0], [1, 2], [2, 4], [3, 6], [5, 5], [7, 6]]
  p kpf.find_path([6, 2]) # => [[0, 0], [1, 2], [2, 0], [4, 1], [6, 2]]
end
