class CommentsController < ApplicationController
  before_action :set_commentable

  def new
    @comment = Comment.new
  end

  def create
    logger.info(comment_params)
    @comment = @commentable.comments.new(comment_params.merge({user: current_user}))
    if @comment.save!
      redirect_to @question
    else
      render :new
    end
  end

  def destroy
    @comment = Comment.find_by(id: params[:id])
    @question = Question.find_by(id: @comment.question_id)
    @comment.destroy

    redirect_to @question
  end

  protected

  def set_commentable
    @question = Question.find_by(id: params[:question_id])
    @answer = Answer.find_by(id: params[:answer_id]) if params[:answer_id]
    @commentable = @answer || @question
  end

  def comment_params
    params.require(:comment).permit(:content,:commentable_id,:commentable_type)
  end
end
