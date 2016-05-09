# precondition: a and b are sorted
def combine(a, b)
   result = []

   while a.size > 0 && b.size > 0
     result << if a[0] <= b[0]
       a.shift
     else
       b.shift
     end
   end

   result.concat(a).concat(b)
end





# def combine(a, b)
#   print a
#   # create a results array
#   results_array = []
#   # counters pointing to the index of the smallest elements in each array
#   while a.size > 0 && b.size > 0
#     if a.shift < b.shift
#
#       results_array << a
#     else
#       results_array << b
#     end
#   results_array
#   end
#   # check that we have elements to compare
#   # push the smaller element onto the result array
#   # if there are elements left over in a, move them to result
#   # if there are elements left over in b, move them to result
# end


def split_array(a)
  # find the middle index
  # a.each_slice( (a.size/2.0).round ).to_a
  # split the array in half - take a look at take and drop in the ruby docs, or use ranges
  # return left and right halves of array as separate arrays - did you know a method can return multiple arrays? look it up
  left, right = a.each_slice((a.size/2.0).round).to_a

  return  left, right

end

def mergesort(a)
  # if the array size is 0|1 then the list is considered sorted, return sorted array
  if a.length == 0 || a.length == 1
    return a
  else
    # split the list into two halves
    l, r = split_array(a)  #if odd i put on less element on the left
    # merge sort each half
    l = mergesort(l)
    r = mergesort(r)
    # combine the sorted halves create a new array
    combine(l,r)
  end
end

# TEST IT
a = [6,23,53,1,2,5,62,61,33,21,14,6,23]
a = a.shuffle
puts "ORIGINAL \n" + a.to_s
a = mergesort(a)
puts "AFTER MERGESORT \n" + a.to_s
