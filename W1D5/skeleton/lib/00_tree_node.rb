# Build a tree from the top-down with these PTNs
class PolyTreeNode

  attr_reader :value, :children, :parent

  def initialize(value = nil)
    @value = value
    @children = []
    @parent = nil
  end

  # adds ourself (the child) to the parent's array of
  # children
  def parent=(new_parent_node)
    orphan_me
    @parent = new_parent_node
    unless @parent.nil?
      siblings = @parent.children
      siblings << self unless siblings.include?(self)
    end
  end

  def orphan_me
    @parent.children.reject! { |child| child == self } unless @parent.nil?
  end

  def add_child(new_child_node)
    new_child_node.parent = self
  end

  def remove_child(old_child_node)
    if @children.include?(old_child_node)
      old_child_node.orphan_me
      old_child_node.parent = nil
    else
      raise "There is no parent."
    end
  end

  # dfs: value => PTN
  def dfs(target_value)
    # base case
    return self if @value == target_value
    # iterative case
    @children.each do |child|
      result = child.dfs(target_value)
      return result if result
    end
    nil
  end

  # bfs: value => PolyTreeNode
  def bfs(target_value)
    queue = [self]
    until queue.empty?
      checkme = queue.shift
      return checkme if checkme.value == target_value
      queue.concat(checkme.children)
    end
    nil

  end

end
