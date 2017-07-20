
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
    if password[i] != " "
      password[i] = password[i].next
    end
    i = i + 1
  end
  puts password
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
  puts password

end


decrypt("bcd")
