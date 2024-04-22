## enjoy_controllers_public_sessions_顧客ログイン

# frozen_string_literal: true

class Public::SessionsController < Devise::SessionsController
  ## before_action :authenticate_customer!

  ## これがないと倫理削除に引っかからない
  before_action :customer_state, only: [:create]
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
    root_path
  end
  ## ゲストログインを定義
  def guest_sign_in
    ## "email"属性で,"customer"モデルのレコードを検索し見つからない場合
    ## "guest@example.com"で新しいレコードを作成し"user"へ代入する
    user = Customer.find_or_create_by!(email: "guest@example.com") do |user|
      ## ゲストユーザー情報
      user.password = SecureRandom.urlsafe_base64
      user.last_name = "tarou"
      user.first_name = "webcamp"
      user.last_name_kana = "tarou"
      user.first_name_kana = "webcamp"
      user.birth_day = "0000.00.00."
      user.nickname = "guest"
    end
    ## 作成が成功しサインインする。
    sign_in user
    ## 遷移後,メッセージを表示
    redirect_to root_path, notice: "ゲストユーザーとしてログインしました。"
  end

  ## 退会処理後のログインの規制
  private
    # アクティブであるかを判断するメソッド
    def customer_state
      # 【処理内容1】 入力されたemailからアカウントを1件取得
      @customer = Customer.find_by(email: params[:customer][:email])
      # 【処理内容2】 アカウントを取得できなかった場合、このメソッドを終了する
      return if !@customer
      # 【処理内容3】 取得したアカウントのパスワードと入力されたパスワードが一致していない場合、このメソッドを終了する
      if @customer.valid_password?(params[:customer][:password])
        ## 処理内容4】 アクティブでない会員に対する処理
        ## 既に退会済みの場合
        if @customer.is_active == false
          # 退会後の処理を行う
          # ログイン処理
          ## ログイン成功時のリダイレクト先を指定（例: ホーム画面）
          # redirect_to new_customer_session_path
          redirect_to new_customer_registration_path
          # 退会済みの場合のエラーメッセージを表示してログイン画面に戻る
          flash.now[:alert] = "退会済みのユーザーです。"
        end
      end
    end
end
