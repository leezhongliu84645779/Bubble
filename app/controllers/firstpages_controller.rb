class FirstpagesController < ApplicationController
  before_action :check_login
  def check_login
    redirect_to homes_path if current_user
  end
  

  def index

  end

end