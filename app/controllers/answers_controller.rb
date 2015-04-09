class AnswersController < ApplicationController
  
  def create
    
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
    params.require(:answer).permit(:title, :body)
  end
end
