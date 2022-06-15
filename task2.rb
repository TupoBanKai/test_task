# Постарался сделать все разными способами специально

array = [{ a: 1, b: 2, c: 45 }, { d: 123, c: 12 }, { e: 87 }]

def arr_of_values(array)
  return p 'Not validated' unless valid?(array)
  x = []
  array.length.times { |i| x.append(array.shift.values) }
  p x.flatten
end

def arr_of_value2(array)
  return p 'Not validated' unless valid?(array)
  arr = []
  x = []
  array.each do |value|
    arr.append(value.to_a)
  end
  arr.flatten.each_slice(1).map { |value| x.append(value[0]) if value[0].respond_to?(:to_i) }
  p x
end

def arr_of_keys(array)
  return p 'Not validated' unless valid?(array)
  x = []
  array.map { |value| x += value.keys }
  p x.flatten
end

def sum_of_values(array)
  return p 'Not validated' unless valid?(array)
  x = 0
  i = 0
  array.each do |hash|
  hash.each_value { |value| i += value }
  end
  p i
end

def valid?(array)
  if array.is_a?(Array) && array != []
    array.each do |value|
      if value.is_a?(Hash) && value != {}
        true
      else
        return false
      end
    end
  else
    false
  end
end

arr_of_keys(array)
arr_of_value2(array)
arr_of_values(array)
sum_of_values(array)

