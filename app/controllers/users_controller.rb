class UsersController < ApplicationController
  before_action :check_login
  def check_login
    redirect_to homes_path if current_user
  end
  
  def index
    @user = User.new
    respond_to do |format|
      format.js {}
      format.html {redirect_to root_path}
    end
  end

  
  def create
    @new_user = User.new(user_params)
    if @new_user.save
      session[:user_id] = @new_user.id
      render :js => "window.location = '#{homes_path}'"
    else
      flash[:errors] = @new_user.errors.full_messages
      @signuperror = flash[:errors][0]
      respond_to do |format|
        format.js{}
      end
    end
  end

  private
  def user_params
    params.require(:user).permit(:username, :email, :password, :password_confirmation)
  end
end
