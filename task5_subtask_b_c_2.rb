class TrafficLight

  def start
    p 'Request a traffic color and get action'
    p "Enter 'exit' for stop program"
    while true
      request = gets.chomp.downcase
      abort if is_exit?(request)
      get_action(request)
    end
  end

  private

  def is_exit?(request)
    case request
    when "exit"
      true
    else
      false
    end
  end

  def get_action(color)
    traffic_light = { "green" => "walk", "yellow" => "wait", "red" => "stop" }
    if traffic_light.include?(color)
      p traffic_light[color]
    else
      p "No such color"
    end
  end
end

TrafficLight.new().start
