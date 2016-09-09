class ScoreService
  def initialize(params)
    @right_answer = params[:right_answer]
    @answer = params[:answer]
    @result = 0.0
  end

  def check_score
    right_answer = change_to_words(@right_answer)
    answer = change_to_words(@answer)
    @result = get_score(right_answer, answer)
  end

  private
    def get_score(right_answer, answer)
      jarow = FuzzyStringMatch::JaroWinkler.create( :native )
      jarow.getDistance(right_answer, answer)
    end

    def change_to_words(param)
      param_array = param.downcase.split(" ")
      param_array.map! do |val|
        numeric?(val) ? val.to_f.to_words : val
      end
      param = param_array.join(" ")
    end

    def numeric?(string)
      !!Kernel.Float(string)
    rescue TypeError, ArgumentError
      false
    end
end
