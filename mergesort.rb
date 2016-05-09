def mergesort(a)
    # if the array size is 0|1 then the list is considered sorted, return sorted array
    return a if a.length == 0 || a.length == 1
    # split the list into two halves
    left, right = split_array(a)  #if odd, one less element on the left
    # merge sort each half
    left = mergesort(left)
    right = mergesort(right)
    combine(left, right)
end

def split_array(a)  #helper method*****
    # find the middle index
    left_count = a.length/2
    #right_count = a.length - left_count
    left_side = a.take(left_count)
    # split the array in half - take a look at take and drop in the ruby docs, or use ranges
    right_side = a.drop(left_count)
    # return left and right halves of array as separate arrays - did you know a method can return multiple arrays? look it up
    return right_side, left_side
end

# precondition: a and b are sorted
def combine(a, b)
  #Do NOT call .sort
  #no .min, use .first
    # create a results array
    result_array = []
    # counters pointing to the index of the smallest elements in each array
    # check that we have elements to compare
    #return false if a.length != b.length
    until a.empty? || b.empty?

      a_min_index = a.first
      b_min_index = b.first

      if a_min_index < b_min_index
        result_array << a.shift

      else
        result_array << b.shift
      end

        # push the smaller element onto the result array
    end

    result_array += a if b.empty?
    result_array += b if a.empty?

    #if one array has more number than the other, i'll need to comtinue comparing those elements within the array
    return result_array
    # if there are elements left over in a, move them to result
    # if there are elements left over in b, move them to result
end

# TEST IT
a = [6,23,53,1,2,5,62,61,33,21,14,6,23]
a = a.shuffle
puts "ORIGINAL \n" + a.to_s
a = mergesort(a)
puts "AFTER MERGESORT \n" + a.to_s
