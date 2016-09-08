class FeaturesController < ApplicationController
  before_filter :set_question, only: [:quiz]
  def dashboard
  end

  def quiz
  end

  def score

  end

  private
  def set_question
    @question = params[:id].present? ? Question.find(params[:id]) : Question.first
  end
end
