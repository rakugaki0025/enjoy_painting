class Public::SearchController < ApplicationController
  ## enjoy_controllers_public_search
  
  
  before_action :authenticate_user!
  
  
  
  def search
      
      @range = params[:range]
      
      if @range == "User"
          
         @users = User.looks(params[:search], params[:word])
         
      else
          
         @books = Book.looks(params[:search], params[:word])
         
      end
  end
  
  
  
  
  
    # 投稿検索機能(キーワード検索)
  def search
      
        ## 検索キーワードの取得
      @keyword = params[:search]
        ## ジャンルの取得
      @genre = params[:genre]
        ## 
      ##@results = YourModel.where("keyword LIKE ? AND genre = ?", "%#{@keyword}%", @genre)
      @results = Post.where("keyword LIKE ? AND genre = ?", "%#{@keyword}%", @genre)
        
        # 検索結果の取得と設定
        
        # その他の処理...
        
      render :search # 検索結果を表示するビューをレンダリング
     
  end
  
  
end
