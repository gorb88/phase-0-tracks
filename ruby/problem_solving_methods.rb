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

def fib(terms)
  terms -= 2
  seq = [0,1]
  previous = seq[0]
  current = seq[1]
  terms.times do |x|
    current = current + previous
    seq.push(current)
    previous = seq[-2]
  end
  return seq
end


#pseudocode
#loop from beginning of array to end

  #starting with [0] and [1],
  #set key equal to value at index i
  #set j, the number to the left to be compared to, to i-1
  #until j is 0 and the value at index j is greater than the key
    #move over value at j by setting j+1 to be equal to current j
    #set current j equal to the key
    #deincrement j


def insertion_sort(arr)
  i = 1
  key = 0
  while i < arr.length

    key = arr[i]
    j = i-1;

    while j >= 0 && arr[j] > key

      arr[j+1] = arr[j]
      arr[j] = key
      j = j-1

    end
    i += 1
  end
  return arr
end

arr = [134, 99, 399, 293, 1, 5 ,99 ,5]

p search_array(arr, 293)

p fib(5)

p insertion_sort(arr)