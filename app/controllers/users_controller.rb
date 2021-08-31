class UsersController < ApplicationController
  def show
    user = User.find(params[:id])
    @name = user.name
    @prototypes = user.prototypes 
    
  end
  def index
    @prototypes = Prototype.includes(:user)
    @user = User.new
    @current_user = User.find(params[:id])
    @name = current_user.name

  end

end
