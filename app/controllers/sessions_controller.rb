class SessionsController < ApplicationController
  def new
  end
  
  def create
    if @user = User.find_by(username: params[:session][:username])
      verify_user
    else
      redirect_to login_path
    end
  end
  
  def destroy
    session.clear
    redirect_to '/'
  end
  
  
  private

  def verify_user
    binding.pry
    if @user && @user.authenticate(params[:session][:password])
      login_successful
    else
      flash[:failure] = "That login was unsuccessful"
      redirect_to '/login'
    end
  end
  
  def login_successful
    session[:user_id] = @user.id
    flash[:notice] = "Logged in as #{@user.username}"
    redirect_to ''
  end

end