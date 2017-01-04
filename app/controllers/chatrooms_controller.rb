class ChatroomsController < ApplicationController
  before_action :set_chatroom, only: [:show, :edit, :update, :destroy]

  # GET /chatrooms
  # GET /chatrooms.js
  def index
    @chatrooms = Chatroom.all
    session[:category] ||= ""
    session[:size] ||= ""
    session[:position] ||= ""
    if session[:category] != params[:category]
      session[:category] = session[:category] + params[:category] + "%" if !params[:category].nil? and !session[:category].split("%").include?(params[:category])
    end
    if session[:size] != params[:size]
      session[:size] = session[:size] + params[:size] + "%" if !params[:size].nil? and !session[:size].split("%").include?(params[:size])
    end
    if session[:position] != params[:position]
      session[:position] = session[:position] + params[:position] + "%" if !params[:position].nil? and !session[:position].split("%").include?(params[:position])
    end
    category = session[:category].split("%")
    size = session[:size].split("%")
    position = session[:position].split("%")
    @chatrooms = @chatrooms.where(category: category) if !session[:category].empty?
    @chatrooms = @chatrooms.where(size: size) if !session[:size].empty?
    @chatrooms = @chatrooms.where(position: position) if !session[:position].empty?
    if session[:position] != params[:position] || session[:size] != params[:size] || session[:category] != params[:category]
      return redirect_to :category => session[:category] , :size => session[:size], :position => session[:position]
    end
  end

  # GET /chatrooms/1
  # GET /chatrooms/1.json
  def show
  end

  # GET /chatrooms/new
  def new
    @chatroom = Chatroom.new
    respond_to do |format|
      format.html {}
    end
  end

  # GET /chatrooms/1/edit
  def edit
  end

  # POST /chatrooms
  # POST /chatrooms.json
  def create
    @chatroom = Chatroom.new(chatroom_params)

    respond_to do |format|
      if @chatroom.save
        @chatroom.chatroom_users.where(:user_id => current_user.id).first_or_create
        format.html { redirect_to @chatroom, notice: 'Chatroom was successfully created.' }
        format.json { render :show, status: :created, location: @chatroom }
      else
        format.html { render :new }
        format.json { render json: @chatroom.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /chatrooms/1
  # PATCH/PUT /chatrooms/1.json
  def update
    respond_to do |format|
      if @chatroom.update(chatroom_params)
        format.html { redirect_to @chatroom, notice: 'Chatroom was successfully updated.' }
        format.json { render :show, status: :ok, location: @chatroom }
      else
        format.html { render :edit }
        format.json { render json: @chatroom.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /chatrooms/1
  # DELETE /chatrooms/1.json
  def destroy
    @chatroom.destroy
    respond_to do |format|
      format.html { redirect_to chatrooms_url, notice: 'Chatroom was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_chatroom
      @chatroom = Chatroom.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def chatroom_params
      params.require(:chatroom).permit(:name, :size, :category, :visibility, :position)
    end
end
