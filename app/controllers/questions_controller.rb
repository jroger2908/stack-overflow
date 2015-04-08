class QuestionsController < ApplicationController

  def index
    @questions = Question.all
  end

  def new
    @question = Question.new
  end

  def create
    @user = User.find_by(id: session[:id])
    @question = Question.new(question_params).merge({user: @user})

    if @question.save 
      redirect_to question_path(@question)
    else
      @errors = "Your question is invalid. Please try again"

      redirect_to root_path
    end
  end

  def show
    @question = Question.find_by(params[:id])
  end

  def edit
    @question = current_user.questions.find(params[:id])
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
