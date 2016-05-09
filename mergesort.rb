def mergesort(a)
    # if the array size is 0|1 then the list is considered sorted, return sorted array
    return a if a.length < 2
    # split the list into two halves
    left,right = split_array(a)
    # merge sort each half
    left = mergesort(left)
    right = mergesort(right)
    # combine the sorted halves
    combine(left,right)
end

def split_array(a)
  split = a.each_slice((a.length/2.0).round).to_a
  # probs don't need it but meh)
    # find the middle index
    # split the array in half - take a look at take and drop in the ruby docs, or use ranges
    # return left and right halves of array as separate arrays - did you know a method can return multiple arrays? look it up
end

# precondition: a and b are sorted
def combine(a, b)
  result = []

  while a.length > 0 && b.length > 0
    if a[0] < b[0]
      result.push(a.shift)
    else
      result.push(b.shift)
    end
  end
  result += b if b.length > 0
  result += a if a.length > 0
  return result
end
    # create a results array
    # counters pointing to the index of the smallest elements in each array
    # check that we have elements to compare
        # push the smaller element onto the result array
    # if there are elements left over in a, move them to result
    # if there are elements left over in b, move them to result


# TEST IT
a = [6,23,53,1,2,5,62,61,33,21,14,6,23]
a = a.shuffle
puts "ORIGINAL \n" + a.to_s
a = mergesort(a)
puts "AFTER MERGESORT \n" + a.to_s
