class UsersController < ApplicationController
  
  def show 
    @user = User.find(params[:id])
    @questions = @user.questions.take(5)
    @answers = @user.answers.take(5)
  end

  def new
   @user = User.new
  end

  def create
  	if user_params[:password] != user_params[:password_confirmation]
      render "new"
    end
   user = User.create(user_params)
   if user.save
   	redirect_to user_path(user)
   else
   	render "new"
   end
  end

  private

  def user_params
    params.require(:user).permit[:name, :location, :username, :password_digest]
  end
end
