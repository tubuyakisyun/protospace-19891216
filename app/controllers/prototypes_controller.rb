class PrototypesController < ApplicationController
  def index
  
  end
  def new
    @prototype = Prototype.new

  end
  def create
    Prototype.create(prototype_params)
    @prototype = Prototype.new(prototype_params)
    if @prototype.save
      redirect_to root_path(@prototype)
    else
      render :index
    end

    # @room = Room.find(params[:room_id])
    # @message = @room.messages.new(message_params)
    # if @message.save
    #   redirect_to room_messages_path(@room)
    # else
    #   render :index
    # end
    # chatapp のメッセージ投稿昨日実装：メッセージ送信後の条件分岐
  end


  private
  def prototype_params
    params.require(:prototype).permit(:title, :catch_copy, :concept, :image).merge(user_id: current_user.id)
  end

end
