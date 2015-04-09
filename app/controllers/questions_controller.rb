class QuestionsController < ApplicationController

  def index 
     @questions = Question.all
     @questions = @questions.where(user_id: params[:user_id]) if params[:user_id]
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
    if @quetion &&question.update(question_params)
      redirect_to question_path(@question_path)
    else
      render 'edit'
    end
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
