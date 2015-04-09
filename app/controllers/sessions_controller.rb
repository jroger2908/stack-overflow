class SessionsController < ApplicationController

  def new
  end

  def create
    @user = User.find_by(username: params[:sessions][:username])
    if @user && @user.authenticate(params[:sessions][:password])
      session[:user_id] = @user.id
      redirect_to root_path
    else
      render :new, alert: "Incorrect username or password!"
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_path
  end

end
