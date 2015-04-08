class AnswersController < ApplicationController
  
  def create
    @question = Question.find_by(id: params[:question_id])
    @answer = @question.answer.new(answers_params)

    if @answer.save
      redirect_to question_path(@question)
    else
      @questions = Question.all
      @answers = Answer.all
      @errors = "There was a problem answering the question"

      redirect_to question_path(@question)
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
    params.require(:answer).permit(:title, :body)
  end
end
