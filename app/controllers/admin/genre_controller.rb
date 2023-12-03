class Admin::GenreController < ApplicationController
  ## Enjoy_cntroller_admin_genre
  
    ## 管理者_ジャンル_新規登録画面
  def new
      
        ## インスタンス変数 = モデル名 空オブジェクト 新規作成
        ## 左の箱に右を格納
        ## インスタンス名はなんでもいい,空のオブジェクトもなんでもいい
      @genre = Genre.new
      
  end
  
  
    ## 管理者_ジャンル_新規登録する
  def create
      
          ## genre_id, name, introduction, image 格納
      @genre = Genre.new(genre_params)
        
          ## 記録保存が成功すれば投稿一覧へ
     if @genre.save
         #p "00000000000000"
         #p @sample_illustration
         
          ## 遷移先 ジャンル投稿一覧画面
        redirect_to admin_genre_index_path
          
     else ## 保存できなかった場合, :画像投稿フォーム再表示
        render :new
          
     end
      
  end
  
  
    ## 管理者_ジャンル_一覧画面,新規登録,編集機能
  def index
      
        ## インスタンス変数 = モデル名 空オブジェクト 新規作成
        ## 左の箱に右を格納
        ## インスタンス名はなんでもいい,空のオブジェクトもなんでもいい
      @genre = Genre.new
      
        ## 全サンプルイラストデータ取得
      @genre = Genre.all
      
  end
  
  
    ## 管理者_ジャンル_編集画面
  def edit
      
        ## 投稿した genre :id を取得するレコード
      @genre = Genre.find(params[:id])
      
  end
  
  
    ## 管理者_ジャンル_更新する
  def update
    
        ##アクセス制限
    ## is_matching_login_user
       
        ## インスタンス変数 = 商品_find 探す:単数でどれか一つ
        ## レコードを一つ取得？
    @genre = Genre.find(params[:id])
              
        ## 商品情報 アップデート
    if  @genre.update(genre_params)
              
        ## flash[:notice] は 投稿が成功した時だけ表示
        ## エラーメッセージでは使わない
      flash[:notice] = "You have updated user successfully."
              
        ## インスタンス変数 = ユーザー_find 探す:単数でどれか一つ  user_path(@user.id)
        ## 遷移先 '/customer' customer_path(@user.id)
      redirect_to admin_genre_index_path
              
    else
      
        ## アクションを実行しない
      render :edit
        
    end
  end
  
  
    ## 管理者_ジャンル_削除する(単体)
  def destroy
      
        ## データ(レコード)を一件取得
      @genre = Genre.find(params[:id])
        
        ## データ（レコード）を削除
      @genre.destroy
      
        ## カート内商品一覧画面へリダイレクト
      redirect_to '/admin/genre/index'
        
  end
  
  
  
  private
  
        ## 商品登録情報編集画面等で使用…
  def genre_params
        
        ## params  formから送られてくるデータはparamsの中
        ## require 送信データからモデル名(ここでは:item)を指定し、データを絞り込み
        ## permit  requireで絞り込んだデータの中から、保存を許可するカラムを指定
      params.require(:genre).permit(:name )
  end
  
  
end
