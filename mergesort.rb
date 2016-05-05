def mergesort(a)
    # if the array size is 0|1 then the list is considered sorted, return sorted array
    return a if a.length == 0 || a.length == 1
    # split the list into two halves
    first_half, second_half = split_array(a)
    # merge sort each half
    first_half = mergesort(first_half)
    second_half = mergesort(second_half)
    # combine the sorted halves
    combine(first_half, second_half)
end

def split_array(a)
    # find the middle index
    midpoint = a.length / 2
    # split the array in half - take a look at take and drop in the ruby docs, or use ranges
    first_half = a[0...midpoint]
    second_half = a[midpoint..-1]
    # return left and right halves of array as separate arrays - did you know a method can return multiple arrays? look it up
    return first_half, second_half
end

# precondition: a and b are sorted
def combine(a, b)
    # create a results array
    result = []
    final_length = a.length + b.length
    until result.length == final_length
      first = a.shift
      second = b.shift        # binding.pry
      # check that we have elements to compare
        if first.nil?
          result << second
        elsif second.nil?
          result << first
        elsif first < second
        # push the smaller element onto the result array
          result << first
          b.unshift(second)
        else
          result << second
          a.unshift(first)
        end
    end
    result
end


# TEST IT
a = [6,23,53,1,2,5,62,61,33,21,14,6,23]
a = a.shuffle
puts "ORIGINAL \n" + a.to_s
a = mergesort(a)
puts "AFTER MERGESORT \n" + a.to_s
