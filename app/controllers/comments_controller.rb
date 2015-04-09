class CommentsController < ApplicationController
  def create
  end

  def destroy
    @comment = Comment.find_by(id: params[:id])
    @question = Question.find_by(id: @comment.question_id)
    @comment.destroy
    
    redirect_to @question
  end
end
