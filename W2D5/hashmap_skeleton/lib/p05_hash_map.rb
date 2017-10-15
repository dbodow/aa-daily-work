require_relative 'p02_hashing'
require_relative 'p04_linked_list'

class HashMap
  include Enumerable
  attr_reader :count

  def initialize(num_buckets = 8)
    @store = Array.new(num_buckets) { LinkedList.new }
    @count = 0
  end

  def include?(key)
    bucket(key).include?(key)
  end

  def set(key, val)
    #when evaluating update(key,val), update will occur if possible
    #was_updated = bucket(key).update(key, val)
    unless bucket(key).update(key, val)
      @count += 1
      resize! if count > num_buckets
      bucket(key).append(key,val)
    end
  end

  def get(key)
    bucket(key).get(key)
  end

  def delete(key)
    @count -= 1 if bucket(key).remove(key)
    key
  end

  def each(&blk)
    @store.each do |bucket|
      bucket.each do |node|
        blk.call(node.key,node.val)
      end
    end
  end

  #uncomment when you have Enumerable included
  def to_s
    pairs = inject([]) do |strs, (k, v)|
      strs << "#{k.to_s} => #{v.to_s}"
    end
    "{\n" + pairs.join(",\n") + "\n}"
  end

  alias_method :[], :get
  alias_method :[]=, :set

  private

  def num_buckets
    @store.length
  end

  def resize!
    new_bucket_size = @store.length * 2
    #old_store = @store
    doubled_list = Array.new(new_bucket_size) {LinkedList.new}
    @store.each do |bucket|
      bucket.each do |node|
        k = node.key
        v = node.val
        doubled_list[k.hash % new_bucket_size].append(k,v)
      end
    end
    @store = doubled_list
  end

  def bucket(key)
    @store[key.hash % num_buckets]
    # optional but useful; return the bucket corresponding to `key`
  end

  def get_node(key)
    bucket(key).each do |node|
      return node if node.key == key
    end
  end
end
