class AnswersController < ApplicationController
  load_and_authorize_resource param_method: :answer_params
  before_action :find_question
  def index
    @answers = Answer.where(:question_id => params[:question_id])
  end

  def show
    @answers = Answer.includes(params[:question_id])
  end

  def new
    @answer = Answer.new
  end

  def edit
  end

  def create
    @answer = @question.answers.new(answer_params)
    if @answer.save
      redirect_to question_answers_path
    else
      render :new
    end
  end

  private
    def find_question
      @question = Question.find(params[:question_id])
    end
    def answer_params
      params.require(:answer).permit(:text,:answer_value, :question_id)
    end
end