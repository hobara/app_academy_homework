class PolyTreeNode
  attr_reader :value, :children
  attr_accessor :parent

  def initialize(value, children = [])
    @value = value
    @children = children
    @parent = nil
  end

  def parent= (root)
    unless @parent.nil?
      self.parent.children.delete(self)
    end
    @parent = root
    root.children << self unless @parent.nil? || root.children.include?(self)
  end

  def add_child(child)
    self.children << child unless self.children.include?(child)
    child.parent= (self)
  end

  def remove_child(child)
    if self.children.include?(child)
      self.children.delete(child)
      child.parent = nil
    else
      raise_error
    end
  end

  def dfs(target_value)
    return self if @value == target_value
    @children.each do |child|
      result = child.dfs(target_value)
      return result if result
    end
    nil
  end

  def bfs(target_value)
    queue = [self]
    until queue.empty?
      current_node = queue.shift
      return current_node if current_node.value == target_value
      queue.concat(current_node.children)
    end
    nil
  end

end
