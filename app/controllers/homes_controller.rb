class HomesController < ApplicationController
    before_action :check_login
    def check_login
        redirect_to root_path if !current_user
    end
    def index
        @user = current_user
    end
    
    
    # call this create method to create user selfie and user background image 
    def create
        if user_params[:image]
          current_user.update(:image => user_params[:image])
        elsif user_params[:background]
          current_user.update(:background => user_params[:background])
        end
        redirect_to action: "index"
    end
    
    def new
    end
    
    
    private
    def user_params
      params.require(:user).permit(:image, :background)
    end
end