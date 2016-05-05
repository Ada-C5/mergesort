def mergesort(a)
    # base case
    if a.length < 2 && a.length > -1  
      return a 
    end 

    left, right  = split_array(a)  

    left = mergesort(left)
    right = mergesort(right)
    combine(left, right)
end

def split_array(a)

    # if array length is odd 
    if a.length % 2 == 1 
      split_value = a.length / 2 
      left = a.drop(split_value)
      right = a.take(split_value)
      return left, right 
    end  

    # if array length is even
    if a.length % 2 == 0 
      split_value = a.length / 2 
      left = a.drop(split_value)
      right = a.take(split_value)
      return left, right 
    end 
end

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

# TEST IT
a = [6,23,53,1,2,5,62,61,33,21,14,6,23]
a = a.shuffle
puts "ORIGINAL \n" + a.to_s
a = mergesort(a)
puts "AFTER MERGESORT \n" + a.to_s
