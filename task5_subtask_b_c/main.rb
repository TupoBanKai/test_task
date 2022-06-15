# Это не основная программа по тз, а моя вариация. Основная программа - task5_subtask_b_2_c.rb
# По задумке task5_subtask_a.rb - тренеровка перед экзаменом, а эта программа - экзамен
# Подразумевается, что пользователь знает какие действия нужно вводить на те или иные сигналы светофора
# Сделал поток для таймера, чтобы светофор переключался

require_relative 'logger'
require_relative 'answer_helper'

class Main
  TRAFIC_COLORS = [:green, :yellow, :red]
  RESPONSE_INTERVAL = 10 # - 10 секунд на ответ

  def initialize
    @current_color = nil
    @time = Time.now()
    @counter = 0
  end

  def begin_simulation # логи, начало/рестарт симуляции, выход
    log.hello
    log.alarm until answer.is_yes?(user_answer.to_i)
    next_light
    @thread = Thread.new { timer }
    start_test
  end

  private

  def timer # таймер для переключения сигналов светофора
    i = Time.now()
    while i - @time < RESPONSE_INTERVAL
      i = Time.now
    end
    if next_light != nil
      @time = Time.now()
      timer
    else
      @thread.exit()
    end
  end

  def retry? # вопрос о рестарте теста и подготовка
    @current_color = TRAFIC_COLORS[0]
    @counter = 0
    log.next
    begin_simulation if answer.is_yes?(user_answer.to_i)
  end

  def start_test # основное действие с юзером и цветами светофора
    while @current_color != nil
      check_answer # появляется некоторая проблема если истечет время на последнем цвете, но программа не падает в ошибку
      @time = Time.now()
      next_light
    end
    retry?
  end

  def next_light # переключение сигналов светофора
    @current_color = TRAFIC_COLORS[@counter]
    unless @current_color == nil
      log.start(@current_color)
      @counter += 1
    end
    @current_color
  end

  def check_answer # проверка ответа пользователя
    if answer.is_correct?(user_answer, @current_color)
      log.success
    else
      log.failure(@current_color)
    end
  end

  def user_answer
    @user_answer = gets.chomp
  end

  def log
    @log ||= Logger.new()
  end

  def answer
    @answer ||= AnswerHelper.new()
  end
end

start = Main.new()
start.begin_simulation
