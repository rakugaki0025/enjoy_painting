class Admin::CustomersController < ApplicationController
  ## emjoy_controllers_admin_customers
  
        ## 顧客一覧画面 admin_customers_path
  def index
    
        ## インスタンス変数 = モデル名 空オブジェクト 新規作成
        ## 左の箱に右を格納
        ## インスタンス名はなんでもいい,空のオブジェクトもなんでもいい
      @customer = Customer.new
      
      # @customer = Customer.find(params[:id])
      
        ## 全顧客データ取得
      @customers = Customer.all
      
  end
  
        ## 顧客詳細画面　admin_customers_show_path
  def show
      
        ## 投稿したcutomer :id を取得するレコード
      @customer = Customer.find(params[:id])
      
  end
  
        ## 顧客編集画面 admin_customers_edit_path
  def edit
    
        ## 投稿したcutomer :id を取得するレコード
      @customer = Customer.find(params[:id])
      
  end
  
        ## 顧客情報の登録 admin_customers_update_path
  def update
      
        ##アクセス制限
    ## is_matching_login_user
       
        ## インスタンス変数 = 商品_find 探す:単数でどれか一つ
        ## レコードを一つ取得？
    @customer = Customer.find(params[:id])
              
        ## 商品情報 アップデート
      if  @customer.update(customer_params)
                
          ## flash[:notice] は 投稿が成功した時だけ表示
          ## エラーメッセージでは使わない
        flash[:notice] = "会員情報を変更しました。"
                
          ## インスタンス変数 = ユーザー_find 探す:単数でどれか一つ  user_path(@user.id)
          ## 遷移先 '/customer' customer_path(@user.id)
        redirect_to admin_customers_show_path(@customer.id)
                
      else
        
          ## アクションを実行しない
        render :edit
          
      end
  
  end
  
  
  private
  
        ## 商品登録情報編集画面等で使用…
  def customer_params
        
        ## params  formから送られてくるデータはparamsの中
        ## require 送信データからモデル名(ここでは:customer)を指定し、データを絞り込み
        ## permit  requireで絞り込んだデータの中から、保存を許可するカラムを指定
      params.require(:customer).permit(:last_name, :first_name, 
      :last_name_kana, :first_name_kana, :nickname, :birth_day, 
      :email, :is_active )
      
  end
  
  
end