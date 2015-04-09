class CommentsController < ApplicationController
  def create
    user = User.find_by(session[:user_id])
    Comment.create(comment_params.merge({user: user}))
    @question = Question.find_by(id: params[:question_id])
    
    redirect_to @question
  end

  def destroy
    @comment = Comment.find_by(id: params[:id])
    @question = Question.find_by(id: @comment.question_id)
    @comment.destroy

    redirect_to @question
  end

  def comment_params
    params.require(:comment).permit(:body,:commentable_id,:commentable_type)
  end
end
