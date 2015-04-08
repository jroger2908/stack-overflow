class QuestionsController < ApplicationController

  def index
    @questions = Question.all
  end

  def new
    @question = Question.new
  end

  def create
    @question = Question.new()
  end

  def show
    @question = Question.find_by(params[:id])
  end

  def edit
  end

  def update
  end

  def destroy
    @question = Question.find_by(params[:id])
    @question.destroy

    redirect_to root_path
  end

  private

  def question_params
    params.require(:question).permit(:title, :body)
  end

end
