class Public::IllustrationsController < ApplicationController
    ## Enjoy_cntroller_admin_illustration
    
    
    ## イラスト投稿_新規登録画面 new_illustration_path
  def new
     
        ## インスタンス変数 = モデル名 空オブジェクト 新規作成
        ## 左の箱に右を格納
        ## インスタンス名はなんでもいい,空のオブジェクトもなんでもいい
      @illustration = Illustration.new
      
  end
  
    ## イラスト_投稿_新規情報登録する illustration_path
  def create
      
          ## genre_id, name, introduction, image 格納
      @illustration = Illustration.new(illustration_params)
      
          ## を呼び出す記述
      @illustration.customer = current_customer
      
          ## 記録保存が成功すれば投稿一覧へ
     if @illustration.save
         
          ## 遷移先 イラスト投稿_詳細画面
        redirect_to illustration_path(@illustration.id)
          
     else ## 保存できなかった場合, :画像投稿フォーム再表示
        render :new
          
     end
      
  end
  
  
    ## イラスト投稿_一覧画面 illustrations_path
  def index
      
        ## 全イラストデータ取得
      @illustrations = Illustration.all
      
        ## アソシエーションを利用して,"customer"を取得_作成日時の降順に並び替え,6件ずつ表示
      @illustrations = current_customer.illustration.order(created_at: :desc).page(params[:page]).per(6)
      
  end
  
  
    ## イラスト_投稿_詳細画面 illustration_path
  def show
      
        ## 投稿した sample_illustoration :id を取得するレコード
      @illustration = Illustration.find(params[:id])
        ## コメントを定義
      @comment = Comment.new
      
  end
  
  
    ## イラスト投稿_編集画面 edit__illustration_path
  def edit
      
        ## 投稿した sample_illustoration :id を取得するレコード
      @illustration = Illustration.find(params[:id])
      
  end
  
  
    ## イラスト_投稿_情報更新する /illustration/:id
  def update
    
        ##アクセス制限
    ## is_matching_login_user
       
        ## インスタンス変数 = 商品_find 探す:単数でどれか一つ
        ## レコードを一つ取得？
    @illustration = Illustration.find(params[:id])
              
        ## サンプル情報 アップデート
    if  @illustration.update(illustration_params)
              
        ## flash[:notice] は 投稿が成功した時だけ表示
        ## エラーメッセージでは使わない
      flash[:notice] = "You have updated user successfully."
              
        ## インスタンス変数 = ユーザー_find 探す:単数でどれか一つ  user_path(@user.id)
        ## 遷移先 '/customer' customer_path(@user.id)
      redirect_to illustration_path(@illustration.id)
              
    else
      
        ## アクションを実行しない
      render :edit
        
    end
  end
  
  
    ## イラスト_画像_削除する(単体) illustration/:id
  def destroy
      
        ## データ(レコード)を一件取得
      @illustration = Illustration.find(params[:id])
        
        ## データ（レコード）を削除
      @illustration.destroy
      
        ## イラスト一覧画面へリダイレクト
      redirect_to illustrations_path
        
  end
  
  
  
  private
  
        ## サンプル登録情報編集画面等で使用…
  def illustration_params
        
        ## params  formから送られてくるデータはparamsの中
        ## require 送信データからモデル名(ここでは:item)を指定し、データを絞り込み
        ## permit  requireで絞り込んだデータの中から、保存を許可するカラムを指定
      params.require(:illustration).permit(:genre_id, :name, :introduction, :image)
  end
  
end

