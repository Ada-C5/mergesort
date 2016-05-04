def mergesort(a)
    # if the array size is 0|1 then the list is considered sorted, return sorted array
    if a.length <= 1
        return a
    end

    # split the list into two halves
    left, right = split_array(a) # if odd, I put one less element on the left

    # merge sort each half
    left = mergesort(left)
    right = mergesort(right)

    # combine the sorted halves
    combine(left, right)
end

def split_array(a)
    # find the size of the left split
    size_left = a.length / 2

    # split the array in half - take a look at take and drop in the ruby docs, or use ranges
    left = a.take(size_left)
    right = a.drop(size_left)

    # return left and right halves of array as separate arrays - did you know a method can return multiple arrays? look it up
    return left, right
end

# precondition: a and b are sorted
def combine(a, b)
    # create a results array
    results = []

    # check that we have elements to compare
    until a.empty? || b.empty?

        # push the smaller element onto the result array
        if a.first < b.first
            results << a.shift
        elsif a.first > b.first
            results << b.shift
        else
            results << a.shift
            results << b.shift
        end
    end

    # if there are elements left over in a, move them to result
    results << a.first unless a.empty?

    # if there are elements left over in b, move them to result
    results << b.first unless b.empty?

    results
end

# TEST IT
a = [6,23,53,1,2,5,62,61,33,21,14,6,23]
a = a.shuffle
puts "ORIGINAL \n" + a.to_s
a = mergesort(a)
puts "AFTER MERGESORT \n" + a.to_s
