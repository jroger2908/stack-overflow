class UsersController < ApplicationController

  def show
    @user = User.find(params[:id])
    @questions = @user.questions.sort_by { |q| q.vote_count }.take(5)
    @answers = @user.answers.sort_by { |a| a.vote_count }.take(5)
  end

  def new
    @user = User.new
  end

  def create

    @user = User.new(user_params)
    logger.info(@user)
    if @user.save
      session[:user_id] = @user.id
      redirect_to user_path(@user)
    else

      render "new"
    end
  end

  def destroy
  end

  private

  def user_params
    params.require(:user).permit(:name, :location, :username, :password)
  end

end
