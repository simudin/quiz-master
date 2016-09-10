class FeaturesController < ApplicationController
  before_action :set_question, only: [:quiz]
  before_action :set_initial_lives, only: [:dashboard, :score]
  before_action :get_live
  def dashboard
  end

  def quiz
  end

  def score
  end

  def game_over
  end

  private
    def set_initial_lives
      session[:lives] = 3
    end

    def get_live
      @lives = session[:lives]
    end

    def set_question
      @question = params[:id].present? ? Question.find(params[:id]) : Question.first
    end
end