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
    corn_seed INT,
    pepper_seed INT,
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


$day = 0
$gold = 0
$user_id = 0

def sleep(db)
  puts "How many days would you like to sleep?"
  days = gets.chomp.to_i
  days.times {|i| new_day}
  puts "You slept for #{days} days."
end

def new_day(db)
  $day += 1
end

def status(db)
  puts "\n"
  puts "Day #{$day}"
  puts "#{$gold}g"
  puts "\n"
end

def start_game(db)
  puts "\n"
  puts "Enter your user name:"
  name = gets.chomp
  name_check = db.execute("SELECT name FROM farmer WHERE name = ?", name)
  if name_check.empty?
    db.execute("INSERT INTO farmer(name, day, gold) VALUES (?, ?, ?)", [name, 0, 200])
    puts "Welcome, #{name}!"
  else
    puts "Welcome back, #{name}!"
  end
  $user_id = db.execute("SELECT id FROM farmer WHERE name = ?", name)
end

def set_gold(db, user_id, gold)
  db.execute("UPDATE farmer SET gold = ? WHERE id = ?", [gold, user_id])
end

def get_gold(db, user_id)
  db.execute("SELECT gold FROM farmer WHERE id = ?", [user_id])
end

def driver(db)
  start_game(db)
  while true
    new_day(db)
    status(db)
    p "!!!"
    p $user_id
    puts $user_id
    print $user_id
    p "!!!"
    puts "What would you like to do?"
    puts "Options:"
    puts "1 | sleep"
    puts "2 | exit"
    puts "\n"
    input = gets.chomp
    case
     when input == "sleep" || input == "1"
      sleep(db)
     when input == "exit" || input == "2"
      break
     end
   end
end

driver(db)
set_gold(db, $user_id, 200)
puts get_gold(db, $user_id)

