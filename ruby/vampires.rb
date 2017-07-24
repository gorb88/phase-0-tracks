puts "How many employees will be processed?"
applicants = gets.chomp.to_i

i = 0

def allergy_ask

  puts "Please list your allergies, one at a time. Type 'done' to finish."
  allergy = gets.chomp

  until allergy == "sunshine" || allergy == "done"
    puts "What else"
    allergy = gets.chomp!
  end
  if allergy == "sunshine"
    return true
  elsif allergy == "done"
    return false
  else
    return "Something's gone awry in the allergy method"
  end
end

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

  allergy = allergy_ask

  ######

  if age && gar_bread && health
    result = "Probably not a vamp"
  end
  if !age && (!gar_bread || !health)
    result = "Probably a vamp"
  end
  if !age && !gar_bread && !health
    result = "Almost certainly a vamp"
  end
  if their_name == "Drake Cula" || their_name == "Tu Fang" || allergy
   result = "Definitely a vampire"
  end
  if result == ""
    result = "Something's gone awry"
  end

  puts ""
  puts "Report for #{their_name}:"
  puts "Age correct? #{age}"
  puts "Wants garlic bread? #{gar_bread}"
  puts "Wants to enroll? #{health}"
  puts "Allergic to sunshine? #{allergy}"

  puts "Result of survey is: #{result}"
  puts ""
end

while i < applicants
  survey
  i += 1
end

puts "Actually, never mind! What do these questions have to do with anything? Let's all be friends."