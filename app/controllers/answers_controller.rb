class AnswersController < ApplicationController
  
  def create
    @question = Question.find_by(id: params[:question_id])
    @answer = Answer.new(answer_params.merge({user: @user}))

    if @answer.save 
      redirect_to question_path(@question)
    else
      @errors = "Your answer is invalid. Please try again"

      redirect_to root_path
    end
  end

  def edit
    @answer = Answer.find_by(id: params[:id])
  end

  def update
    @question = Question.find_by(id: params[:question_id])
    @answer = Answer.find_by(id: params[:id])

    if @answer && @answer.update(answer_params)
      redirect_to @question
    else
      render 'edit'
    end
  end

  def destroy
    @answer = Answer.find_by(id: params[:id])
    @question = Question.find_by(id: @answer.question_id)
    @answer.destroy
    redirect_to @question
  end

  private

  def answer_params
    params.require(:answer).permit(:title, :body, :question_id)
  end
end
