class UsersController < ApplicationController
  def new
    @user = User.new
  end
  
  def create
    binding.pry
    user = User.create(user_params)
    if user.save
      flash[:notice] = "Logged in as #{user.username} (email: #{user.email})"
      session[:user_id] = user.id
      redirect_to '/'
    else
      flash[:error] = "Unable to login, please try again"
      redirect_to new_users_path
    end
  end

  private
    def user_params
      params.require(:user).permit(:username, :email, :password)
    end
end