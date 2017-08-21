=begin

Features

User selection
Inventory
Plant a garden
Time passage
Buy seeds
Sell crops
plants
  tomatoes
  corn
  peppers
  tomato seeds
  corn seeds
  pepper seeds


Methods

  sleep
  buy seeds
  plant seeds
  update db items
  sell plants




classes
  plant


userinfo
name
day
money
inventory
field




=end

require 'sqlite3'
db = SQLite3::Database.new("farm.db")
db.results_as_hash = true

#initialize dbs

create_farm = <<-SQL
  CREATE TABLE IF NOT EXISTS farmer(
    id INTEGER PRIMARY KEY,
    name VARCHAR(255),
    day INT,
    gold INT
  )
SQL

create_inventory = <<-SQL
  CREATE TABLE IF NOT EXISTS inventory(
    id INTEGER PRIMARY KEY,
    tomatoes INT,
    corn INT,
    peppers INT,
    tomato_seeds INT,
    corn_seeds INT,
    pepper_seeds INT,
    owner_id INT,
    FOREIGN KEY (owner_id) REFERENCES farmer(id)
  )
SQL

create_plot = <<-SQL
  CREATE TABLE IF NOT EXISTS plot(
    id INTEGER PRIMARY KEY,
    plant VARCHAR(255),
    x INT,
    y INT,
    owner_id INT,
    FOREIGN KEY (owner_id) REFERENCES farmer(id)
  )
SQL


db.execute(create_farm)
db.execute(create_inventory)
db.execute(create_plot)

#methods


$user_id = 0

def start_game(db)
  puts "\n"
  puts "Enter your user name:"
  name = gets.chomp
  name_check = db.execute("SELECT name FROM farmer WHERE name = ?", name)
  puts "\n"
  if name_check.empty?
    make_new_user(db, name)
  else
    puts "Welcome back, #{name}!"
  end
  $user_id = db.execute("SELECT id FROM farmer WHERE name = ?", name)
  $user_id = $user_id[0]["id"]
end

def ok
  puts "\nPress any key to continue.\n"
  gets.chomp
end

def make_new_user(db, name)
  db.execute("INSERT INTO farmer(name, day, gold) VALUES (?, ?, ?)", [name, 0, 2000])
    $user_id = db.execute("SELECT id FROM farmer WHERE name = ?", name)
    $user_id = $user_id[0][0]
    db.execute("INSERT INTO inventory(tomatoes, corn, peppers, tomato_seeds, corn_seeds, pepper_seeds, owner_id) VALUES (0, 0, 0, 0, 0, 0, ?)", $user_id)
    puts "Welcome, #{name}!"
end

def sleep(db, user_id)
  puts "How many days would you like to sleep?"
  days = gets.chomp.to_i
  days.times {|i| increment_day(db, $user_id)}
  puts "You slept for #{days} days."
end

def get_item_quantity(db, user_id, item)
  quantity = db.execute("SELECT #{item} FROM inventory WHERE owner_id = ?", user_id)
  quantity[0][item]
end

def set_item_quantity(db, user_id, item, quantity)
  db.execute("UPDATE inventory SET #{item} = ? WHERE id = ?", quantity, user_id)
end

def new_day(db, user_id)
  increment_day(db, user_id)
end

def increment_day(db, user_id)
  day = get_day(db, user_id)
  day += 1
  db.execute("UPDATE farmer SET day = ? WHERE id = ?", [day, user_id])
end

def get_day(db, user_id)
  day = db.execute("SELECT day FROM farmer WHERE id = ?", [user_id])
  day[0]["day"]
end


def status(db, user_id)
  puts "\n"
  puts "Day #{get_day(db, user_id)} | #{get_gold(db, user_id)}g".rjust(15)
  puts "\n"
end

def set_gold(db, user_id, gold)
  db.execute("UPDATE farmer SET gold = ? WHERE id = ?", [gold, user_id])
end

def get_gold(db, user_id)
  gold = db.execute("SELECT gold FROM farmer WHERE id = ?", [user_id])
  gold[0]["gold"]
end

def shop(db, user_id)
  while true
    puts "\n"
    puts "What would you like to buy?"
    status(db, user_id)
    puts "1 | Tomato seeds - 40g"
    puts "2 | Corn seeds - 30g"
    puts "3 | Pepper seeds - 60g"
    puts "x | nothing, take me back"
    shop_selection = gets.chomp

    case shop_selection
      when "1"
        #update inventory
        puts "How many tomato seeds would you like to buy?"
          quantity = gets.chomp.to_i
          cost = quantity * 40
          if price_check(db, user_id, cost)
            set_item_quantity(db, user_id, "tomato_seeds", get_item_quantity(db, user_id, "tomato_seeds") + quantity)
            set_gold(db, user_id, get_gold(db, user_id) - cost)
            puts "\n"
            puts "You bought #{quantity} tomato seeds for #{cost}g"
            puts "You now have #{get_item_quantity(db, user_id, "tomato_seeds")} tomato seeds."
          end
          ok

      when "2"
        #update inventory
        puts "How many corn seeds would you like to buy?"
          quantity = gets.chomp.to_i
          cost = quantity * 30
          if price_check(db, user_id, cost)
            set_item_quantity(db, user_id, "corn_seeds", get_item_quantity(db, user_id, "corn_seeds") + quantity)
            set_gold(db, user_id, get_gold(db, user_id) - cost)
            puts "\n"
            puts "You bought #{quantity} corn seeds for #{cost}g"
            puts "You now have #{get_item_quantity(db, user_id, "corn_seeds")} corn seeds."
          end
          ok

      when "3"
        #update inventory
        puts "How many pepper seeds would you like to buy?"
          quantity = gets.chomp.to_i
          cost = quantity * 60
          if price_check(db, user_id, cost)
            set_item_quantity(db, user_id, "pepper_seeds", get_item_quantity(db, user_id, "pepper_seeds") + quantity)
            set_gold(db, user_id, get_gold(db, user_id) - cost)
            puts "\n"
            puts "You bought #{quantity} pepper seeds for #{cost}g."
            puts "You now have #{get_item_quantity(db, user_id, "pepper_seeds")} pepper seeds."
          end
          ok

      when "x"
        break
      else
        puts "\n"
        puts "That's not an option"
        puts "\n"
        ok
    end
  end
end

def price_check(db, user_id, cost)
  if cost <= get_gold(db, user_id)
    true
  else
    puts "You don't have enough money"
    false
  end
end

def print_inventory(db, user_id)
  db.results_as_hash = false
  inventory = db.execute("SELECT tomatoes, corn, peppers, tomato_seeds, corn_seeds, pepper_seeds FROM inventory WHERE id = ?", [user_id])
  inventory = inventory[0]
  items = ["Tomatoes", "Corn", "Peppers", "Tomato seeds", "Corn seeds", "Pepper seeds"]
  inventory = inventory.zip(items, inventory)
  puts "\n"
  puts "INVENTORY".rjust(15)
  inventory.each do |x|
    puts x[1].to_s.ljust(15) + " | " + x[2].to_s.rjust(3)
  end
  db.results_as_hash = true
  ok
end

def driver(db)
  start_game(db)
  while true
    status(db, $user_id)
    puts "What would you like to do?"
    puts "1 | Shop"
    puts "2 | Sleep"
    puts "3 | Inventory"
    puts "x | Exit"
    puts "\n"
    input = gets.chomp
    case input
      when "1"
        shop(db, $user_id)
      when "2"
       sleep(db, $user_id)
     when "3"
        print_inventory(db, $user_id)
     when "x"
        break
    else
     end
   end
end

driver(db)