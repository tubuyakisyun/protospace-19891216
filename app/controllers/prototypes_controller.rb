class PrototypesController < ApplicationController
  before_action :move_to_index, except: [:index, :show]

  def index
    @prototypes = Prototype.all 
    @prototypes = Prototype.includes(:user)

  end
  def new
    @prototype = Prototype.new
  end
  def create
    # Prototype.create(prototype_params)
    @prototype = Prototype.new(prototype_params)
    if @prototype.save
      redirect_to root_path(@prototype)
    else
      @prototypes = Prototype.includes(:user)
      render :new
    end

    # @room = Room.find(params[:room_id])
    # @message = @room.messages.new(message_params)
    # if @message.save
    #   redirect_to room_messages_path(@room)
    # else
    #   @messages = @roo.messages.includes(:user)
    #   render :index
    # end
    # chatapp のメッセージ投稿昨日実装：メッセージ送信後の条件分岐

    # また、投稿に失敗したときの処理にも、同様に@messagesを定義しました。
    # renderを用いることで、投稿に失敗した@messageの情報を保持しつつ
    # index.html.erbを参照することができます（この時、indexアクションは経由しません）。
    # しかしながら、そのときに@messagesが定義されていないとエラーになってしまいます。
    # そこで、indexアクションと同様に@messagesを定義する必要があります。
  end
  def show
    @prototype= Prototype.find(params[:id])
    # @tweet = Tweet.find(params[:id])
  end



  private
  def prototype_params
    params.require(:prototype).permit(:title, :catch_copy, :concept, :image).merge(user_id: current_user.id)
    # ツイート保存時にユーザー情報も追加しよう.merge(user_id: current_user.id)
    # params.require(:tweet).permit(:name, :image, :text).merge(user_id: current_user.id)
  end
  def move_to_index
    unless user_signed_in?
      redirect_to action: :index
    end
  end

end
