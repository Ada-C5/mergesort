def mergesort(a)
    return a if a.length <= 1

    left, right = split_array(a)
    
    left = mergesort(left)
    right = mergesort(right)

    return combine(left, right)

end

def split_array(a)
    split = (a.length/2)
    left = a[0..split - 1]
    right = a[split..-1]

    return left, right
end

def combine(a, b)
    results = []

    until a.empty? || b.empty?
      if a.first > b.first
        results << b.first
        b.shift
      elsif a.first < b.first
        results << a.first
        a.shift
      else
        results << a.first
        results << b.first
        a.shift
        b.shift
      end
    end

  return results.concat(a).concat(b)

end

# TEST IT
a = [6,23,53,1,2,5,62,61,33,21,14,6,23]
a = a.shuffle
puts "ORIGINAL \n" + a.to_s
a = mergesort(a)
puts "AFTER MERGESORT \n" + a.to_s
