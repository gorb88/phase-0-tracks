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
$user_id = 0

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
  $user_id = $user_id[0][0]
end

def sleep(db, user_id)
  puts "How many days would you like to sleep?"
  days = gets.chomp.to_i
  days.times {|i| increment_day(db, $user_id)}
  puts "You slept for #{days} days."
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
  day[0][0]
end


def status(db, user_id)
  puts "\n"
  puts "Day #{get_day(db, user_id)}"
  puts "#{get_gold(db, user_id)}g"
  puts "User#: #{user_id}"
  puts "\n"
end

def set_gold(db, user_id, gold)
  db.execute("UPDATE farmer SET gold = ? WHERE id = ?", [gold, user_id])
end

def get_gold(db, user_id)
  gold = db.execute("SELECT gold FROM farmer WHERE id = ?", [user_id])
  gold[0][0]
end

def shop(db, user_id)
  puts "What would you like to buy?"
  puts "#{get_gold(db, $user_id)}g"

end

def driver(db)
  start_game(db)
  new_day(db, $user_id)
  while true
    status(db, $user_id)
    puts "What would you like to do?"
    puts "Options:"
    puts "1 | sleep"
    puts "2 | exit"
    puts "3 | shop"
    puts "\n"
    input = gets.chomp
    case
      when input == "sleep" || input == "1"
        sleep(db, $user_id)
      when input == "exit" || input == "2"
        break
      when input == "shop" || input == "3"
       shop(db, $user_id)
    else
     end
   end
end

driver(db)


