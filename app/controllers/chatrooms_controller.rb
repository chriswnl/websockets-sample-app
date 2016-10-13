class ChatroomsController < ApplicationController
  before_action :set_chatroom, only: [:show, :edit, :update, :delete]

  def index
    @chatrooms = Chatroom.all
  end

  def new
    @chatroom = Chatroom.new
  end
  
  def create
    @chatroom = Chatroom.new(chatroom_params)
    if @chatroom.save
      redirect_to chatrooms_path, notice: "Chatroom created."
    else
      flash[:alert] = "Cannot create chatroom"
      render :new
    end
  end

  def show
    @message = Message.new
  end

  def edit
  end
  
  def update
    if @chatroom.update(chatroom_params)
      redirect_to @chatroom, notice: "Updated!"
    else
      flash[:alert] = "Not updated."
      render :edit
    end
  end
  
  def destroy
    if @chatroom.destroy
      redirect_to chatrooms_path, notice: "It's gone!"
    else
      redirect_to chatrooms_path, alert: "Couldn't delete."
    end
  end
  
  private
  
  def chatroom_params
    params.require(:chatroom).permit(:topic)
  end
  
  def set_chatroom
    @chatroom = Chatroom.find_by(slug: params[:slug])
  end
end
