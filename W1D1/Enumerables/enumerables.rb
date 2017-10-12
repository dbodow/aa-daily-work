require "byebug"

# This problem set involves implementing out own version of standard
# Array methods
class Array
  # My Each
  #
  # Extend the Array class to include a method named my_each that takes a
  # block, calls the block on every element of the array, and returns the
  # original array. Do not use Enumerable's each ##method.
  # I want to be able to write:
  #
  # # calls my_each twice on the array, printing all the numbers twice.
  # return_value = [1, 2, 3].my_each do |num|
  #   puts num
  # end.my_each do |num|
  #   puts num
  # end
  # # => 1
  #      2
  #      3
  #      1
  #      2
  #      3
  #
  # p return_value  # => [1, 2, 3]
  def my_each
    i = 0
    while i < self.length
      yield(self[i])
      i += 1
    end
    self
  end

  # My Select
  #
  # Now extend the Array class to include my_select th
  # at takes a block and returns a new array containing only elements
  # that satisfy the block. Use your my_each method!
  #
  # Example:
  #
  # a = [1, 2, 3]
  # a.my_select { |num| num > 1 } # => [2, 3]
  # a.my_select { |num| num == 4 } # => []
  def my_select
    selected_values = []
    my_each { |item| selected_values << item if yield(item) }
    selected_values
  end

  # My Reject
  #
  # Write my_reject to take a block and return a new array excluding
  # elements that satisfy the block.
  #
  # Example:
  #
  # a = [1, 2, 3]
  # a.my_reject { |num| num > 1 } # => [1]
  # a.my_reject { |num| num == 4 } # => [1, 2, 3]

  def my_reject
    selected_values = []
    my_each { |item| selected_values << item unless yield(item) }
    selected_values
  end

  #   My Any
  #
  # Write my_any? to return true if any elements of the array satisfy the
  # block and my_all? to return true only if all elements satisfy the block.
  #
  # Example:
  #
  # a = [1, 2, 3]
  # a.my_any? { |num| num > 1 } # => true
  # a.my_any? { |num| num == 4 } # => false
  # a.my_all? { |num| num > 1 } # => false
  # a.my_all? { |num| num < 4 } # => true

  def my_any?
    each do |item|
      return true if yield(item)
    end
    false
  end

  def my_all?
    each do |item|
      return false unless yield(item)
    end
    true
  end

  #   My Flatten
  #
  # my_flatten should return all elements of the array into a new,
  # one-dimensional array. Hint: use recursion!
  #
  # Example:
  #
  # [1, 2, 3, [4, [5, 6]], [[[7]], 8]].my_flatten # => [1, 2, 3, 4, 5, 6, 7, 8]

  def my_flatten
    flattened_array = []
    each do |item|
      if item.class != Array
        flattened_array << item
      else
        #recursevly call my flatten
        item.my_flatten.each { |sub_item| flattened_array << sub_item }
      end
    end
    flattened_array
  end

  #   My Zip
  #
  # Write my_zip to take any number of arguments. It should return a
  # new array containing self.length elements. Each element of the new
  # array should be an array with a length of the input arguments + 1
  # and contain the merged elements at that index. If the size of any
  # argument is less than self, nil is returned for that location.
  #
  # Example:
  #
  # a = [ 4, 5, 6 ]
  # b = [ 7, 8, 9 ]
  # [1, 2, 3].my_zip(a, b) # => [[1, 4, 7], [2, 5, 8], [3, 6, 9]]
  # a.my_zip([1,2], [8])   # => [[4, 1, 8], [5, 2, nil], [6, nil, nil]]
  # [1, 2].my_zip(a, b)    # => [[1, 4, 7], [2, 5, 8]]
  #
  # c = [10, 11, 12]
  # d = [13, 14, 15]
  # [1, 2].my_zip(a, b, c, d) # => [[1, 4, 7, 10, 13], [2, 5, 8, 11, 14]]

  def my_zip(*arr)
    answer = Array.new([])
    each_with_index do |item, index|
      answer[index] = [item]
      arr.each do |elem|
        answer[index] << elem[index]
      end
    end
    answer
  end

  # My Rotate
  #
  # Write a method my_rotate that returns self rotated. By
  # default, the array should rotate by one element. If a negative value is
  # given, the array is rotated in the opposite direction.
  # Example:
  #
  # a = [ "a", "b", "c", "d" ]
  # a.my_rotate         #=> ["b", "c", "d", "a"]
  # a.my_rotate(2)      #=> ["c", "d", "a", "b"]
  # a.my_rotate(-3)     #=> ["b", "c", "d", "a"]
  # a.my_rotate(15)     #=> ["d", "a", "b", "c"]

  def my_rotate(rotation = 1)
    # debugger
    answer = []
    each_with_index { |x, i| answer[i] = x }
    if rotation > 0
      rotation.times { answer.push(answer.shift) }
    elsif rotation == 0
      answer
    else
      rotation.abs.times { answer.unshift(answer.pop) }
    end
    answer
  end

  # My Join
  #
  # my_join returns a single string containing all the elements of the array,
  # separated by the given string separator. If no separator is given,
  # an empty string is used.
  #
  # Example:
  #
  # a = [ "a", "b", "c", "d" ]
  # a.my_join         # => "abcd"
  # a.my_join("$")    # => "a$b$c$d"

  def my_join(separator = '')
    out_str = ''
    each do |x|
      out_str << x
      out_str << separator
    end
    out_str[0..-1 * separator.length]
  end

  # My Reverse
  #
  # Write a method that returns a new array containing all the elements
  # of the original array in reverse order.
  #
  # Example:
  #
  # [ "a", "b", "c" ].my_reverse   #=> ["c", "b", "a"]
  # [ 1 ].my_reverse               #=> [1]

  def my_reverse
    out=[]
    each {|item| out.unshift(item)}

    out
  end

  def bubble_sort!(&prc)
    while !self.sorted?(prc)
      # debugger
      each_with_index do |item, index|
        break if index > self.length - 2
        nxt = self[index + 1]
        self[index], self[index + 1] = nxt, item if prc.call(item, nxt) == 1
      end
    end
    self
  end

  def sorted?(prc)
    each_cons(2){|x,y| return false if prc.call(x,y)==1 }
    true
  end

  def bubble_sort(&prc)
    array_copy=Array.new(self)
    array_copy.bubble_sort!(&prc)

  end

end

#factors(num)
def factors(num)
  factor_array=[]
  (1..num/2).each do |test_factor|
    factor_array << test_factor if (num%test_factor==0)
  end
  factor_array << num
end



def substrings(string)
  out=[]
  (1..string.length).each do |sublength|
    string.chars.each_cons(sublength) do |substring_arr|
      out << substring_arr.join
    end
  end
  out
end

def subwords(word, dictionary)
  substrings(word).select { |str| dictionary.include?(str) }
end
