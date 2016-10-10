class SessionsController < ApplicationController
    before_action :check_login, only: [:index, :create]
    
    def check_login
        redirect_to homes_path if current_user
    end
    
    def index
        respond_to do |format|
            format.html{redirect_to root_path}
            format.js{}
        end
    end
    
    
    
    def create
        user = User.find_by_username(user_params[:username])
        if !user
            @loginerror = "The Username doesn't exist"
            puts "enter here no user"
            respond_to do |format|
                puts "here too!"
                format.js{}
            end
        elsif !User.authenticate(user, user_params[:password])
            @loginerror = "The Username doesn't match with the password"
            puts "enter here not match"
            respond_to do |format|
                format.js{}
            end
        else
            @loginerror = ""
            puts "enter here everything is correct"
            session[:user_id] = user.id
            render :js => "window.location = '#{homes_path}'"
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