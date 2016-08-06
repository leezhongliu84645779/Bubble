class SessionsController < ApplicationController
    before_action :check_login, only: [:index, :create]
    
    def check_login
        redirect_to homes_path if current_user
    end
    
    def index
    end
    
    
    
    def create
        user = User.find_by_username(user_params[:username])
        if !user
            flash[:loginerror] = "用户名不存在"
            redirect_to action: "index"
        elsif !User.authenticate(user, user_params[:password])
            flash[:loginerror] = "用户名与密码不匹配"
            redirect_to action: "index"
        else
            session[:user_id] = user.id
            redirect_to homes_path
        end
    end
    
    def destroy
       session[:user_id] = nil
       redirect_to action: "index"
    end
    
    
    
    private
      def user_params
          params.permit(:username, :password)
      end
end