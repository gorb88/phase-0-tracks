#request and store values

puts "What is the hamster's name?"
hamster_name = gets.chomp

puts "What is the volume level of the hamster? (ie: 1-10)"
volume = gets.chomp.to_i #casting here

puts "What color is the hamster?"
color = gets.chomp

puts "Is the hamster good candidate for adoption? (y/n)"
candidate = gets.chomp

puts "How old is the hamster?"
age = gets.chomp

#check if age is blank, set to nil

if age == ""
  age = nil
else
  age = age.to_i
end

#diy boolean casting

if candidate == "y"
  candidate = true
elsif candidate == "n"
  candidate = false
else
  candidate = nil
end

#print values

puts "The hamster's name is #{hamster_name}."
puts "The hamster's volume is #{volume}."
puts "The hamster's fur color is #{color}."
puts "It is #{candidate} that the hamster is a good candidate for adoption."
puts "The hamster is #{age} years old."
