class AnswersController < ApplicationController
  
  def create
    @question = Question.find_by(id: params[:question_id])
    @answer = Answer.new(answers_params.merge({user: @user}))

    if @answer.save 
      redirect_to question_path(@question)
    else
      @errors = "Your answer is invalid. Please try again"

      redirect_to root_path
    end
  end

  def edit
    @questions = Questions.all
    @answer = Answer.find_by(id: params[:id])
  end

  def update
  end

  def destroy
    @answer = Answer.find_by(id: params[:id])
    @answer.destroy
  end

  private

  def answers_params
    params.require(:answer).permit(:title, :body, :question_id)
  end
end
