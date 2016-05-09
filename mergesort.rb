def mergesort(a)
  return a if a.length <= 1

  middle = a.length / 2
  left = a[0,middle]
  right = a[middle..-1]

  left = mergesort(left)
  right = mergesort(right)
  combine(left, right)
end

def combine(a, b)
  result = []
  until a.empty? || b.empty?
    if a.first <= b.first
      result << a.shift
    else
      result << b.shift
    end
  end
  result + a + b
end


# TEST IT
a = [6,23,53,1,2,5,62,61,33,21,14,6,23]
a = a.shuffle
puts "ORIGINAL \n" + a.to_s
a = mergesort(a)
puts "AFTER MERGESORT \n" + a.to_s
