class AnswerHelper
  COLOR_TRUE_ANSWERS = { green: "walk", yellow: "wait", red: "stop" }

  def is_yes?(answer)
    case answer
    when 1
      true
    when 2
      abort
    else
      false
    end
  end

  def is_correct?(answer, current_color)
    if COLOR_TRUE_ANSWERS[current_color] == answer.downcase
      true
    else
      false
    end
  end
end
