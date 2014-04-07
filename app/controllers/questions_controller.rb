class QuestionsController < ApplicationController

  load_and_authorize_resource param_method: :question_params

  def index
    @questions = Question.includes(:owner)
  end

  def show
  end

  def new
    @question = Question.new
  end

  def edit
  end

  def create
    @question = current_user.questions.new(question_params)
    if @question.save
      redirect_to questions_path
    else
      render :new
    end
  end

  def update
    if @question.update(question_params)
      redirect_to questions_path
    else
      render :edit
    end
  end

  def destroy
    @question.destroy
    redirect_to questions_path
  end

  private
    
    def question_params
      params.require(:question).permit(:text)
    end
end