class Santa
  attr_reader :ethnicity, :reindeer_ranking
  attr_accessor :gender, :age

  def initialize(gender, ethnicity)
    puts "Initializing Santa instance..."
    @gender = gender
    @ethnicity = ethnicity
    @age = 0
    @reindeer_ranking = ["Rudolph", "Dasher", "Dancer", "Prancer", "Vixen", "Comet", "Cupid", "Donner", "Blitzen"]
  end

  def speak
    puts "Ho, ho, ho! Haaaappy holidays!"
  end

  def eat_milk_and_cookies(cookie)
    puts "That was a good #{cookie}!"
  end

  def celebrate_birthday
    @age += 1
  end

  def get_mad_at(reindeer_name)
    @reindeer_ranking.delete(reindeer_name)
    @reindeer_ranking.push(reindeer_name)
  end
end

def driver
  santas = []
  genders = ["agender", "female", "bigender", "male", "female", "gender fluid", "N/A"]
  ethnicities = ["black", "Latino", "white", "Japanese-African", "prefer not to say", "Mystical Creature (unicorn)", "N/A"]

  600.times do |i|
    santas << Santa.new(genders.sample, ethnicities.sample)
    santas[i].age = rand(140)
    puts "#{santas[i].ethnicity}, #{santas[i].gender}, #{santas[i].age}"
  end

end

driver