class UsersController < ApplicationController
  
  def show 
    @user = User.find(params[:id])
    @questions = @user.questions.take(5)
    @answers = @user.answers.take(5)
  end

  def new
   
  end
end
