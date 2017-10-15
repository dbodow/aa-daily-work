require 'byebug'

class Node
  attr_accessor :key, :val, :next, :prev

  def initialize(key = nil, val = nil)
    @key = key
    @val = val
    @next = nil
    @prev = nil
  end

  def to_s
    "#{@key}: #{@val}"
  end

  def remove
    # optional but useful, connects previous link to next link
    # and removes self from list.
    @prev.next = @next unless @prev.nil?
    @next.prev = @prev unless @next.nil?
  end
end

class LinkedList
  include Enumerable

  def initialize
    @head = nil
    @tail = nil
  end

  def [](i)
    each_with_index { |link, j| return link if i == j }
    nil
  end

  def first
    @head
  end

  def last
    @tail
  end

  def empty?
    @head == nil
  end

  def get(key)
    each do |node|
      return node.val if node.key == key
    end
    nil
  end

  def include?(key)
    any?{|node| node.key == key}
  end

  def append(key, val)
    appendme = Node.new(key,val)

    if @head.nil?
      @head = appendme
      @tail = appendme
      return
    end
    #@head = appendme if @head.nil?
    @tail.next = appendme
    appendme.prev = @tail
    @tail = appendme
  end

  def update(key, val)
    each do |node|
      if node.key == key
        node.val = val
        return true
      end
    end
    false
  end

  def remove(key)
    each do |node|
      if node.key == key
        node.remove
        @head = node.next if @head == node
        @tail = node.prev if @tail == node
        return true
      end
    end
    false
  end

  def each(&blk)
    #byebug
    current = @head
    until current.nil?
      blk.call(current)
      current = current.next
    end
  end

  # uncomment when you have `each` working and `Enumerable` included
  # def to_s
  #   inject([]) { |acc, link| acc << "[#{link.key}, #{link.val}]" }.join(", ")
  # end
end
