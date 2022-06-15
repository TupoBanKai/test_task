array = [nil, 2, :foo, "bar", "foo", "apple", "orange", :orange, 45, nil, :foo, :bar, 25, 45, :apple, "bar", nil]

def count_of_occurrences(array)
  return p 'Not validated' unless valid?(array)
  h = Hash[array.each_slice(1).to_a]
  h.each_key { |key| h[key] = [] }
  array.each do |value|
    h[value].append(value)
  end
  h.each_key { |key| h[key] = h[key].length }
end

def count_of_occurrences2(array)
  return p 'Not validated' unless valid?(array)
  counts = Hash.new { |hash, counter| hash[counter] = 0 }
  array.each { |value| counts[value] += 1 }
  counts
end

def valid?(array)
  if array.is_a?(Array)
    if array.empty?
      false
    else
      true
    end
  else
    false
  end
end


count_of_occurrences(array)
count_of_occurrences2(array)
