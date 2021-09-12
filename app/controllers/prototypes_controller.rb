class PrototypesController < ApplicationController
  # before_action :move_to_index, except: [:index, :show] prototypesコントローラーにおいて、投稿者以外がeditアクションにアクセスしたらトップページにリダイレクトするように記述した
  # before_action :move_to_index, except: [:index, :show]
  before_action :set_prototype, except: [:index, :new, :create]
  before_action :authenticate_user!,except: [:index, :show]
  before_action :contributor_confirmation, only: [:edit, :update, :destroy]

  def index
    @prototypes = Prototype.new 
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
      # @prototypes = Prototype.includes(:user)
      render :new
    end

    # @room = Room.find(params[:room_id])
    # @message = @room.messages.new(message_params)
    # if @message.save
    #   redirect_to room_messages_path(@room)
    # else
    #   @messages = @room.messages.includes(:user)
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
    @comment = Comment.new
    @comments = @prototype.comments.includes(:user)
    # @tweet = Tweet.find(params[:id])
  end
  def edit
  end
  def update
   if @prototype.update(prototype_params)
    redirect_to root_path(@prototype)
   else 
    # prototype = Prototype.find(params[:id])← こちらはUPDATE出来なかった時、情報が保持されないに対し、＠がついたら保存できた。
    render :edit
   end
   

  end
  def destroy
    if @prototype.destroy
    redirect_to root_path 
    else
      redirect_to root_path
    end
  end




  private
  def prototype_params
    params.require(:prototype).permit(:title, :catch_copy, :concept, :image).merge(user_id: current_user.id)
    # ツイート保存時にユーザー情報も追加しよう.merge(user_id: current_user.id)
    # params.require(:tweet).permit(:name, :image, :text).merge(user_id: current_user.id)
  end
  # def move_to_index
    # unless user_signed_in?
      # redirect_to action: :index
    # end
  # end
  def set_prototype
    @prototype = Prototype.find(params[:id])
  end

  def contributor_confirmation 
     redirect_to root_path unless current_user == @prototype.user
  end


end
