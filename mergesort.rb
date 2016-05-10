def mergesort(a)
    # if the array size is 0|1 then the list is considered sorted, return sorted array
    if a.length < 2
      return a
    end
    # split the list into two halves
    left, right = split_array(a) #if odd, put one less element on the left
    # merge sort each half
    #puts "left is: #{left}"
    #puts "right is: #{right}"
    left = mergesort(left)
    right = mergesort(right)
    #puts "sorted left is: #{left}"
    #puts "sorted right is: #{right}"
    # combine the sorted halves
    combine(left, right)
end

def split_array(a)
    # find the middle index
    m = ((a.length)/2)-1 #will return integer ... 5/2 = 2.5 => 2
    # split the array in half - take a look at take and drop in the ruby docs, or use ranges
    l = a[0..m]
    r = a[(m+1)..a.length]
    # return left and right halves of array as separate arrays - did you know a method can return multiple arrays? look it up
    return l, r
end

# precondition: a and b are sorted
def combine(a, b)
    # create a results array
    results = []
    # counters pointing to the index of the smallest elements in each array
    ai = 0
    bi = 0
    # check that we have elements to compare
        # push the smaller element onto the result array

    #a#4,6,8  #b#3,5,7
    while ai < a.length && bi < b.length
      if a[ai] < b[bi]
        results << a[ai]
        ai = ai + 1
      else
        results << b[bi]
        bi = bi + 1
      end
    end
    # if there are elements left over in a, move them to result
    # if there are elements left over in b, move them to result
    if ai < a.length
      results << a[ai..a.length]
    elsif
      results << b[bi..b.length]
    end

    return results.flatten!
end

# TEST IT
a = [6,23,53,1,2,5,62,61,33,21,14,6,23]
a = a.shuffle
puts "ORIGINAL \n" + a.to_s
a = mergesort(a)
puts "AFTER MERGESORT \n" + a.to_s
