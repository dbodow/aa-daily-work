

a = [1, 2, 3]
puts a.my_select { |num| num > 1 } == [2, 3]
puts a.my_select { |num| num == 4 } == []
puts a.my_any? { |num| num > 1 } == true
puts a.my_any? { |num| num == 4 } == false
puts a.my_all? { |num| num > 1 } == false
puts a.my_all? { |num| num < 4 } == true
puts [1, 2, 3, [4, [5, 6]], [[[7]], 8]].my_flatten == [1, 2, 3, 4, 5, 6, 7, 8]
a = [ 4, 5, 6 ]
b = [ 7, 8, 9 ]
puts [1, 2, 3].my_zip(a, b) == [[1, 4, 7], [2, 5, 8], [3, 6, 9]]
puts a.my_zip([1,2], [8])   == [[4, 1, 8], [5, 2, nil], [6, nil, nil]]
puts [1, 2].my_zip(a, b)    == [[1, 4, 7], [2, 5, 8]]

a = [ "a", "b", "c", "d" ]
puts a.my_rotate         == ["b", "c", "d", "a"]
puts a.my_rotate(2)      == ["c", "d", "a", "b"]
puts a.my_rotate(-3)     == ["b", "c", "d", "a"]
puts a.my_rotate(15)     == ["d", "a", "b", "c"]
a = [ "a", "b", "c", "d" ]
a.my_join         == "abcd"
a.my_join("$")    == "a$b$c$d"
a.my_join("ww")   == "awwbwwcwwd"

[ "a", "b", "c" ].my_reverse   == ["c", "b", "a"]
[ 1 ].my_reverse               == [1]
[].my_reverse == []

factors(20)==[1,2,4,5,10,20]

puts "bubble_sort!"
puts [1,2,3,2,1].bubble_sort!{|x,y| x <=> y } == [1,1,2,2,3]
puts [].bubble_sort!{|x,y| x <=> y } == []
puts [1].bubble_sort!{|x,y| x <=> y } == [1]

a=[1,2,3,2,1]
b=[]
c=[1]
puts a.bubble_sort{|x,y| x <=> y } == [1,1,2,2,3]
puts a==[1,2,3,2,1]
puts b.bubble_sort{|x,y| x <=> y } == []
puts b==[]
puts c.bubble_sort{|x,y| x <=> y } == [1]
puts c == [1]


puts "substrings"

puts substrings('cat')==['c','a','t','ca','at','cat']
puts substrings('')==[]

puts "subwords"
dict = ['a','ca','at','cat', 'moose', 'mouse', 'tac']
puts subwords("cat", dict) == ['a','ca','at','cat']
puts subwords("", dict) == []
puts subwords("cat",[]) == []
puts subwords('',[]) == []
