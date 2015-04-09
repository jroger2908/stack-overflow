class AnswersController < ApplicationController

  before_action :set_question

  def create
    @answer = @question.answers.new(answers_params.merge(user: @user))

    if @answer.save
      redirect_to question_path(params[:question_id])
    else
      @errors = "Your answer is invalid. Please try again"
      render "new"
    end
  end

  def edit
    @answer = Answer.find_by(id: params[:id])
  end

  def update
    @answer = Answer.find_by(id: params[:id])

    if @answer && @answer.update(answer_params)
      redirect_to question_path(params[:question_id])
    else
      render 'edit'
    end
  end

  def destroy
    Answer.find_by(id: params[:id]).destroy
    redirect_to question_path(params[:question_id])
  end

  protected

  def set_question
    @question = Question.find_by(id: params[:question_id])
  end

  private

  def answer_params
    params.require(:answer).permit(:body, :question_id)
  end
end
