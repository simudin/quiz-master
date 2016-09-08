class Question < ApplicationRecord
  validates_presence_of :content, :answer

  def check_answer(param)
    jarow = FuzzyStringMatch::JaroWinkler.create( :native )
    right_answer = change_to_words(self.answer.downcase)
    answer = change_to_words(param.downcase)
    jarow.getDistance(right_answer, answer)
  end

  def change_to_words(param)
    param_array = param.split(" ")
    param_array.map! do |val|
      if numeric? val
        val.to_f.to_words
      else
        val
      end
    end
    param = param_array.join(" ")
  end

  def numeric?(string)
  # `!!` converts parsed number to `true`
    !!Kernel.Float(string)
  rescue TypeError, ArgumentError
    false
  end

  def next
    Question.where("id > ?", id).first
  end

  def prev
    Question.where("id < ?", id).last
  end
end
