def mergesort(a)
    # if the array size is 0|1 then the list is considered sorted, return sorted array
    # split the list into two halves
    if a.length == 1 || a.length == 0
      return a
    end
    left, right = split_array(a) #if odd I put one less element on left
    # merge sort each half
    left = mergesort(left)
    right = mergesort(right)
    # combine the sorted halves
    combine(left, right)
end

def split_array(a)
    # find the middle index
    mid_index = a.length / 2
    # split the array in half - take a look at take and drop in the ruby docs, or use ranges
    left = a.take(mid_index)
    right = a.drop(mid_index)
    # return left and right halves of array as separate arrays - did you know a method can return multiple arrays? look it up
    return left, right
end

# precondition: a and b are sorted
def combine(a, b)
    # create a results array
    result = []

    # check that we have elements to compare
    # if there are elements left over in a, move them to result
    # if there are elements left over in b, move them to result
    while a.size > 0 && b.size > 0
      if a.first <= b.first
        result << a.shift
      else
        result << b.shift
      end
    end
    result.concat(a).concat(b)
end

# TEST IT
a = [6,23,53,1,2,5,62,61,33,21,14,6,23]
a = a.shuffle
puts "ORIGINAL \n" + a.to_s
a = mergesort(a)
puts "AFTER MERGESORT \n" + a.to_s
