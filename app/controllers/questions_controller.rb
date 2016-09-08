class QuestionsController < ApplicationController
  before_action :set_question, only: [:show, :edit, :update, :destroy, :check_answer]

  # GET /questions
  # GET /questions.json
  def index
    @questions = Question.all
  end

  # GET /questions/1
  # GET /questions/1.json
  def show
  end

  # GET /questions/new
  def new
    @question = Question.new
  end

  # GET /questions/1/edit
  def edit
  end

  # POST /questions
  # POST /questions.json
  def create
    @question = Question.new(question_params)

    respond_to do |format|
      if @question.save
        format.html { redirect_to @question, notice: 'Question was successfully created.' }
        format.json { render :show, status: :created, location: @question }
      else
        format.html { render :new }
        format.json { render json: @question.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /questions/1
  # PATCH/PUT /questions/1.json
  def update
    respond_to do |format|
      if @question.update(question_params)
        format.html { redirect_to @question, notice: 'Question was successfully updated.' }
        format.json { render :show, status: :ok, location: @question }
      else
        format.html { render :edit }
        format.json { render json: @question.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /questions/1
  # DELETE /questions/1.json
  def destroy
    @question.destroy
    respond_to do |format|
      format.html { redirect_to questions_url, notice: 'Question was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def check_answer
    result = @question.check_answer(question_params[:answer])
    next_question = false
    case result
    when 1.0
      flash[:success] = "You are right!"
      next_question = true
    when 0.99...1.0
      flash[:success] = "You are right!, It's #{@question.answer} more precise"
      next_question = true
    when 0.8...0.99
      flash[:alert] = "It's close! Try again."
      next_question = false
    else
      flash[:alert] = "Sorry, wrong answer!"
      next_question = false
    end
    if next_question
      if @question.next
        redirect_to features_quiz_path(id: @question.next)
      else
        flash[:success] = "You finish the quiz!"
        redirect_to features_score_path
      end
    else
      redirect_to features_quiz_path(id: @question)
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_question
      @question = Question.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def question_params
      params.require(:question).permit(:content, :answer)
    end
end
