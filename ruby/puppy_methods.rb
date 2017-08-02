# class Puppy
#   def initialize
#     puts "Initializing new puppy instance ..."
#   end
#
#   def fetch(toy)
#     puts "I brought back the #{toy}!"
#     toy
#   end
#
#   def speak(num)
#     num.times do
#       puts "Woof!"
#     end
#   end
#
#   def roll_over
#     puts "*rolls over*"
#   end
#
#   def dog_years(num)
#     puts num * 7
#   end
#
#   def lick(string)
#     puts "The dog licks #{string}."
#   end
# end
#
# puppy = Puppy.new
# puppy.fetch("ball")
# puppy.speak(3)
# puppy.roll_over
# puppy.dog_years(10)
# puppy.lick("Gordon")



class Computer
  def initialize
    puts "Computer is booting up..."
  end

  def key_press(key)
    puts "You pressed #{key}."
  end

  def adjust_volume(volume)
    if volume == "down"
      puts "You turned down the volume."
    else
      puts "You turned up the volume."
    end
  end
end
computers = {}
50.times do |i|
  computers["computer#{i + 1}"] = Computer.new
end

computers.each do |k,v|
  p k
  v.key_press("D")
  v.adjust_volume("Up")
end

# gordon_computer.key_press("X")
# gordon_computer.adjust_volume("down")
