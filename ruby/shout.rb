=begin

module Shout
  def self.yell_angrily(words)
    words + "!!!" + " :("
  end

  def self.yelling_happily(words)
    words.upcase + "!!!" + " :)"
  end

end


p Shout.yell_angrily("Farts")
p Shout.yelling_happily("Woohoo")

=end

module Shout
  def yell_angrily(words)
    words + "!!!" + " :("
  end

  def yelling_happily(words)
    words.upcase + "!!!" + " :)"
  end

end

class Mom
  include Shout
end

class Oldman
  include Shout
end


mom = Mom.new
oldman = Oldman.new

p mom.yell_angrily("Do your homework")
p oldman.yelling_happily("No one around for miles")
