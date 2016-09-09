class CheckScoreService
  attr_reader :score, :message, :next_question, :right_answer
  def initialize(params)
    @score = params[:score]
    @right_answer = params[:right_answer]
    @message = ""
    @next_question = false
  end

  def get_properties
    case @score
    when 1.0
      @message = "You are right!"
      @next_question = true
    when 0.99...1.0
      @message = "You are right!, It's #{@answer} more precise"
      @next_question = true
    when 0.8...0.99
      @message = "It's close! Try again."
      @next_question = false
    else
      @message = "Sorry, wrong answer!"
      @next_question = false
    end
    # {score: @score, message: @message, next_question: @next_question}

  end
end
