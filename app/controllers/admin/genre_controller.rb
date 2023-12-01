class Admin::GenreController < ApplicationController
  ## Enjoy_cntroller_admin_genre
  
  
  
    ## 管理者_ジャンル_新規登録画面
  def new
     
  end
  
  
    ## 管理者_ジャンル_新規登録する
  def create
      
  end
  
  
    ## 管理者_ジャンル_一覧画面
  def index
      
  end
  
  
    ## 管理者_ジャンル_編集画面
  def edit
      
  end
  
  
    ## 管理者_ジャンル_更新する
  def update
      
  end
  
  
    ## 管理者_ジャンル_削除する(単体)
  def destroy
      
        ## データ(レコード)を一件取得
      @genre = Genre.find(params[:id])
        
        ## データ（レコード）を削除
      @genre.destroy
      
        ## カート内商品一覧画面へリダイレクト
      redirect_to '/admin/genre'
        
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
