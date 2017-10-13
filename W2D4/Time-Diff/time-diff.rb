def my_min_aight(arr)
  return nil if arr.empty?
  current_min = arr[0]

  arr[1..-1].each do |el|
    current_min = el if el < current_min
  end
  current_min
end

def my_min_slow(arr)
  return nil if arr.empty?
  current_min = 1.0 / 0.0

  arr.each_index do |idx|
    (0...arr.length).each do |idx2|
      current_min = arr[idx2] if arr[idx2] < current_min
    end
  end
  current_min
end

def largest_contiguous_subsum(arr)
  subs = []
  (0...arr.length).each do |starti|
    (starti...arr.length).each do |endi|
      subs << arr[starti..endi]
    end
  end

  result =subs.map {|s| s.inject(&:+)}

  result.max
end

# def largest_sum_good(arr)
#   return nil if arr.empty?
#   max_sum = arr[0]
#   curr = arr[0]
#   arr[1..-1].each do |el|
#     curr += el
#     if max_sum > curr
#       curr = 0
#       next
#     else
#       max_sum =+ curr
#     end
#   end
#   max_sum
# end

def largest_sum_good(arr)
  return nil if arr.empty?
  return arr.max if arr.all?(&:negative?)
  max_sum = arr[0]
  curr = arr[0]
  arr[1..-1].each do |el|
    if curr + el < 0
      curr = 0
      next
    else
      curr += el
      max_sum = curr if curr > max_sum
    end
  end
  max_sum
end

# list = [2, 3, -6, 7, -6, 7]
# p largest_sum_good(list) # => 8 (from [7, -6, 7])
# list = [-5, -1, -3]
# p largest_sum_good(list) # => 8 (from [7, -6, 7])

def first_anagram?(string, target)
  splitsies = string.chars.permutation.map(&:join)
  splitsies.include?(target)
end

def second_anagram?(string, target)
  string_ch = string.chars
  target_ch = target.chars

  string_ch.each do |char|
    target_idx = target_ch.index(char)
    return false if target_idx.nil?
    target_ch.delete_at(target_idx)
  end

  target_ch.empty?
end

def third_anagram?(string, target)
  sorted1 = string.chars.sort
  sorted2 = target.chars.sort

  sorted1 == sorted2
end

def fourth_anagram?(string, target)
  counter = Hash.new(0)

  string.each_char do |char|
    counter[char] += 1
  end

  target.each_char do |char|
    counter[char] -= 1
  end

  counter.values.all?(&:zero?)
end

def bad_two_sum?(arr, target_sum)
  i = 0
  while i < arr.length
    j = i + 1
    while j < arr.length - 1
      return true if arr[i] + arr[j] == target_sum
      j += 1
    end
    i += 1
  end
  false
end

def okay_two_sum(arr, target_sum)
  original = arr.sort!
  duplicate = original.dup.map {|el| el - target_sum}
  j = -1
  i = 0
  while i < original.length && j < (-1) * original.length
    return true if duplicate[i] + original[j] == 0

    if duplicate[i].abs > original[j].abs
      i += 1
    else
      j -= 1
    end
  end
  false
end

def good_two_sum(arr, target_sum)
  sum_counter = Hash.new {|h,k| h[k] = []}
  arr.each_with_index do |el, idx|
    sum_counter[el] << idx if sum_counter[el].empty?
  end
  arr.each_with_index do |el, idx|
    sum_counter[target_sum - el] << idx
  end
  result = sum_counter.values.map(&:uniq)
  result.any? { |v| v.length > 1 }
end


arr = [0, 1, 5, 7]
p okay_two_sum(arr, 6)
p okay_two_sum(arr, 10)

p good_two_sum(arr, 6)
p good_two_sum(arr, 10)
