class Public::CustomersController < ApplicationController
  ## enjoy_controllers_public_customers
  
        ## いいね(ブックマーク機能)
  def liked_illustrations
        ## いいね呼び出し_customer経由で呼び出し
      @liked_illustrations = current_customer.nice_illustrations.page(params[:page]).per(6)
  end
        ## 顧客のマイページ
  def show
        ## ログイン中のユーザーレコード取得
        ## current_(models名)
      @customer = current_customer
  end
        ## 顧客の登録情報編集画面
  def edit
        ## ログイン中のユーザーレコード取得
        ## current_(models名)
      @customer = current_customer
  end
        ## 顧客の登録情報更新 information_update_path
  def update
        ## インスタンス変数 = ユーザー_find 探す:単数でどれか一つ
        ## レコードを一つ取得？
    @customer = current_customer
        ## ユーザー情報 アップデート
    if  @customer.update(customer_params)
        ## flash[:notice] は 投稿が成功した時だけ表示
        ## エラーメッセージでは使わない
      flash[:notice] = "会員情報を変更しました。"
        ## インスタンス変数 = ユーザー_find 探す:単数でどれか一つ  user_path(@user.id)
        ## 遷移先 '/customer' customer_path(@user.id)
      redirect_to customers_my_page_path
    else
        ## アクションを実行しない
      render :edit
    end
  end
        ## 顧客の退会画面
  def confirm
      
        ## ログイン中のユーザーレコード取得
        ## current_(models名)
      @customer = current_customer
      
  end
        ## 顧客の退会処理(ステータスの更新)
  def withdrow
        ## ログインユーザーの情報を代入
      @customer = current_customer
        ## ゲストログインは退会できない記述
      redirect_to root_path, notice: 'ゲストは退会処理できません' and return if @customer.guest_user?
        ## ログインユーザーを true => false へ更新処理
        ## @ユーザー.update(必要なカラム:true false の指定)
      @customer.update(is_active: false)
        ## publicは？
      reset_session
        ## 処理後のテキスト
      flash[:notice] = "退会処理を実行いたしました"
        ## 退会処理後の遷移先
      redirect_to root_path
  end
        ## 退会しているかを判断するメソッド
  protected
            ## 退会済み(false) user(customer)はログイン拒否
  def customer_state
            ## 残ったユーザー情報照合
    @customer = Customer.find_by(email: params[:customer][:email])
            ## !は反対の意味　退会済み(残ったデータ)ユーザーとの照合
    return if !@customer
            ## &&のインデントは？ 
      if  @customer.valid_password?(params[:customer][:password]) &&  (!@customer.is_active)
            flash[:alert] = "退会済みのユーザーです。"
              ## true の場合 ログインページへ遷移
            redirect_to new_customer_sessions
          
      end
  end
  
  private
  
        ## 登録情報編集画面等で使用…
  def customer_params
        ## params  formから送られてくるデータはparamsの中
        ## require 送信データからモデル名(ここでは:customer)を指定し、データを絞り込み
        ## permit  requireで絞り込んだデータの中から、保存を許可するカラムを指定
      params.require(:customer).permit(:last_name, :first_name, :last_name_kana, :first_name_kana, :nickname, :birth_day, :email, :profile_image )
  end
  
end

