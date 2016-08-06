class UsersController < ApplicationController
  before_action :check_login
  def check_login
    redirect_to homes_path if current_user
  end
  
  def index
    @user = User.new
  end

  
  def create
    @new_user = User.new(user_params)
    if @new_user.save
      session[:user_id] = @new_user.id
      redirect_to homes_path
    else
      flash[:errors] = @new_user.errors.full_messages
      redirect_to action: "index"
    end
  end

  private
  def user_params
    params.require(:user).permit(:username, :email, :password, :password_confirmation)
  end
end
