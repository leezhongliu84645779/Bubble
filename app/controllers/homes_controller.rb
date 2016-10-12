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
        puts("go to this method")
        @user = current_user
        respond_to do |format|
            format.js{puts "hehehehehehehe"}
        end
    end

    # an action of creating or updating the personal intro
    def createupdateintro
        current_user.update(:introduction => user_params[:introduction])
        redirect_to homes_path
    end
    
    private
    def user_params
      params.require(:user).permit(:image, :background, :introduction)
    end
end