puts "How many employees will be processed?"
applicants = gets.chomp.to_i

i = 0

def survey
  puts "What is your name?"
  their_name = gets.chomp

  puts "How old are you?"
  age = gets.chomp

  puts "What year were you born?"
  birth_year = gets.chomp

  puts "Would you like some garlic bread? (y/n)"
  gar_bread = gets.chomp

  puts "Would you like to enroll in the company Health Plan? (y/n)"
  health = gets.chomp

  result = ""

  if age.to_i == (2017 - birth_year.to_i)
    age = true
  else
    age = false
  end

  if health == "y"
    health = true
  elsif health == "n"
    health = false
  else
    puts ""
    puts "You didn't give an appropriate answer to the health plan question."
  end

  if gar_bread == "y"
    gar_bread = true
  elsif gar_bread == "n"
    gar_bread = false
  else
    puts ""
    puts "You didn't give an appropriate answer to the garlic bread question."
  end


  ######

  case
  when age && gar_bread && health
    result = "Probably not a vamp"
  when !age && (!gar_bread || !health)
    result = "Probably a vamp"
  when !age && !gar_bread && !health
    result = "Almost certainly a vamp"
  when their_name == "Drake Cula" || their_name == "Tu Fang"
   result = "Definitely a vampire"
  else
   result = "Something's gone awry"
  end

  puts ""
  puts "Report for #{their_name}:"
  puts "Age correct? #{age}"
  puts "Wants garlic bread? #{gar_bread}"
  puts "Wants to enroll? #{health}"

  puts "Result of survey is: #{result}"
  puts ""
end

while i < applicants
  survey
  i += 1
end