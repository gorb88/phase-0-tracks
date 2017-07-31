# Example of method that takes a block
# def practice_method
#   puts "Message before running block"
#   yield("variable")
# end

# practice_method {|x| puts x.reverse}

array = ["apple","orange","banana","grapes"]

orange = {
  "shape:" => " spherical",
  "color:" => " orange",
  "flavor:" => " sweet",
  "smell:" => " citrusy",
  "seeds:" => " yeah"
}

#Using .each and .map! on an array/hash
p array
array.each {|x| puts x}

p orange
orange.each {|x1,x2| puts x1 + x2}


# Using .map! on an array
p array

array.map! {|x| x.upcase}

p array

#Release 2
# Delete any items that meet a certain condition
numbers = ["1","2","3","4","5","6","7","8","9","10"]

p numbers
numbers.delete_if {|x| x.to_i.odd?}
p numbers

numbers_hash = {
  "number1" => 1,
  "number2" => 2,
  "number3" => 3,
  "number4" => 4,
  "number5" => 5,
  "number6" => 6
}

p numbers_hash
numbers_hash.delete_if {|x1,x2| x2.odd?}
p numbers_hash

# Filters a data structure for only item that do satisfy a certain condition

words = ["slime","sludge","ooze"]

p words
words.select! {|x| x[0]=="s"}
p words

words_hash = {
  "word1" => "pumpkin",
  "word2" => "potato",
  "word3" => "tomato",
  "word4" => "pickles",
  "word5" => "tickles",
  "word6" => "hotcrossbuns"
}

p words_hash
words_hash.select! {|x1,x2| x2[0]=="p"}
p words_hash

#A different method that filers a data structure for only items satisfying a certian condition

colors = ["blue","green","orange","red","yellow","teal","gray"]

p colors
colors.keep_if {|x| x.length >= 4}
p colors

colors_hash = {
  "colors1" => "blue",
  "colors2" => "green",
  "colors3" => "orange",
  "colors4" => "red",
  "colors5" => "yellow",
  "colors6" => "gray"
}

p colors_hash
colors_hash.keep_if {|x1,x2| x2.length >=4}
p colors_hash

#A method that will remove items from a data structure until the condtion in the block evaulates to false, then stops.

p colors
p colors.drop_while {|x| x != "orange"}

p colors_hash
p colors_hash.drop_while {|x, y| y != "yellow"}