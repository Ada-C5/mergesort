def mergesort(a)
  # base case
  return a if a.length <= 1
  # split array
  left, right = split_array(a)
  # recursive case
  combine(mergesort(left), mergesort(right))
end

def split_array(a)
  middle = a.length / 2
  left = a[0...middle]
  right = a[middle..-1]
  return left, right
end


def combine(a, b)
  result = []
  until a.length == 0 || b.length == 0
    if a.first <= b.first
      result << a.shift
    else
      result << b.shift
    end
  end
  result + a + b
end



# TEST
a = [6,23,53,1,2,5,62,61,33,21,14,6,23]
a = a.shuffle
puts "ORIGINAL \n" + a.to_s
a = mergesort(a)
puts "AFTER MERGESORT \n" + a.to_s
