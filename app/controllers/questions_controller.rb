class QuestionsController < ApplicationController

  def index
     @questions = Question.all
     @questions = @questions.where(user_id: params[:user_id]) if params[:user_id]
  end

  def new
    @question = Question.new
  end

  def create
    @question = current_user.questions.new(question_params)

    if @question.save
      redirect_to question_path(@question)
    else
      @errors = "Your question is invalid. Please try again"

      render "new"
    end
  end

  def show
    @question = Question.find_by(id: params[:id])
    @comment = Comment.new
    @answer = Answer.new

  end

  def edit
    @question = current_user.questions.find(params[:id])
  end

  def update
    @question = Question.find_by(id: params[:id])

    if @question && @question.update(question_params)
      redirect_to @question
    else
      render 'edit'
    end
  end

  def destroy
    @question = Question.find_by(params[:id])
    @question.destroy

    redirect_to questions_path
  end

  private

  def question_params
    params.require(:question).permit(:title, :body)
  end

end
