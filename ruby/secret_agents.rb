
#alphabet = "abcdefghijklmnopqrstuvwxyz"

#encrypt
#initialize counter

# while counter is less than length of input string
  # if indexed letter is not " " then .next
  #increment counter


#decrypt
#initialize counter
#while counter is than length of input string
  # if indexed letter is not " " then
    #find index in alphabet of indexed letter
    #set indexed letter to be that letter minus 1

  #increment counter


$alphabet = "abcdefghijklmnopqrstuvwxyz"

def encrypt(password)
  i = 0
  passlength = password.length
  while i < passlength
    if password[i] == "z"
      password[i] = "a"
    elsif password[i] != " " && password[i] != "z"
      alpha_index = $alphabet.index(password[i])
      password[i] = $alphabet[alpha_index + 1]
    end
    i = i + 1
  end
  #puts password
  return password
end

def decrypt(password)

  i = 0
  while i < password.length
    if password[i] != " "
      alpha_index = $alphabet.index(password[i])
      password[i] = $alphabet[alpha_index - 1]
    end
    i = i + 1
  end
  #puts password
  return password

end


#decrypt(encrypt("swordfish"))
#encrypt takes a string, changes the string, returning the string, which makes the encrypt function evaluate to a new string, that decrypt then manipulates


#ask encrypt or decrypt using gets chomp
#if statement parsing it in value

# ask for password using getschomp

#call appropriate method using password as argument
#puts new password

puts "Would you like to encrypt of decrypt your password?"
answer = gets.chomp!

puts "Enter your password"
password = gets.chomp

if answer == "encrypt"
  puts encrypt(password)
elsif answer == "decrypt"
  puts decrypt(password)
else
  puts "You didn't properly specify encrypt or decrypt"
end