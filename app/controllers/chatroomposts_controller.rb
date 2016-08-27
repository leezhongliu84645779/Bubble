class ChatroompostsController < ApplicationController
  before_action :set_chatroompost, only: [:show, :edit, :update, :destroy]
  before_action :set_chatroom

  # GET /chatroomposts
  # GET /chatroomposts.json
  def index
    @chatroomposts = Chatroompost.all
  end

  # GET /chatroomposts/1
  # GET /chatroomposts/1.json
  def show
  end

  # GET /chatroomposts/new
  def new
    @chatroompost = Chatroompost.new
  end

  # GET /chatroomposts/1/edit
  def edit
  end

  # POST /chatroomposts
  # POST /chatroomposts.json
  def create
    @chatroompost = Chatroompost.new(chatroompost_params)
    respond_to do |format|
      if @chatroompost.save
        format.html { redirect_to chatroom_chatroomposts_path(@chatroom), notice: 'Chatroompost was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end

  # PATCH/PUT /chatroomposts/1
  # PATCH/PUT /chatroomposts/1.json
  def update
    respond_to do |format|
      if @chatroompost.update(chatroompost_params)
        format.html { redirect_to @chatroompost, notice: 'Chatroompost was successfully updated.' }
        format.json { render :show, status: :ok, location: @chatroompost }
      else
        format.html { render :edit }
        format.json { render json: @chatroompost.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /chatroomposts/1
  # DELETE /chatroomposts/1.json
  def destroy
    @chatroompost.destroy
    respond_to do |format|
      format.html { redirect_to chatroomposts_url, notice: 'Chatroompost was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_chatroompost
      @chatroompost = Chatroompost.find(params[:chatroompost_id])
    end

    def set_chatroom
      @chatroom = Chatroom.find(params[:chatroom_id])
    end


    # Never trust parameters from the scary internet, only allow the white list through.
    def chatroompost_params
      params.require(:chatroompost).permit(:author)
    end
end