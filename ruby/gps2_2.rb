#grocery list program

# Method to create a list
# input: string of items separated by spaces (example: "carrots apples cereal pizza")
# steps:
  # define empty hash "grocery list"
  # set default quantity
  # parse input into individual k/v pairs with default quantity
    #slice string into array
      #where each item has unique index number
    #iterate through array
      #so that each indexed item is a new key in grocery list hash
      #with values set to default quantity
  # print the list to the console [can you use one of your other methods here?]
# output: hash with user input keys and values set as default quantity


def grocery_list(items)

  grocery_list_hash = {}
  items = items.split(" ")
  items.each do |item|
    #grocery_list_hash.store(item, default_quantity)
    grocery_list_hash[item] = 1
  end
  grocery_list_hash
end

p grocery_list("carrots apples cereal pizza")

# Method to add an item to a list
# input: list, item name, and optional quantity
# steps:
  #define method that takes 3 arguments
    #arguments list, item name, optional quanitity
    #add new key value pair to the list hash
      #where the key is the item name
      #and the value is the optional quantity, or default quantity
# output: old hash with new key/value pair

# Method to remove an item from the list
# input: list, item name
# steps:
  #define method that takes two arguments
    #arguments are list, item name
    #search list for item name key
    #delete matching key/value pair
# output: old hash with identified key/value pair removed

# Method to update the quantity of an item
# input: list, item name, quantity
# steps:
  #define method that takes 3 arguments
    #arguments list, item name, quanitity
    #update key/value pair in list hash
      #key is item name
      #value is updated quantity
# output: old hash with updated quantity for identified k/v pair

# Method to print a list and make it look pretty
# input: list
# steps:
  #print "Grocery list:"
  #iterate each k/v pair in list
    #convert sym to string
    #add "x" for times before each integer
    #print each k/v pair

# output: list? nil?