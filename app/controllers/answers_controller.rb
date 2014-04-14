class AnswersController < ApplicationController
  load_and_authorize_resource param_method: :answer_params
  before_action :find_question
  def index
    @answers = Answer.includes(:owner)
  end

  def show
  end

  def new
    @answer = Answer.new
  end

  def edit
  end

  def create
    @answer = current_user.answers.new(answer_params)
    if @answer.save
      redirect_to answers_path
    else
      render :new
    end
  end

  def update
    if @answer.update(answer_params)
      redirect_to answers_path
    else
      render :edit
    end
  end

  def destroy
    @answer.destroy
    redirect_to answers_path
  end

  private
    def find_question
      @question = Question.find(params[:question_id])
    end
    def answer_params
      params.require(:answer).permit(:text)
    end
end