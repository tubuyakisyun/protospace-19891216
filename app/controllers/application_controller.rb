class ApplicationController < ActionController::Base
  before_action :authenticate_user!, except: [:show, :index] ##except: [:show, :index] にすると、ログイン・ログアウトの状態に関わらず、各ページのユーザー名をクリックすると、ユーザーの詳細ページへ遷移すること
  before_action :configure_permitted_parameters, if: :devise_controller?
 


  private
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name,:profile,:occupation,:position])
  end
end
