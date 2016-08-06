class ProfilesController < ApplicationController
    def index
        @user = current_user
    end
    
    def create
    end
    
    
    
    private
    def user_params
      params.require(:user).permit(:image, :background, :name)
    end
end