class Question < ApplicationRecord
  validates_presence_of :content, :answer

  def next
    Question.where("id > ?", id).first
  end
end
