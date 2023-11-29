## enjoy_controllers_public_sessions_顧客ログイン

# frozen_string_literal: true

class Public::SessionsController < Devise::SessionsController
  
  
          ## sign_in と sign_up 注意
          ## ログイン後に遷移する場所
          ## ここでのresource はログイン,ログアウト時でしか使われない
  def after_sign_in_path_for(resource)
          
          ## /homes, top画面に遷移したい
          ## ここでのresource はログイン,ログアウト時でしか使われない
          ## root_path へ遷移
      root_path
          
  end
  
          ## ログアウト後に遷移する場所
  def after_sign_out_path_for(resource)
          
          ## public, root_to = homes/topに遷移
      new_customer_session_path
          
          
  end
  
end
