def mergesort(a)
  if a.length <= 1
    return a
  end

  left, right = split_array(a)

  left = mergesort(left)
  right = mergesort(right)

  combine(left,right)
end

def split_array(a)
  split_length = a.length/2
  left = a.take(split_length)
  right = a.drop(split_length)
  return left, right
end

def combine(a, b)
  results = []

  until a[0] == nil || b[0] == nil do
    if a[0] < b[0]
      results << a.shift
    elsif b[0] < a[0]
      results << b.shift
    else
      results << a.shift
    end
  end

  if a[0] == nil
    (results << b).flatten!
  elsif b[0] == nil
    (results << a).flatten!
  end
return results
end

a = [6,23,53,1,2,5,62,61,33,21,14,6,23]
a = a.shuffle
puts "ORIGINAL \n" + a.to_s
a = mergesort(a)
puts "AFTER MERGESORT \n" + a.to_s
