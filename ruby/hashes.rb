

#Define method that asks for data, returns hash
  #define hash variable
  #series of gets, adding to hash
  #return hash

#Define method that takes hash and converts data appropriately,
  #access each key value, converting appropriately
  #return hash

#Define method that parses y/n

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
  #clean
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


def convert_to_bool(value)
  if value == "y"
    value = true
  elsif value == "n"
    value = false
  end
  return value
end


def clean(data)
  data[:age] = data[:age].to_i
  data[:size] = data[:size].to_i
  data[:flagged] = convert_to_bool(data[:flagged])
  data[:important] = convert_to_bool(data[:important])
  return data
end

def update(data)
  puts "If you would like to update a value, enter the desired key, otherwise enter \"none\""
  key = gets.chomp
  if key == "none"
    return data
  else
    puts "Enter the new value:"
    data[key.to_sym] = gets.chomp
    return data
  end
end

#driver

data = build_hash
data = clean(data)
puts data
data = update(data)
data = clean(data)
puts data