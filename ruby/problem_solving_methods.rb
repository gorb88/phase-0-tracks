def search_array(values, search_term)
  i = 0
  index = nil
  values.each do |x|
    if x == search_term
      index = i
    end
    i += 1
  end
  return index
end

arr = [42, 89, 23, 1]
p search_array(arr, 89)

