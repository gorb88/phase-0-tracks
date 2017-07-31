

#swap last name
  #split name
  #reverse array
  #join with space

#change vowels
  #define vowels
  #split name
  #iterate through array, nexting chars that are found in vowels
  #join

#change consonants
  #define consonants
  #split name
  #iterate through array, nexting chars that are found in consonants
  #join

#update: combined consonants and vowel swapping because it worked better that way.
#also used rotate instead for better edge cases

def swap_names(name)
  name = name.split(' ')
  name.reverse!
  name = name.join(' ')
  return name
end


def swap_letters(name)
  vowels = "aeiou".chars
  consonants = "bcdfghjklmnpqrstvwxyz".chars
  name = name.downcase.chars
  name.map! do |x|
    if vowels.include?(x)
      x = vowels[vowels.rotate(-1).index(x)]
    elsif consonants.include?(x)
      x = consonants[consonants.rotate(-1).index(x)]
    elsif x == " "
      x = "\s"
    end
  end
  name = name.join("")
  name = name.split(' ')
  name.map! {|x| x.capitalize}
  name = name.join(' ')
end


continue = true
identities = {}

while continue
  puts "Please enter a name. Type \"quit\" to exit."
  name = gets.chomp
  if name == "quit"
    continue = false
  else
    fake_name = swap_letters(swap_names(name))
    puts fake_name
    identities[name] = fake_name
  end
end

identities.each{|x, y| puts "The alias of " + x + " is " + y}