def mergesort(a)
  # if the array size is 0|1 then the list is considered sorted, return sorted array
  return a if a.length < 2
  # split the list into two halves
  left, right = split_array(a)
  # merge sort each half
  left = mergesort(left)
  right = mergesort(right)
  # combine the sorted halves
  combine(left, right)
end

def split_array(a)
  middle = a.length/2
  left = a[0,middle]
  right = a[middle..-1]
  return left, right
end

# precondition: a and b are sorted
def combine(a, b)
  sorted_array = []
  first_left = a.first
  first_right = b.first
  until a.empty? || b.empty?
    # push the smaller element onto the result array
    if first_left < first_right
      sorted_array << first_left
      a.shift
    else
      sorted_array << first_right
      b.shift
    end
    first_left = a.first
    first_right = b.first
  end

  sorted_array += b if a.empty?
  sorted_array += a if b.empty?
  sorted_array
end

# TEST IT
a = [6,23,53,1,2,5,62,61,33,21,14,6,23]
a = a.shuffle
puts "ORIGINAL \n" + a.to_s
a = mergesort(a)
puts "AFTER MERGESORT \n" + a.to_s
