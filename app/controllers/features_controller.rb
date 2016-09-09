class FeaturesController < ApplicationController
  before_action :set_question, only: [:quiz]
  before_action :get_live, except: [:dashboard]
  def dashboard
    session[:lives] = 3
    get_live
  end

  def quiz
  end

  def score
  end

  def game_over
  end

  private
  def get_live
    @lives = session[:lives]
  end

  def set_question
    @question = params[:id].present? ? Question.find(params[:id]) : Question.first
  end
end
