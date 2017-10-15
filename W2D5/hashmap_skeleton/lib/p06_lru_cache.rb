require_relative 'p05_hash_map'
require_relative 'p04_linked_list'

class LRUCache
  attr_reader :count
  def initialize(max, prc)
    @map = HashMap.new
    @store = LinkedList.new
    @max = max
    @prc = prc
  end

  def count
    @map.count
  end

  def get(key)
    # key.hash is the index you're looking up
    # access map and find the index that would have the element
    # check the linked list at that index to see if its there
  end

  def to_s
    'Map: ' + @map.to_s + '\n' + 'Store: ' + @store.to_s
  end

  private

  def calc!(key)
    # suggested helper method; insert an (un-cached) key
    prc.call(key)
  end

  def update_node!(node)
    # suggested helper method; move a node to the end of the list
    node.remove
    @store.head = node.next if @store.head == node
    @store.tail = node.prev if @store.tail == node
    @store.append(node.key, node.val)
  end

  def eject!
    @store.remove(@store.head.key)
  end
end
