TRAFFIC_LIGHTS = { "green" => "walk", "yellow" => "wait", "red" => "stop" }

def trafic_signal_traning(color)
  if TRAFFIC_LIGHTS.include?(color)
    TRAFFIC_LIGHTS[color]
  else
    p "No such color"
  end
end

trafic_signal_traning("green")
trafic_signal_traning("yellow")
trafic_signal_traning("red")
