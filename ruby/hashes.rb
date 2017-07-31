

#Define method that asks for data, returns hash
  #define hash variable
  #series of gets, adding to hash
  #return hash

#Define method that takes hash and converts data appropriately,
  #access each key value, converting appropriately
  #return hash

#Define method that updates hash
  #ask if they'd like to update
  #if gets equals a key
    #prompt for change
    #update key
  #return hash



#Driver:
  #define and set variable to hash method call
  #set hash variable to converted hash using convert method
  #print hash
  #run update method
  #print hash


def build_hash

  data ={}

  puts "Enter client name:"
  data[:name] = gets.chomp

  puts "Enter client age:"
  data[:age] = gets.chomp

  puts "Enter decour theme:"
  data[:decour_theme] = gets.chomp

  puts "Enter square footage of decorated space:"
  data[:size] = gets.chomp

  puts "Should this client be flagged for being difficult to work with? (y/n)"
  data[:flagged] = gets.chomp

  puts "Is this client a big spender? (y/n)"
  data[:important] = gets.chomp

  return data

end

data = {}
data = build_hash
puts data