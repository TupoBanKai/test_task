array = [2, 3, 12, 1, 6, 0, 34, 122, 124, 789, 999, 33, 54, 763, 893]

def two_max_values(array)
  if array.is_a?(Array)
    begin
      array = array.sort # выбрасывает исключение при разномастном массиве
    rescue ArgumentError
      p "Comparison of NilClass/String/Boolean failed"
    else
      if array[0] != nil && array[-1] != nil # проверка на массив nil'ов после sort
        array.last(2)
      else
        p "Your array consists of nil"
      end
    end
  else
    p "Invalid format #{array}"
  end
end


# Решил написать разными способами, чтобы не повторяться.
# При выборе алгоритма поиска, понял, что для такой задачи, брать сложный алгоритм не имеет смысла.
# По этому, решил прибегнуть к созданию собственного алгоритма

# принцип работы - поперемено сравниваю 1ое заданное min значение с остальными
# и сменяю min на следующее, если слудующее меньше текущего минимального, параллельно
# записываю сменяемое число для выявления двух минимальных в конце.

def two_min_values(array)
  return unless is_it_true_array?(array)
  i = 0
  if array[i - 1] < array[i]
    i += 1
  elsif array[i - 1] == array[i]
    i += 2
  end
  min = array[i - 1]
   while i < array.length
    if min > array[i]
      past_min_values = min
      min = array[i]
    end
    previous = array[i]
    if past_min_values
      if previous < past_min_values && previous > min
        past_min_values = previous
      end
    end
    i += 1
   end
   p second_min_value = past_min_values
   p first_min_value = min
end

# Вынес проверку в отдельный метод, чтобы основной небыл еще более громостким и менее читаемым

def is_it_true_array?(array)
  if array.is_a?(Array)
    if array.length > 2
      array.each do |value|
        if value.is_a?(Integer)
          true
        else
          p 'Unsuited array'
          false
        end
      end
    else
      p 'Array is too short'
      false
    end
  else
    p 'Its not an array'
    false
  end
end




two_max_values(array)
two_min_values(array)
