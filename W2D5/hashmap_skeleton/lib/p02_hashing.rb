class Fixnum
  # Fixnum#hash already implemented for you
end

class Array
  def hash
    hasharr = self.flatten
    weighted_sum = 0
    hasharr.each_with_index do |el, idx|
      weighted_sum += el.to_s.ord * (idx+1)
    end
    weighted_sum.hash
  end
end

class String
  def hash
    chars.hash
  end
end

# class Symbol
#
#   def hash
#     to_s.hash
#   end
# end

class Hash
  # This returns 0 because rspec will break if it returns nil
  # Make sure to implement an actual Hash#hash method

  def hash
    #keys.concat(values).hash
    sums = 0
    each do |k,v|
      sums += [k,v].hash
    end
    sums.hash
  end
end
