class ForumsController < ApplicationController
    before_action :find_forum, only: [:show, :destroy]
    
    def create
        @forum = Forum.new(forum_params)
        if @forum.save
            redirect_to forum_path(@forum.id)
        else
            render "create"
        end
    end
    
    def index
        @user = current_user
        @forum = Forum.new
        respond_to do |format|
            format.html
        end
    end
    
    def search
        @user = current_user
        if params[:content]
          puts "params is"
          puts params[:content]
          @course = Forum.filter_by_college_name(params[:content])
          puts "hehehehe"
          puts @course
          respond_to do |format|
            format.html
            format.json {render json: @course}
          end
        end
    end
    
    def show
        @name = @forum.name
        @coursename = @forum.coursename
    end
    
    def destroy
    
    end
    
    private
    def forum_params
        params.require(:forum).permit(:name, :coursename)
    end
    
    def find_forum
        @forum = Forum.find(params[:id])
    end
end