# Сделал перевод градусов в две стороны
# @array_of_measure - вынес для того, чтобы хранить уже просчитанные градусы и не создавать повторные записи

class Interpreter
  @array_of_measures = {
      celsius: Hash.new { |hash, value| hash[value] = 9/5*value+32 },
      fahrenheit: Hash.new { |hash, value| hash[value] = (5.0/9*(value-32)).round(1) }
    }

  # начало программы с проверкой вводимых значений
  def self.start
    p "write converting measure and degrees"
    measure = gets.chomp()
    degrees = gets.chomp()
    if degrees == "0"
      check_values(measure, degrees.to_i)
    else
      if degrees.to_i == 0 # строки, которые не подрузомевают числа переводятся в 0
        p "You intered the wrong degrees"
        start
      else
        check_values(measure, degrees.to_i)
      end
    end
  end

  # перевод градусов
  def self.celsius_fahrenheit(converting_unit_measure = "celsius", degrees)
    case converting_unit_measure
    when "celsius"
      p @array_of_measures[:celsius][degrees]
    when "fahrenheit"
      p @array_of_measures[:fahrenheit][degrees]
    else
      p "You intered the wrong unit of measure"
      start
    end
  end

  private

  # проверяю нет ли уже созданной записи с таким переводом
  def self.check_values(converting_unit_measure, degrees)
    measure = converting_unit_measure.downcase.to_sym
    if @array_of_measures.include?(measure)
      p @array_of_measures[measure][degrees]
    else
      celsius_fahrenheit(measure, degrees)
    end
  end
end

Interpreter.start
Interpreter.celsius_fahrenheit(42)
