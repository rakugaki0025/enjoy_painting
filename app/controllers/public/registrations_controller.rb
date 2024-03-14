## enjoy_app_controllers_public_ragistrations_顧客新規登録

# frozen_string_literal: true

class Public::RegistrationsController < Devise::RegistrationsController
  ## ユーザー,ログインの前にメソッド実装
  before_action :configure_permitted_parameters, if: :devise_controller?
  ## sign_up と sign_in 注意
  ## ログイン後に遷移する場所
  ## ここでのresource はログイン,ログアウト時でしか使われない
  def after_sign_up_path_for(resource)
    ## /homes, top画面に遷移したい
    ## ここでのresource はログイン,ログアウト時でしか使われない
    ## root_pathにしないとひっかかるかも…？
    customers_my_page_path
  end
  ## ログアウト後に遷移する場所
  def after_sign_out_path_for(resource)
    ## public, root_to = homes/topに遷移
    root_path
  end

  protected
    def configure_permitted_parameters
      # メソッド ユーザー登録(sign_up)の際に、
      # ストリングパラメータと同様の機能
      devise_parameter_sanitizer.permit(:sign_up, keys:
      [:email, :last_name, :first_name, :last_name_kana,
      :first_name_kana, :nickname, :birth_day ])
    end
end
