class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    #  usersコントローラーのshowアクションにインスタンス変数@userを定義した。且つ、Pathパラメータで送信されるID値で、Userモデルの特定のオブジェクトを取得するように記述し、それを@userに代入した
    # @name = user.name
    # @prototypes = user.prototypes ←こちらだとエラーになってしまった
    # @name = @user.name              ←こうするとちゃんと機能してる
    @name = @user.name  
    @prototypes = @user.prototypes
    
  end

end
