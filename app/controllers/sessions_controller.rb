class SessionsController < ApplicationController
  def new
  end
  
  def create
    if @user = User.find_by(username: params[:session][:username])
      verify_user
    else
      flash[:failure] = "Unable to find an account with that username"
      redirect_to login_path
    end
  end
  
  def destroy
    session.clear
    flash[:notice] = "Successfully logged out"
    redirect_to '/'
  end
  
  
  private

  def verify_user
    if @user && @user.authenticate(params[:session][:password])
      login_successful
    else
      flash[:failure] = "Your Password is incorrect"
      redirect_to '/login'
    end
  end
  
  def login_successful
    session[:user_id] = @user.id
    flash[:notice] = "Logged in as #{@user.username}"
    binding.pry
    redirect_to '/'
  end

end