class ApplicationController < ActionController::Base
  #ログイン認証に必要なページに行く場合、ログインされていなければログイン画面へ飛ばす
  before_action :authenticate_user!, except: [:top, :about]
  before_action :configure_permitted_parameters, if: :devise_controller?

  def after_sign_in_path_for(resource)
    user_path(resource)
  end

  def after_sign_out_path_for(resource)
    root_path
  end

  protected
  def configure_permitted_parameters
    #devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
    devise_parameter_sanitizer.permit(:sign_up, keys: [:email])
    # 変更点 2. ↑の行の:name=>:emailに変更（ログイン時email=>nameで認証）

    #↓これはログイン時にemailの代わりにnameで代替できるわけではない
    #devise_parameter_sanitizer.permit(:sign_in, keys: [:name])
    #emailじゃなくてnameでログインするには'config/initializers/devise.rb'をいじるだけで良さそう。
    #もちろんusersモデルにnameのカラムを追加する必要あり
  end
end
