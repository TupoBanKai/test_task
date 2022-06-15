class Logger
  def hello
    p "Welcome, to Traffic light simulation!"
    p "Are you ready to start?"
    p "1 - to yes, 2 - to not"
  end

  def start(current_color)
    p "Current color is a #{ current_color }, what are you actions?"
  end

  def alarm
    p "Something is wrong, check your answer"
  end

  def failure(current_color)
    case current_color
    when :green
      p 'You are free to do what you want,'
      p 'but the answer is not correct'
    when :yellow
      p 'Wrong answer'
    when :red
      p "Wrong answer"
    end
  end

  def success
    p "Congratulations, you did the right thing at the current traffic light"
  end

  def next
    p "Are we trying again?"
    p "1 - to yes, 2 - to not"
  end
end
